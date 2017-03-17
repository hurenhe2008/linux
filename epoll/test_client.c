#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <netinet/tcp.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <time.h>
#include <unistd.h>
#include <errno.h>
#include <signal.h>

#define SERVER_IP_ADDR "127.0.0.1"
#define SERVER_IP_PORT 5656

#define CLIENT_SEND_MSG "hello server,I am client! "
#define CLIENT_FAST_SEND_PACK_NUMBER  20

static unsigned int s_send_msg_cnt = 0;
static char s_send_msg[50] = {0};

static void catch_signal(int signno);

static int create_client_fd();

static bool send_msg(int fd);

int main(int argc, char *argv[], char *env[])
{
	printf("client application start...\n");

	struct timeval tv;	

	signal(SIGKILL, catch_signal);
	signal(SIGSTOP, catch_signal);
	signal(SIGQUIT, catch_signal);
		
	int clfd = create_client_fd();
	if (clfd < 0) {
		printf("create client socket failed, exit!\n");
		exit(-1);
	}	
	
	int sleep_time = 0; /*3 to sleep*/		
	while(true) {
	
		gettimeofday(&tv, NULL);
		fprintf(stdout, "time: %ld %ld\n", tv.tv_sec, tv.tv_usec);

		if (!send_msg(clfd)) {
			printf("client send message error, break!\n");
			break;
		}

		++sleep_time;
		if (CLIENT_FAST_SEND_PACK_NUMBER < sleep_time) {
			sleep_time = 0;
			usleep(10000);
		}

		//usleep(10000);		
	}

	printf("client application exit...\n");
	return 0;
}

void catch_signal(int signno) 
{
	switch(signno) 
	{
	case SIGKILL:
		printf("receive SIGKILL signal\n");	
		break;

	case SIGSTOP:
		printf("receive SIGSTOP signal\n");
		break;
	
	case SIGQUIT:
		printf("receive SIGQUIT signal\n");
		break;
	}
}

int create_client_fd()
{
	int clfd = socket(AF_INET, SOCK_STREAM, 0);
	if (clfd < 0) {
		perror("create client socket error");
		return -1;
	}

	int opt = 0;
	setsockopt(clfd, IPPROTO_TCP, TCP_NODELAY, &opt, sizeof opt);
	
	int flag = fcntl(clfd, F_GETFD, 0);
	flag = (flag < 0) ? O_NONBLOCK : (flag | O_NONBLOCK);
	int ret = fcntl(clfd, F_SETFD, flag);
	if (ret < 0) {
		perror("set client socket nonblock error");
		close(clfd);
		return -1;
	}

	struct sockaddr_in srvaddr = {0};
	srvaddr.sin_family = AF_INET;
	srvaddr.sin_addr.s_addr = inet_addr(SERVER_IP_ADDR);
	srvaddr.sin_port = htons(SERVER_IP_PORT);

	ret = connect(clfd, (struct sockaddr *)&srvaddr, 
		sizeof srvaddr);
	if (ret < 0) {
		perror("connect to server error");
		close(clfd);
		return -1;
	}
	
	return clfd;
}

bool send_msg(int fd)
{
	++s_send_msg_cnt;	
	
	snprintf(s_send_msg, sizeof s_send_msg,  "%d: %s", s_send_msg_cnt,
		CLIENT_SEND_MSG); 

	int ret = send(fd, s_send_msg, strlen(s_send_msg), 0);

	//++s_send_msg_cnt;
	//s_send_msg[0] = '\0';
	//int ret = send(fd, CLIENT_SEND_MSG, strlen(CLIENT_SEND_MSG), 0);
	if (ret < 0) {
		if (errno == EAGAIN) {
			perror("send socket buffer is full");
			return true;
		}

		perror("send message error");
		return false;
	}	
	
	//printf("send message(%s) len(%d) success\n", CLIENT_SEND_MSG, ret);
	printf("msg: %s  len:%d\n", s_send_msg, strlen(s_send_msg));
	return true;
}
