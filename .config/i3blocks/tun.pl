#!/bin/env perl

print("VPN: up\n") if (system("test -e /sys/class/net/tun0") == 0);
print("VPN: down\n") if (system("test -e /sys/class/net/tun0") != 0);
