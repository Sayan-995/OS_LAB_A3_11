# !/bin/bash

#####################################################################################
# Assignment - 1a
# Assignment Description - Familiarity with User and System level OS Commands
# Group - A3
# Team No - 11
# Roll Nos - 0023110010__,0023110010__,002311001039
# Names - Samiran Chakraborty,Afham Shakeel,Sayan Dutta
# Date - 26/07/2025
#####################################################################################



# 1)who - It displays the information about all the users who have logged into the system Currently
# who
# output
# (unknown) :0           2024-10-21 11:46 (:0)
# root     pts/0        2025-07-22 11:15 (172.16.5.159)
# be2304   pts/1        2025-07-22 15:47 (172.16.4.230)
# be2311   pts/3        2025-07-22 15:49 (172.16.4.231)
# be2303   pts/4        2025-07-22 16:44 (172.16.4.227)
# be2382   pts/7        2025-07-22 16:06 (172.16.4.207)
# be2339   pts/8        2025-07-22 16:07 (172.16.4.216)
# be2337   pts/9        2025-07-22 16:07 (172.16.4.210)
# be2330   pts/10       2025-07-22 16:07 (172.16.4.203)
# be2392   pts/12       2025-07-22 16:08 (172.16.4.201)
# be2390   pts/13       2025-07-22 16:11 (172.16.4.212)
# be2350   pts/14       2025-07-22 16:12 (172.16.4.209)
# be2314   pts/15       2025-07-22 16:52 (172.16.4.205)
# be2342   pts/16       2025-07-22 16:19 (172.16.4.215)
# be2313   pts/18       2025-07-22 16:22 (172.16.4.228)
# be2394   pts/19       2025-07-22 16:54 (172.16.4.217)
# be2330   pts/20       2025-07-22 16:36 (172.16.4.203)
# be2364   pts/21       2025-07-22 16:55 (172.16.4.204)

# 2)whoami - It displays Current username, Terminal number, date and time at which user logged into the system
# whoami
# output
# be2350

# 3)pwd -  It displays current working directory
# pwd
# output
# /home/usr/student/ug/yr23/be2350/OS_Lab/Ass1

# 4)date – Shows system date and time.
# date
# output
# Sat Jul 26 11:36:07 UTC 2025

# 5)ls - Lists files and directories.
# ls
# output
# f1.text              f2.text              

# 6)mkdir – Creates new directory if not exist already
# mkdir File2 && ls
# output
# f1.text              f2.text  
# File2

# 7)clear - It clears the screen
# clear
# output

# 8)cd – Changes the working directory.
# pwd && cd File2 && pwd
# output
# /home/sayan
# /home/sayan/File2

# 9)df – Shows disk space usage of mounted filesystems
# df
# output
# Filesystem                   1K-blocks      Used  Available Use% Mounted on
# /dev/mapper/scientific-root   52399104  27794936   24604168  54% /
# devtmpfs                      32758584         0   32758584   0% /dev
# tmpfs                         32774652     10340   32764312   1% /dev/shm
# tmpfs                         32774652    789324   31985328   3% /run
# tmpfs                         32774652         0   32774652   0% /sys/fs/cgroup
# /dev/sda2                      1039616    238088     801528  23% /boot
# /dev/mapper/scientific-home 2256669952 136333924 2120336028   7% /home
# tmpfs                          6554932        16    6554916   1% /run/user/42
# tmpfs                          6554932         0    6554932   0% /run/user/3067
# tmpfs                          6554932         0    6554932   0% /run/user/3097
# tmpfs                          6554932         0    6554932   0% /run/user/3014
# tmpfs                          6554932         0    6554932   0% /run/user/3107
# tmpfs                          6554932         0    6554932   0% /run/user/3218
# tmpfs                          6554932         0    6554932   0% /run/user/3213
# tmpfs                          6554932         0    6554932   0% /run/user/3271
# tmpfs                          6554932         0    6554932   0% /run/user/3292
# tmpfs                          6554932         0    6554932   0% /run/user/3211
# tmpfs                          6554932         0    6554932   0% /run/user/3209
# tmpfs                          6554932         0    6554932   0% /run/user/3223
# tmpfs                          6554932         0    6554932   0% /run/user/3275

