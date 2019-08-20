#!/bin/env perl

print("VPN: up") if (system("test -e /sys/class/net/tun0") == 0);
print("VPN: down") if (system("test -e /sys/class/net/tun0") != 0);
