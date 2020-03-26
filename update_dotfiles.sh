#!/bin/sh

update_config() {
    NAME=$1
    echo -n "Updating $NAME config..."
    cp -r ~/.config/$NAME/* .config/$NAME
    echo " DONE."
}

update_config fish
update_config i3
update_config i3blocks
update_config cava
update_config neofetch
update_config ranger

echo "Committing changes..."
git add . && date | sed 's/^/"/;s/$/"/' | xargs git commit -am && git push
echo " DONE."