# 10)rmdir – Deletes an empty directory.
# rmdir -v File2
# output
# rmdir: removing directory, 'File2'

# 11)cat – Displays file contents. Usage: cat filename
# echo "We are in os lab" > f1.text && cat f1.text
# output
# We are in os lab

# 12)cp – Copies files from source to destination
# echo "We are in os lab" > f1.text && touch f2.text && cp -v f1.text f2.text && cat f2.text
# output
# 'f1.text' -> 'f2.text'
# We are in os lab

# 13)mv – Renames or moves files from old location to new location
# mkdir mydir && mkdir nwdir && touch mydir/file1.text && mv -v mydir/file1.text nwdir && ls nwdir
# output
# renamed 'mydir/file1.text' -> 'nwdir/file1.text'
# file1.text


# 14)rm – Deletes a file. 
# touch myfile.text && rm -v myfile.text
# output
# removed 'myfile.text'

# 15)stat – Shows detailed file or filesystem status.
# touch myfile.text && stat myfile.text
# output
# File: myfile.text
# Size: 0               Blocks: 0          IO Block: 4096   regular empty file
# Device: 8,48    Inode: 12512       Links: 1
# Access: (0644/-rw-r--r--)  Uid: ( 1000/   sayan)   Gid: ( 1000/   sayan)
# Access: 2025-07-26 11:58:49.144038619 +0000
# Modify: 2025-07-26 11:58:49.144038619 +0000
# Change: 2025-07-26 11:58:49.144038619 +0000
# Birth: 2025-07-26 11:58:49.144038619 +0000

# 16)ln – Creates hard or symbolic links.
# echo -e "we are learning os">newFile.text && ln newFile.text link.text && cat link.text
# output
# we are learning os

# 17)tty – Prints terminal device file name.
# output
# /dev/pts/21


# 18)uname – Displays system information.
# uname -a
# output
# Linux DESKTOP-4RAC6FA 6.6.87.1-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Mon Apr 21 17:08:54 UTC 2025 x86_64 x86_64 x86_64 GNU/Linux

# 19)umask – It specifies user file creation mask, implying which of the 3 permissions are to be denied to the owner,group and others.
# output
# 0022

# 20)find – Locates files within directory trees.
# mkdir mydir && touch mydir/a.text mydir/b.text && find mydir
# output
# mydir
# mydir/a.text
# mydir/b.text

# 21)sort – It sorts the lines of text files
# echo -e "Sayan loves python\nSamiran loves Javascript\nAfham loves C++\n">f1.text && echo -e "before sorting\n" && cat f1.text&& echo -e "after sorting\n" && sort f1.text
# output
# before sorting

# Sayan loves python
# Samiran loves Javascript
# Afham loves C++

# after sorting


# Afham loves C++
# Samiran loves Javascript
# Sayan loves python

