#!/bin/fish

echo "Starting keybase service..."
keybase service&;
echo "Mounting KBFS to ./keybase..."
kbfsfuse /keybase
#echo "Freeing jobs..."
#disown;
