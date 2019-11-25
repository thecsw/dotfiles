#!/bin/fish

echo "It's time to kill"
fusermount -u /home/thecsw/doc/remotes/keybase && killall keybase && killall kbfsfuse;
