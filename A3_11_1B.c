/**********************************************************************************
*
* ASSIGNMENT 1B: Get and Set Environment Variables
* ------------------------------------------------
* Team          : 10
* Date          : 23-July-2025
*
* Members:
    # Roll Nos - 002311001064,002311001050,002311001039
    # Names - Samiran Chakraborty,Afham Shakeel,Sayan Dutta
*
***********************************************************************************
*
* ASSIGNMENT DETAILS:
* A C program to demonstrate the use of getenv() and setenv() system calls.
* It first retrieves and displays a list of standard environment variables.
* Then, it sets two new custom environment variables and displays them to
* verify they have been set correctly.
*
* INPUT DESCRIPTION:
* This program does not require any command-line or interactive input.
* But follows the command-line argument format to comply with guidelines.
*
* OUTPUT DESCRIPTION:
* The program first prints the values of several predefined environment
* variables (USER, HOME, PATH, etc.). If a variable is not set, it
* indicates that. Afterwards, it sets two new variables, 'COURSE' and
* 'ASSIGNMENT_NO', and prints their newly assigned values.
*
***********************************************************************************
*
* COMPILATION:
* gcc -Wall A2_10_1B.c -o A2_10_1B
*
* EXECUTION:
* ./A2_10_1B VAR1 val1 VAR2 val2
*
***********************************************************************************
*
* SAMPLE INPUT:
* (No Input)
*
* SAMPLE OUTPUT:
*
* --- Reading Environment Variables using getenv() ---
*
* USER = be2362
* HOME = /home/usr/student/ug/yr23/be2362
* HOST is not set.
* ARCH is not set.
* DISPLAY is not set.
* PRINTER is not set.
* PATH = /usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/usr/student/ug/yr23/be2362/.local/bin:/home/usr/student/ug/yr23/be2362/bin
* VAR1=val1
* VAR2=val2
*/

#include <stdio.h>
#include <stdlib.h>

void print_env_var(const char *name) {
    const char *value = getenv(name);
    if (value)
        printf("%s = %s\n", name, value);
    else
        printf("%s is not set\n", name);
}

int main(int argc, char *argv[]) {
    const char *vars[] = { "USER", "HOME", "HOST", "ARCH", "DISPLAY", "PRINTER", "PATH" };

    printf("Standard Environment Variables:\n");
    for (int i = 0; i < sizeof(vars)/sizeof(vars[0]); i++)
        print_env_var(vars[i]);

    if (argc != 5) {
        fprintf(stderr, "\nUsage: %s VAR1 VALUE1 VAR2 VALUE2\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *var1 = argv[1], *val1 = argv[2];
    const char *var2 = argv[3], *val2 = argv[4];

    if (setenv(var1, val1, 1) != 0) {
        perror("Failed to set first variable");
        return EXIT_FAILURE;
    }

    if (setenv(var2, val2, 1) != 0) {
        perror("Failed to set second variable");
        return EXIT_FAILURE;
    }

    printf("\nCustom Environment Variables:\n");
    print_env_var(var1);
    print_env_var(var2);

    return EXIT_SUCCESS;
}
