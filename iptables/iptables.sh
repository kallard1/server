#!/bin/sh

SSH_PORT=22 # Replace with your value (or not)

# Flush rules
iptables -t filter -F
iptables -t filter -X

# Drop Rules
iptables -t filter -P OUTPUT DROP
iptables -t filter -P INPUT DROP
iptables -t filter -P FORWARD DROP

# Established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# LOOPBACK
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

# DNS
iptables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT

# GIT
iptables -t filter -A INPUT -p tcp --dport 9418 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 9418 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 22 -j ACCEPT

# HTTP/HTTPS
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 8080 -j ACCEPT

# HUB
iptables -t filter -A INPUT -p tcp --dport 8000 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 8000 -j ACCEPT

# ICMP
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT

# IPsec
iptables -t filter -A INPUT -p udp --dport 500 -j ACCEPT
iptables -t filter -A OUTPUT -p udp --dport 500 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 4500 -j ACCEPT
iptables -t filter -A OUTPUT -p udp --dport 4500 -j ACCEPT

# MySQL
iptables -t filter -A INPUT -p tcp --dport 3306 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 3306 -j ACCEPT

# NTP
iptables -t filter -A OUTPUT -p udp --dport 123 -j ACCEPT

# POSTGRES
iptables -t filter -A INPUT -p tcp --dport 5432 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 5432 -j ACCEPT

# SMTP
iptables -t filter -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 25 -j ACCEPT

# SSH
iptables -t filter -A INPUT -p tcp --dport $SSH_PORT -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport $SSH_PORT -j ACCEPT
iptables -I INPUT -p tcp --dport 1022 -j ACCEPT

# SENTRY
iptables -t filter -A INPUT -p tcp --dport 9050 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 9050 -j ACCEPT

# TEAMCITY
iptables -t filter -A INPUT -p tcp --dport 8111 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 8111 -j ACCEPT

# UPSOURCE
iptables -t filter -A INPUT -p tcp --dport 8002 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 8002 -j ACCEPT

# YOUTRACK
iptables -t filter -A INPUT -p tcp --dport 8001 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 8001 -j ACCEPT
