# Assignment - 1b
# Assignment Description - Familiarity with User and System level OS Commands
# Group - A3
# Team No - 11
# Roll Nos - 002311001039, 002311001050,002311001064
# Names - Sayan Dutta,Afham Shakel, Samiran Chakraborty
# Date - 26/07/2025



# 1)who:-
# It displays the information about all the users who have logged into the system
# Currently
# [be2350@localhost Ass1]$ who
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





# 2) whoami
# It displays Current username, Terminal number, date and time at which user
# logged into the system
# [be2350@localhost Ass1]$ whoami
# be2350


# 3)pwd
#  It displays current working directory
# [be2350@localhost Ass1]$ pwd
# /home/usr/student/ug/yr23/be2350/OS_Lab/Ass1

# 4)
# Date
# [be2350@localhost Ass1]$ pwd
# /home/usr/student/ug/yr23/be2350/OS_Lab/Ass1


# 5)
# ls 
#  It lists the files and directories stored in the current directory. To list the files in a
# directory use the following syntax: $ls dirname
# [be2350@localhost OS_Lab]$ ls
# Ass1


# 6) mkdir – It is used to create directories by using the command: $mkdir dirname
# [be2350@localhost Ass1]$ mkdir File2|ls
# File  File2
# 7) clear- It clears the screen

# 8) cd - It is used to change the current working directory to any other directory specified
# [be2350@localhost OS_Lab]$ pwd
# /home/usr/student/ug/yr23/be2350/OS_Lab
# [be2350@localhost OS_Lab]$ cd Ass1;pwd
# /home/usr/student/ug/yr23/be2350/OS_Lab/Ass1

# 9) df - It displays currently mounted file systems.
# [be2350@localhost Ass1]$ df
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



# 10)	rmdir->Directories can be deleted using the rmdir command - $rmdir dirname
# Output→
# [be2364@localhost os]$ rmdir -v os
# rmdir: removing directory, ‘os’

# 11	)cat– It displays the contents of a file - $cat filename
# Output→
# [be2364@localhost os]$ cat file.cpp
# #include<iostream>
# using namespace std;
# int main(){

#         cout<<"hello world"<<endl;
#         return 0;
# }

# 12)	cp- It is used to copy a file - $ cp source_file destination_file
# Output→
# [be2364@localhost os]$ cp -v file.cpp cpfile.cpp
# ‘file.cpp’ -> ‘cpfile.cpp’

# 13)	mv- It is used to change the name of a file - $ mv old_file new_file

# Output→
# [be2364@localhost ~]$ mv -v filemv.cpp os
# ‘filemv.cpp’ -> ‘os/filemv.cpp’
# 14)	rm – It is used to delete an existing file - $ rm filename
# Output →
# [be2364@localhost os]$ rm -v file.cpp
# removed ‘file.cpp’

# 15)
# stat- It is used to display file or file system status - $ stat filename
# Output→
# [be2364@localhost ~]$ stat os
#   File: ‘os’
#   Size: 74              Blocks: 0          IO Block: 4096   directory
# Device: fd02h/64770d    Inode: 6442579472  Links: 2
# Access: (0755/drwxr-xr-x)  Uid: ( 3267/  be2364)   Gid: ( 2926/  ugyr23)
# Context: unconfined_u:object_r:user_home_t:s0
# Access: 2025-07-22 17:01:55.936838470 +0530
# Modify: 2025-07-22 17:15:18.914856975 +0530
# Change: 2025-07-22 17:15:18.914856975 +0530
#  Birth: -
# 16)	ln - It is used to create links between files and directories.
# Output→
#  ln -sv file.cpp linkfile.cpp
# ‘linkfile.cpp’ -> ‘file.cpp’
# 17)	tty – It prints the filename of the terminal connected to standard input.
# Output→
# [be2364@localhost os]$ tty
# /dev/pts/21
# 18)	uname –It prints system information
# Output→
# [be2364@localhost os]$ uname
# Linux
# 19)	 umask – It specifies user file creation mask, implying which of the 3 permissions are to
# be denied to the owner,group and others.
# Output→
# [be2364@localhost os]$ umask
# 0022
