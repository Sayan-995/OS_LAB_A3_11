/****************************************************************************************
 * Name - Samiran Chakraborty, Afham Shakeel, Sayan Dutta
 * Roll - 002311001064,002311001050,002311001039
 * Team Number - 11
 * Date - 08/08/2025
 *
 * 
 * Assignment Number - 2A
 * Assignment - For this, we wrote a C program to handle the SIGINT signal using the signal() system call. When Ctrl+C is pressed, display “Ha Ha, Not Stopping” instead of terminating. Used perror() to handle errors during signal registration.
 *
 * Input Description - <none>
 * Output Description - Program maintains execution loop, [Ctrl+C] triggers "Ha Ha, Not Stopping" output without stopping, [Ctrl+\] performs exit.
 *
 * Compilation command - gcc A3_11_2A.c
 * Execution command - ./a.out
 *
 *   Sample Output - 
 * 
 *  Process is active... Try Ctrl+C to trigger signal handling
 *  Use Ctrl+\ to terminate the process
 *  Process ID: 3445
 *
 *  Execution cycle: 1
 *  Execution cycle: 2
 *  Execution cycle: 3
 *  ^C
 *  Ha Ha, Not Stopping
 *  Execution cycle: 4
 *  Execution cycle: 5
 *  ^C
 *  Ha Ha, Not Stopping
 *  Execution cycle: 6
 *  ^C
 *  Ha Ha, Not Stopping
 *  Execution cycle: 7
 *  ^C
 *  Ha Ha, Not Stopping
 *  Execution cycle: 8
 *  ^C
 *  Ha Ha, Not Stopping
 *  Execution cycle: 9
 *  ^C
 *  Ha Ha, Not Stopping
 *  Execution cycle: 10
 *  ^\Quit (core dumped)
 *
 * **************************************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>

void interrupt_signal_handler(int signal_num) {
    printf("\nHa Ha, Not Stopping\n");
}

int main() {
    setvbuf(stdout, NULL, _IONBF, 0);
    if (signal(SIGINT, interrupt_signal_handler) == SIG_ERR) {
        perror("signal registration failed");
        exit(EXIT_FAILURE);
    }
    printf("Process is active... Try Ctrl+C to trigger signal handling\n");
    printf("Use Ctrl+\\ to terminate the process\n");
    printf("Process ID: %d\n\n", getpid());

    int counter = 1;
    for(;;) {
        printf("Execution cycle: %d\n", counter++);
        sleep(2);
    }

    return EXIT_SUCCESS;
}