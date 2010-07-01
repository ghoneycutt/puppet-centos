# Class: centos
#
# CentOS specific - included as $operatingsystem in generic module
#
# Requires:
#   class ntp
#   class pam
#   class rpm
#   class sysctl
#   class yum
#
class centos {

    include ntp
    include pam
    include rpm
    include sysctl
    include yum

    file {
        # adjust the default PATH
        "/etc/profile.d/sbin.sh":
            source => "puppet:///modules/centos/sbin.sh",
            mode   => "755";
        # change prompt to reflect which $pop you are in
        "/usr/local/bin/popps1.sh":
            source => "puppet:///modules/centos/popps1.sh",
            mode   => "755";
    } # file
} # class centos
