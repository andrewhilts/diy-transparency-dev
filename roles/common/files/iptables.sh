#!/bin/bash

# flush all chains
iptables -F

# set the default policy for each of the pre-defined chains
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD DROP

# allow establishment of connections initialised by my outgoing packets
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

# shell
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# web - encrypted
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
# web - unencrypted
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# drop everything else
iptables -A INPUT -i eth+ -p udp -j DROP
iptables -A INPUT -i eth+ -p tcp -m tcp --syn -j DROP

# accept anything on localhost
iptables -A INPUT -i lo -j ACCEPT
