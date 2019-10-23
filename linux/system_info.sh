#!/bin/sh
#http://blog.csdn.net/r_luo/article/details/10769257

LOG_FILE=linux_system_info_$(date +%Y%m%d%H%M).log
COND=1
touch ${LOG_FILE}

printex()
{
    echo " [root@admin ]# $1"
}

while [ $COND -eq 1 ];
do
    echo " *** System information ***"
    printex "cat /proc/version"
    cat /proc/version
    printex "cat /proc/cmdline"
    cat /proc/cmdline
    printex "uname -a"
    uname -a
    printex "uptime"
    uptime
    echo " ## summary info"
    printex "vmstat 1 10"
    vmstat 1 10
    echo ""

    echo " *** CPU information ***"
    CORES=$(grep processor /proc/cpuinfo | wc -l)
    CPU_TYPE=$(uname -m)
    echo " TITLE: CPU type: ${CPU_TYPE}, cores: ${CORES}"
    printex "cat /proc/cpuinfo"
    cat /proc/cpuinfo
    echo ""

    echo " *** Memory information ***"
    printex "free"
    free
    printex "cat /proc/meminfo"
    cat /proc/meminfo
    echo ""

    echo " *** Disk/Flash information ***"
    printex "mount -l #current mount info"
    mount -l
    printex "fdisk -l #current disk info"
    fdisk -l
    printex "df -h #current fs info with using rate"
    df -h
    printex "cat /etc/mtab"
    cat /etc/mtab
    printex "cat /etc/fstab"
    cat /etc/fstab
    echo ""

    echo " *** Processes/Threads information ***"
    echo " ## limited info"
    printex "ulimit -a"
    ulimit -a
    echo " ## ten processes catch most CPU resource"
    printex "ps aux | sort -k 3 -r | head -11"
    ps aux | sort -k 3 -r | head -11
    echo " ## ten processes catch most Memory resource"
    printex "ps aux | sort -k 4 -r | head -11"
    ps aux | sort -k 4 -r | head -11
    echo ""
    
    echo " *** Lardge information ***"
    printex "lsmod #current modules and referenced counter"
    lsmod
    printex "top -d 1 -n 1"
    top -d 1 -n 1
    echo " ## all process info"
    ps -ef
    printex "cat /var/log/dmesg"
    cat /var/log/dmesg
    echo ""

    COND=0
done >> ${LOG_FILE}

unix2dos ${LOG_FILE}