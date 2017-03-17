#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/tcp.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/epoll.h>
#include <fcntl.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>

#define MAX_CONN  1024
#define TCP_ADDR  "127.0.0.1" 
#define TCP_PORT  5656
#define BACK_LOG  5   /*listen backlog*/
#define TIME_OUT  200 /*ms*/
#define SOCK_RECV_BUFF  (50 * 1024 * 1024)  
#define SOCK_SEND_BUFF  (50 * 1024 * 1024)

#define RECV_MSG_LEN 1024
static char s_recv_msg[RECV_MSG_LEN + 1] = {0};

int create_listen_fd();

void handle_listen_fd(int lsfd, int epfd);

void handle_client_fd(int clfd, int epfd);

int main(int argc, char *argv[], char *env[])
{
	printf("server application start...\n");
	int epfd = epoll_create(MAX_CONN);
	if (epfd < 0) {
		perror("epoll_create error");
		exit(-1); 
	}

	printf("create listen socket...\n");
	int lsfd = create_listen_fd();
	if (lsfd < 0) {
		perror("create listen fd error");
		exit(-1);
	}	
	struct epoll_event lsev;
	lsev.events = EPOLLIN; // | EPOLLET;
	lsev.data.fd = lsfd;
	
	int ret = epoll_ctl(epfd, EPOLL_CTL_ADD, lsfd, &lsev);
	if (ret < 0) {
		perror("epoll_crt error");
		exit(-1);
	} 
	
	bool brun = true;
	struct epoll_event pllist[MAX_CONN] = {0};

	while(brun) {

		int cnt = epoll_wait(epfd, pllist, MAX_CONN, TIME_OUT); 
	
		if (cnt < 0) {
			if (EINTR == errno) 
				continue;
            else 
				break;
		}

		for (int i = 0; i < cnt; ++i) {
			if (lsfd == pllist[i].data.fd) {
				if (pllist[i].events & EPOLLERR) {
					perror("listen fd error");
					brun = false;
					ret = epoll_ctl(epfd, EPOLL_CTL_DEL, lsfd, &lsev);
					if (ret < 0) {
						printf("remove listen fd:%d from epoll error:%s\n",
							lsfd, strerror(errno));
					}
					close(lsfd);
					break;
				}
				
				if (pllist[i].events & EPOLLIN) {
					handle_listen_fd(lsfd, epfd);
					continue;
				}

				printf("\nlisten fd:%d has other events(%d)\n", lsfd, 
					pllist[i].events);
				continue;
			}

			if (pllist[i].events & EPOLLERR) {
				printf("fd:%d error %s\n", pllist[i].data.fd, 
					strerror(errno));
				continue;
			}
		    
			if (pllist[i].events & EPOLLIN) {
				handle_client_fd(pllist[i].data.fd, epfd);	
				continue;
			}	

			printf("\nclient fd:%d has other events(%d)\n", pllist[i].data.fd,
				pllist[i].events);
		}		
	}
	
	printf("server application exit!\n");
	return 0;
}

int create_listen_fd()
{
	int lsfd = socket(AF_INET, SOCK_STREAM, 0);
	if (lsfd < 0) {
		perror("create listen socket error");
		return -1;
	}
	printf("create listen fd:%d success\n", lsfd);
	
	int opt = 1;
	setsockopt(lsfd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof opt); 

	int flag = fcntl(lsfd, F_GETFD, 0);
    flag = (flag < 0) ? O_NONBLOCK : (flag | O_NONBLOCK);
    if (fcntl(lsfd, F_SETFD, flag) < 0) {
        printf("fd:%d set nonblock error:%s\n", lsfd,
            strerror(errno));
    }
	printf("set listen fd nonblock and reuseaddr\n");	

	struct sockaddr_in srvaddr = {0};
	srvaddr.sin_family = AF_INET;
	srvaddr.sin_addr.s_addr = inet_addr(TCP_ADDR);
	srvaddr.sin_port = htons(TCP_PORT);

	int ret = bind(lsfd, (struct sockaddr *)&srvaddr, sizeof srvaddr);
	if (ret < 0) {
		printf("listen fd:%d bind error:%s\n", lsfd, 
			strerror(errno));
		close(lsfd);
		return -1;
	}
	printf("bind listen fd success (ip:%s port:%d)\n", TCP_ADDR, TCP_PORT);
	
	ret = listen(lsfd, BACK_LOG);
	if (ret < 0) {
		printf("listen fd:%d listen error:%s\n", lsfd,
			strerror(errno));
		close(lsfd);
		return -1;
	}
	printf("start to listen\n");	

	return lsfd;
}

void handle_listen_fd(int lsfd, int epfd)
{
	struct sockaddr_in claddr;
	socklen_t socklen = sizeof claddr;
	int clfd = accept(lsfd, (struct sockaddr *)&claddr, &socklen);
	if (clfd < 0) {
		printf("accept error %s\n", strerror(errno));
		return;
	}

	printf("receive new client(ip:%s port:%d)\n", inet_ntoa(
		claddr.sin_addr), ntohs(claddr.sin_port));

	int opt = 1;
	if (setsockopt(clfd, IPPROTO_TCP, TCP_NODELAY, &opt, sizeof opt) < 0) {
		printf("\nclient fd:%d set tcp nodelay error:%s\n", clfd, 
			strerror(errno));
		close(clfd);
	}

	opt = 1;
	if (setsockopt(clfd, IPPROTO_TCP, TCP_QUICKACK, &opt, sizeof opt) < 0) {
		printf("\nclient fd:%d set tcp quick ack error:%s\n", clfd,
			strerror(errno));
		close(clfd);
	} 

	struct epoll_event clev;
	clev.events = EPOLLIN; // | EPOLLET;
	clev.data.fd = clfd;

	int ret = epoll_ctl(epfd, EPOLL_CTL_ADD, clfd, &clev);
	if (ret < 0) {
		perror("epoll_ctl add new client error");
		close(clfd);
	}
}

void handle_client_fd(int clfd, int epfd)
{
	int ret = recv(clfd, s_recv_msg, RECV_MSG_LEN, 0);

	if (ret < 0) {
		printf("recv error fd:%d error:%s\n", clfd, strerror(errno));
	}

	if (0 == ret) {
		printf("fd:%d has closed, remove from epoll!\n", clfd);
	}
	
	if (ret <= 0) {
		struct epoll_event clev;
		clev.events = EPOLLIN;
		clev.data.fd = clfd;
		ret = epoll_ctl(epfd, EPOLL_CTL_DEL, clfd, &clev);
		if (ret < 0) {
			printf("remove fd:%d from epoll error:%s\n", clfd, 
				strerror(errno));
		}
		close(clfd);
		return;	
	}
	
	if (ret > RECV_MSG_LEN) {
		printf("\nrecv client msg len:%d long than %d\n", ret, 
			RECV_MSG_LEN);
		ret = RECV_MSG_LEN;
	}
	s_recv_msg[ret] = '\0';

	struct sockaddr_in claddr;
	socklen_t len = sizeof claddr;
	getpeername(clfd, (struct sockaddr *)&claddr, &len);
	
	printf("receive fd:%d msg:%s len:%d (ip:%s port:%d)\n", clfd, s_recv_msg,
		ret, inet_ntoa(claddr.sin_addr), ntohs(claddr.sin_port));	

	usleep(100000);	
}


