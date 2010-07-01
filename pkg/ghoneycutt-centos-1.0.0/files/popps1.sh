#!/bin/bash
# This file is being maintained by Puppet.
# DO NOT EDIT

# changes prompt, PS1, to show $pop
#
# usage: . /usr/local/bin/popps1.sh
#
# returns 0 on success and non zero on failure
#

FacterCmd='/usr/bin/facter'

# ensure facter can be executed
if [ ! -x $FacterCmd ]; then
    return 1
fi

# ensure that hostname is returned
hostname=$($FacterCmd hostname)
if [ -z $hostname ]; then
    return 1
fi 

# ensure that pop is returned
pop=$($FacterCmd domain | /usr/bin/awk -F . '{print $1}')
if [ -z $pop ]; then
    return 1
fi

# grab the id
id=$(/usr/bin/id -u)

# if root, show # else show $
if [ $id -eq 0 ]; then
    PS1="[\u@${hostname}.${pop} \W]# "
else
    PS1="[\u@${hostname}.${pop} \W]$ "
fi

return 0