# 22)ps - It displays information about the current processes.
# ps -ely
# output
# S   UID   PID  PPID  C PRI  NI   RSS    SZ WCHAN  TTY          TIME CMD
# S     0     1     0  0  80   0  7592 48611 ep_pol ?        00:29:16 systemd
# S     0     2     0  0  80   0     0     0 kthrea ?        00:00:25 kthreadd
# S     0     3     2  0  80   0     0     0 smpboo ?        06:00:10 ksoftirqd/0
# S     0     8     2  0 -40   -     0     0 smpboo ?        00:00:04 migration/0
# S     0     9     2  0  80   0     0     0 rcu_gp ?        00:00:00 rcu_bh
# S     0    10     2  0  80   0     0     0 rcu_gp ?        05:27:29 rcu_sched
# S     0    11     2  0 -40   -     0     0 smpboo ?        00:01:06 watchdog/0
# S     0    12     2  0 -40   -     0     0 smpboo ?        00:01:05 watchdog/1
# S     0    13     2  0 -40   -     0     0 smpboo ?        00:00:13 migration/1
# S     0    14     2  0  80   0     0     0 smpboo ?        04:20:50 ksoftirqd/1
# S     0    16     2  0  60 -20     0     0 worker ?        00:00:00 kworker/1:0H
# S     0    17     2  0 -40   -     0     0 smpboo ?        00:01:00 watchdog/2
# S     0    18     2  0 -40   -     0     0 smpboo ?        00:00:08 migration/2
# S     0    19     2  0  80   0     0     0 smpboo ?        03:20:43 ksoftirqd/2
# S     0    21     2  0  60 -20     0     0 worker ?        00:00:00 kworker/2:0H
# S     0    22     2  0 -40   -     0     0 smpboo ?        00:00:59 watchdog/3
# S     0    23     2  0 -40   -     0     0 smpboo ?        00:00:06 migration/3
# S     0    24     2  0  80   0     0     0 smpboo ?        02:47:21 ksoftirqd/3
# S     0    26     2  0  60 -20     0     0 worker ?        00:00:00 kworker/3:0H
# S     0    27     2  0 -40   -     0     0 smpboo ?        00:01:01 watchdog/4
# S     0    28     2  0 -40   -     0     0 smpboo ?        00:00:02 migration/4
# S     0    29     2  0  80   0     0     0 smpboo ?        04:03:32 ksoftirqd/4
# S     0    31     2  0  60 -20     0     0 worker ?        00:00:00 kworker/4:0H
# S     0    33     2  0 -40   -     0     0 smpboo ?        00:00:56 watchdog/5
# S     0    34     2  0 -40   -     0     0 smpboo ?        00:00:10 migration/5
# S     0    35     2  0  80   0     0     0 smpboo ?        03:33:41 ksoftirqd/5
# S     0    37     2  0  60 -20     0     0 worker ?        00:00:00 kworker/5:0H
# S     0    38     2  0 -40   -     0     0 smpboo ?        00:00:56 watchdog/6
# S     0    39     2  0 -40   -     0     0 smpboo ?        00:00:03 migration/6
# S     0    40     2  0  80   0     0     0 smpboo ?        02:55:18 ksoftirqd/6
# S     0    42     2  0  60 -20     0     0 worker ?        00:00:00 kworker/6:0H
# S     0    43     2  0 -40   -     0     0 smpboo ?        00:00:59 watchdog/7
# S     0    44     2  0 -40   -     0     0 smpboo ?        00:00:02 migration/7
# S     0    45     2  0  80   0     0     0 smpboo ?        02:34:17 ksoftirqd/7
# S     0    47     2  0  60 -20     0     0 worker ?        00:00:00 kworker/7:0H
# S     0    48     2  0 -40   -     0     0 smpboo ?        00:01:00 watchdog/8
# S     0    49     2  0 -40   -     0     0 smpboo ?        00:00:05 migration/8
# S     0    50     2  0  80   0     0     0 smpboo ?        01:48:17 ksoftirqd/8
# S     0    53     2  0 -40   -     0     0 smpboo ?        00:01:00 watchdog/9
# S     0    54     2  0 -40   -     0     0 smpboo ?        00:00:04 migration/9

# 23)chmod 777 file1 - gives full permission to owner, group in which the owner is in and everybody else accessing the machine
# chmod 777 f1.text && ls f1.text -l
# output
# -rwxrwxrwx 1 sayan sayan 61 Jul 26 10:30 f1.text

# 24)grep - It finds specific patterns in files.
# echo -e "one\nonce\ntwice\n">f1.text && grep "on" f1.text
# output
# one
# once

# 25)touch - It creates an empty file or updates the timestamp of an existing file.
# mkdir nwdir && touch nwdir/f2.text && ls nwdir
# output
# f2.text

