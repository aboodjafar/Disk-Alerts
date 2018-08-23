#!/bin/sh
df -HPl | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $6 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 80 ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
     mail -s "Alert: Almost out of disk space $usep%" Jafar.Abood@aaa-calif.com,Khan.Haneef@aaa-calif.com,Lum.Edward@aaa-calif.com,Rupapara.Mahesh@aaa-calif.com
  fi
done
