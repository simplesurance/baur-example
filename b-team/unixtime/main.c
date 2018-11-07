#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main(){
	time_t curTime;

	time(&curTime);

	if (curTime == ((time_t) -1)) {
		perror("time() failed");
		return -1;
	}

	printf("%ld\n", curTime);

	return 0;
}