# 26)more/less - It displays file content one screen at a time, allowing us to scroll.
# printf "Random text number %s\n" {1..20} > f1.text && more f1.text
# output
# Random text number 1
# Random text number 2
# Random text number 3
# Random text number 4
# Random text number 5
# Random text number 6
# Random text number 7
# Random text number 8
# Random text number 9
# Random text number 10
# Random text number 11
# Random text number 12
# Random text number 13
# Random text number 14
# Random text number 15
# Random text number 16
# Random text number 17
# Random text number 18
# --More--(89%)
# ###########################################
# less f1.text
# output
# Random text number 1
# Random text number 2
# Random text number 3
# Random text number 4
# Random text number 5
# Random text number 6
# Random text number 7
# Random text number 8
# Random text number 9
# Random text number 10
# Random text number 11
# Random text number 12
# Random text number 13
# Random text number 14
# Random text number 15
# Random text number 16
# Random text number 17
# Random text number 18
# f1.text

# 27)head/tail - It displays First/Last 10 lines of a File
# printf "Random text number %s \n" {1..20} > f1.text && head f1.text
# output
# Random text number 1
# Random text number 2
# Random text number 3
# Random text number 4
# Random text number 5
# Random text number 6
# Random text number 7
# Random text number 8
# Random text number 9
# Random text number 10
# ######################
# tail f1.text
# output
# Random text number 11
# Random text number 12
# Random text number 13
# Random text number 14
# Random text number 15
# Random text number 16
# Random text number 17
# Random text number 18
# Random text number 19
# Random text number 20

# 28)top - It dynamically displays real-time information about system statistics.
# top
# output
# top - 17:32:17 up 274 days,  5:45, 23 users,  load average: 0.00, 0.01, 0.05
# Tasks: 396 total,   3 running, 386 sleeping,   4 stopped,   0 zombie
# %Cpu(s):  0.1 us,  0.1 sy,  0.0 ni, 99.7 id,  0.1 wa,  0.0 hi,  0.0 si,  0.0 st
# KiB Mem : 65549308 total, 53840540 free,  2375200 used,  9333568 buff/cache
# KiB Swap: 32899068 total, 32899068 free,        0 used. 61629672 avail Mem 

#   PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND             
# 28867 be2342    20   0  119680   2408   1060 S   1.0  0.0   0:00.03 man                 
#   927 root      20   0    4368    672    524 S   0.3  0.0  23:57.01 rngd                
#     1 root      20   0  194444   7592   3988 S   0.0  0.0  29:16.73 systemd             
#     2 root      20   0       0      0      0 S   0.0  0.0   0:25.55 kthreadd            
#     3 root      20   0       0      0      0 S   0.0  0.0 360:10.19 ksoftirqd/0         
#     8 root      rt   0       0      0      0 S   0.0  0.0   0:04.42 migration/0         
#     9 root      20   0       0      0      0 S   0.0  0.0   0:00.00 rcu_bh              
#    10 root      20   0       0      0      0 R   0.0  0.0 327:29.82 rcu_sched           
#    11 root      rt   0       0      0      0 S   0.0  0.0   1:06.82 watchdog/0          
#    12 root      rt   0       0      0      0 S   0.0  0.0   1:05.74 watchdog/1          
#    13 root      rt   0       0      0      0 S   0.0  0.0   0:13.28 migration/1         
#    14 root      20   0       0      0      0 S   0.0  0.0 260:50.16 ksoftirqd/1         
#    16 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/1:0H        
#    17 root      rt   0       0      0      0 S   0.0  0.0   1:00.06 watchdog/2          
#    18 root      rt   0       0      0      0 S   0.0  0.0   0:08.14 migration/2         
#    19 root      20   0       0      0      0 S   0.0  0.0 200:43.17 ksoftirqd/2         
#    21 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/2:0H        
#    22 root      rt   0       0      0      0 S   0.0  0.0   0:59.06 watchdog/3          
#    23 root      rt   0       0      0      0 S   0.0  0.0   0:06.01 migration/3 

# 29)kill - It terminates a Process.
# ps -p 1317 && kill 1317 && echo -e "\nafter killing\n"&&  ps -p 1317
# output
# PID TTY          TIME CMD
# 1317 pts/0    00:00:00 sleep

# after killing

# PID TTY          TIME CMD
# [2]+  Terminated              sleep 100

