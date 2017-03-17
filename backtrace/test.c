#include <stdio.h>
#include <stdlib.h>
#include <execinfo.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>

static void signal_catch(int signo);
static void trace_stack();

int main(int argc, char *argv[], char *env[])
{
	/*set signal catch fun*/
	if (SIG_ERR == signal(SIGSEGV, signal_catch)) {
		printf("signal call error(%s)\n", 
			strerror(errno));
		return 0;
	}		

	/*trace stack for example*/
	trace_stack();

	/*segment fault*/
	//*(volatile int *)0x0 = 0;

	getchar();
	return 0;
}

void trace_stack() 
{	
	const int size = 100;
	void *array[size];
	char **str;
	int cnt = 0, i = 0;

	cnt = backtrace(array, size);
    
    /*backtrace_symbols_fd compare to backtrace_symbols*/
	//backtrace_symbols_fd(array, cnt, STDOUT_FILENO);

	str = backtrace_symbols(array, cnt);

    if (!str) {
		printf("get char array point error(%s)", 
			strerror(errno));
		return;
	}

	for (i = 0; i < cnt; ++i) {
		printf("[%d]: %s\n", i, str[i]);
	}

	free(str);
}

void signal_catch(int signo)
{
	printf("signal number: %d\n", signo);

	trace_stack();
}
