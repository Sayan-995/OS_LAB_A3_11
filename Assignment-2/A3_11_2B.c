/***************************************************************************************************
 * Name - Samiran Chakraborty, Afham Shakeel, Sayan Dutta
 * Roll - 002311001064,002311001050,002311001039
 * Team Number - 11
 * Date - 08/08/2025
 *
 *
 * Assignment Number - 2B
 * Assignment -For this assignment, we did Inter-Process Communication (IPC) using named pipes (FIFOs) along with the fork() system call. A 1GB file was transferred from the parent process to the child using one FIFO, and then sent back from the child to the parent through another. The total time taken for the round-trip transfer was measured, and the integrity of the file was verified using commands like cmp and diff. 
 *
 * Input Description - optional input flags which can be given through command line 
 *                     --size <Mb>  -> Determines the size of the file to be transferred (default 1 Gb)
 *                     --keep       -> To save storage this program automatically deletes all the created files, but they can be kept with this flag
 * 
 * Output Description - The program outputs the progress of file creation, outlines each step of FIFO-based communication, and shows the total time taken for the file transfer. It also checks and confirms whether the original file and the one received back are identical.
 *
 * Compilation command - gcc A3_11_2B.c
 * Execution command - ./a.out 
 * 
 * Sample Output - 
 * 
 * === Inter-Process Communication using Named Pipes (FIFOs) ===
 * File size: 1024MB | Keep files: No
 * Generating 1024MB test data...
 *   Generated: 100MB
 *   Generated: 200MB
 *   Generated: 300MB
 *   Generated: 400MB
 *   Generated: 500MB
 *   Generated: 600MB
 *   Generated: 700MB
 *   Generated: 800MB
 *   Generated: 900MB
 *   Generated: 1000MB
 *  Test data file created: source_data.bin
 *  Named pipes (FIFOs) created successfully
 * 
 * File listings during execution (ls -l):
 * prw-r--r-- 1 sayan sayan          0 Aug  7 19:02 data_backward
 * prw-r--r-- 1 sayan sayan          0 Aug  7 19:02 data_forward
 * -rw-r--r-- 1 sayan sayan 1073741824 Aug  7 19:02 source_data.bin
 * 
 * Starting double file transfer via FIFOs...
 * Parent Process: Sending file to Child via FIFO1...
 * Child Process: Receiving file from Parent via FIFO1...
 * Parent Process: Receiving file back from Child via FIFO2...
 * Child Process: File received, sending back to Parent via FIFO2...
 * Child Process: Double transfer completed successfully
 * 
 * === Double Transfer Results ===
 * Total time for double transfer: 1.00 seconds
 * Comparing files using cmp command...
 * Files are identical - Double transfer successful!
 * 
 * Final file listings (ls -l):
 * -rw-r--r-- 1 sayan sayan 1073741824 Aug  7 19:02 destination_data.bin
 * -rw-r--r-- 1 sayan sayan 1073741824 Aug  7 19:02 source_data.bin
 * Cleanup completed - all temporary files removed
 * 
 * Program completed successfully!
 *****************************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <string.h>
#include <time.h>
#include <signal.h>

#define CHUNK_SIZE 16384
#define DEFAULT_SIZE_MB 1024
#define SOURCE_PIPE "data_forward"
#define RETURN_PIPE "data_backward"
#define ORIGINAL_FILE "source_data.bin"
#define FINAL_FILE "destination_data.bin"
#define INTERMEDIATE_FILE "temp_storage.bin"

typedef struct {
    int size_mb;
    int keep_files;
} config_t;

void show_usage(char *prog_name) {
    printf("Usage: %s [OPTIONS]\n", prog_name);
    printf("Options:\n");
    printf("  --size <MB>   Set file size in MB (default: 1024)\n");
    printf("  --keep        Keep files after execution\n");
    printf("  --help        Show this help message\n");
}

config_t parse_arguments(int argc, char *argv[]) {
    config_t config = {DEFAULT_SIZE_MB, 0};
    
    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--size") == 0 && i + 1 < argc) {
            config.size_mb = atoi(argv[++i]);
            if (config.size_mb <= 0) {
                printf("Invalid size, using default 1024MB\n");
                config.size_mb = DEFAULT_SIZE_MB;
            }
        } else if (strcmp(argv[i], "--keep") == 0) {
            config.keep_files = 1;
        } else if (strcmp(argv[i], "--help") == 0) {
            show_usage(argv[0]);
            exit(0);
        }
    }
    
    return config;
}

void cleanup_resources(int keep_files) {
    if (!keep_files) {
        unlink(ORIGINAL_FILE);
        unlink(FINAL_FILE);
        unlink(INTERMEDIATE_FILE);
        unlink(SOURCE_PIPE);
        unlink(RETURN_PIPE);
        printf("Cleanup completed - all temporary files removed\n");
    } else {
        unlink(SOURCE_PIPE);
        unlink(RETURN_PIPE);
        printf("Named pipes removed, data files preserved\n");
        printf("\nFile listings after execution (ls -l):\n");
        system("ls -l source_data.bin destination_data.bin 2>/dev/null");
    }
}

int generate_data_file(const char* filename, int size_mb) {
    FILE *fp = fopen(filename, "wb");
    if (!fp) return -1;
    
    printf("Generating %dMB test data...\n", size_mb);
    
    char buffer[CHUNK_SIZE];
    long total_bytes = (long)size_mb * 1024 * 1024;
    long written = 0;
    
    srand(time(NULL) ^ getpid());
    
    while (written < total_bytes) {
        long remaining = total_bytes - written;
        int current_chunk = (remaining < CHUNK_SIZE) ? remaining : CHUNK_SIZE;
        
        for (int i = 0; i < current_chunk; i++) {
            buffer[i] = 'A' + (rand() % 26);
        }
        
        fwrite(buffer, 1, current_chunk, fp);
        written += current_chunk;
        
        if (size_mb >= 100 && written % (100 * 1024 * 1024) == 0) {
            printf("  Generated: %ldMB\n", written / (1024 * 1024));
        }
    }
    
    fclose(fp);
    printf("Test data file created: %s\n", filename);
    return 0;
}

int setup_named_pipes() {
    unlink(SOURCE_PIPE);
    unlink(RETURN_PIPE);
    
    if (mkfifo(SOURCE_PIPE, 0666) == -1) return -1;
    if (mkfifo(RETURN_PIPE, 0666) == -1) return -1;
    
    printf("Named pipes (FIFOs) created successfully\n");

    printf("\nFile listings during execution (ls -l):\n");
    system("ls -l data_forward data_backward source_data.bin 2>/dev/null");
    printf("\n");
    
    return 0;
}

int transfer_via_pipe(const char* source, const char* pipe_name) {
    int src_fd = open(source, O_RDONLY);
    if (src_fd == -1) return -1;
    
    int pipe_fd = open(pipe_name, O_WRONLY);
    if (pipe_fd == -1) {
        close(src_fd);
        return -1;
    }
    
    char buffer[CHUNK_SIZE];
    ssize_t bytes;
    
    while ((bytes = read(src_fd, buffer, CHUNK_SIZE)) > 0) {
        write(pipe_fd, buffer, bytes);
    }
    
    close(src_fd);
    close(pipe_fd);
    return 0;
}

int receive_via_pipe(const char* destination, const char* pipe_name) {
    int pipe_fd = open(pipe_name, O_RDONLY);
    if (pipe_fd == -1) return -1;
    
    int dest_fd = open(destination, O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (dest_fd == -1) {
        close(pipe_fd);
        return -1;
    }
    
    char buffer[CHUNK_SIZE];
    ssize_t bytes;
    
    while ((bytes = read(pipe_fd, buffer, CHUNK_SIZE)) > 0) {
        write(dest_fd, buffer, bytes);
    }
    
    close(pipe_fd);
    close(dest_fd);
    return 0;
}

int verify_data_integrity(const char* file1, const char* file2) {
    char cmd[256];
    printf("Comparing files using cmp command...\n");

    snprintf(cmd, sizeof(cmd), "cmp %s %s", file1, file2);
    int result = system(cmd);
    
    if (result == 0) {
        printf("Files are identical - Double transfer successful!\n");
        return 0;
    } else {
        printf("Files differ - Transfer verification failed!\n");
        snprintf(cmd, sizeof(cmd), "diff %s %s | head -5", file1, file2);
        printf("Differences found:\n");
        system(cmd);
        return -1;
    }
}

int main(int argc, char *argv[]) {
    config_t config = parse_arguments(argc, argv);
    
    printf("=== Inter-Process Communication using Named Pipes (FIFOs) ===\n");
    printf("File size: %dMB | Keep files: %s\n", 
           config.size_mb, config.keep_files ? "Yes" : "No");
    
    if (generate_data_file(ORIGINAL_FILE, config.size_mb) != 0) {
        printf("Failed to create test data\n");
        return 1;
    }

    if (setup_named_pipes() != 0) {
        printf("Failed to create named pipes\n");
        cleanup_resources(config.keep_files);
        return 1;
    }
    
    printf("Starting double file transfer via FIFOs...\n");

    time_t start_time = time(NULL);
    pid_t child_pid = fork();
    
    if (child_pid == 0) {
        printf("Child Process: Receiving file from Parent via FIFO1...\n");
        receive_via_pipe(INTERMEDIATE_FILE, SOURCE_PIPE);
        
        printf("Child Process: File received, sending back to Parent via FIFO2...\n");
        transfer_via_pipe(INTERMEDIATE_FILE, RETURN_PIPE);
        
        unlink(INTERMEDIATE_FILE);
        printf("Child Process: Double transfer completed successfully\n");
        exit(0);
        
    } else if (child_pid > 0) {
        printf("Parent Process: Sending file to Child via FIFO1...\n");
        transfer_via_pipe(ORIGINAL_FILE, SOURCE_PIPE);
        
        printf("Parent Process: Receiving file back from Child via FIFO2...\n");
        receive_via_pipe(FINAL_FILE, RETURN_PIPE);
        
        int status;
        wait(&status);
        
        time_t end_time = time(NULL);
        double transfer_time = difftime(end_time, start_time);
        
        printf("\n=== Double Transfer Results ===\n");
        printf("Total time for double transfer: %.2f seconds\n", transfer_time);
        
        verify_data_integrity(ORIGINAL_FILE, FINAL_FILE);
        
        printf("\nFinal file listings (ls -l):\n");
        system("ls -l source_data.bin destination_data.bin 2>/dev/null");
        
        cleanup_resources(config.keep_files);
        printf("\nProgram completed successfully!\n");
        
    } else {
        printf("Fork failed to create child process\n");
        cleanup_resources(config.keep_files);
        return 1;
    }
    
    return 0;
}