# 30)history - It displays a list of previously executed commands.
# history
# output
# 314  printf "Random text number %s \n" {1..20} > f1.text && more f1.text
# 315  less f1.text
# 316  printf "Random text number %s \n" {1..20} > f1.text && head f1.text
# 317  tail f1.text
# 318  man ps
# 319  ps -e
# 320  sleep 1000 &
# 321  sleep 1000 & | awk '$2'
# 322  sleep 1000 & && echo $! | awk '$2'
# 323  sleep 1000 & echo $!
# 324  ps -ety
# 325  man ps
# 326  ps -p 1298 && kill 1298
# 327  sleep 100 &
# 328  ps -p 1317 && kill 1317 && echo -e "after killing\n"&&  ps -p 1317
# 329  history

# 31)du - It estimates file space usage (of a file or directory).
# du
# output
# 84      ./.cache/pip/http-v2/7/b/6
# 88      ./.cache/pip/http-v2/7/b
# 156     ./.cache/pip/http-v2/7
# 64      ./.cache/pip/http-v2/b/8/6/2/6
# 68      ./.cache/pip/http-v2/b/8/6/2
# 72      ./.cache/pip/http-v2/b/8/6
# 76      ./.cache/pip/http-v2/b/8
# 80      ./.cache/pip/http-v2/b
# 16      ./.cache/pip/http-v2/f/d/5/f/3
# 20      ./.cache/pip/http-v2/f/d/5/f
# 24      ./.cache/pip/http-v2/f/d/5
# 28      ./.cache/pip/http-v2/f/d
# 32      ./.cache/pip/http-v2/f
# 12      ./.cache/pip/http-v2/9/2/e/f/7
# 16      ./.cache/pip/http-v2/9/2/e/f
# 20      ./.cache/pip/http-v2/9/2/e
# 24      ./.cache/pip/http-v2/9/2
# 54744   ./.cache/pip/http-v2/9/6/b/8/c
# 54748   ./.cache/pip/http-v2/9/6/b/8
# 54752   ./.cache/pip/http-v2/9/6/b
# 54756   ./.cache/pip/http-v2/9/6
# 92      ./.cache/pip/http-v2/9/4/5/2/4
# 96      ./.cache/pip/http-v2/9/4/5/2
# 100     ./.cache/pip/http-v2/9/4/5
# 104     ./.cache/pip/http-v2/9/4
# 54888   ./.cache/pip/http-v2/9
# 66236   ./.cache/pip/http-v2
# 66240   ./.cache/pip
# 66800   ./.cache
# 4       ./.docker/run
# 16      ./.docker/desktop/log/host
# 20      ./.docker/desktop/log
# 24      ./.docker/desktop
# 36      ./.docker
# 608288  .

# 32)ping – Checks connectivity with another host.
# ping gmail.com
# output
# PING gmail.com (142.250.192.69) 56(84) bytes of data.
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=1 ttl=116 time=35.3 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=2 ttl=116 time=35.4 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=3 ttl=116 time=35.1 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=4 ttl=116 time=35.8 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=5 ttl=116 time=36.8 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=6 ttl=116 time=36.6 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=7 ttl=116 time=39.4 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=8 ttl=116 time=37.7 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=9 ttl=116 time=37.2 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=10 ttl=116 time=36.1 ms
# 64 bytes from bom12s16-in-f5.1e100.net (142.250.192.69): icmp_seq=11 ttl=116 time=36.2 ms
# ^C
# --- gmail.com ping statistics ---
# 11 packets transmitted, 11 received, 0% packet loss, time 10498ms
# rtt min/avg/max/mdev = 35.142/36.496/39.413/1.199 ms

# 33)wc – Counts lines, words, and characters in files.
# printf "Random text number %s \n" {1..20} > f1.text && wc f1.text
# output
# 20  80 451 f1.text

# 34)> / >> – Redirects command output to a file (overwrite with >, append with >>).
# echo -e "this line is added not appended\n">f1.text&& echo -e "this line is appended with previous text" >>f1.text && cat f1.text
# output
# this line is added not appended

# this line is appended with previous text

# 35)| – Pipes output from one command into another command.
# echo -e "abcde\nabcd\nabcd\naab\n" > f1.text | grep abc f1.text
# abcde
# abcd
# abcd