#!/usr/bin/fish

# Configuring fuck to give some fucks
#thefuck --alias | source

set -Ux GOPATH /home/thecsw/go
set -gx PATH $GOPATH/bin $PATH
set -gx PATH /home/thecsw/.local/bin $PATH
set -gx PATH /home/thecsw/gits/plan9/bin $PATH
set -gx TERMINAL urxvt
set -gx EDITOR emacsclient -nw
set -gx PAGER less

# In Linux we trust
function fish_greeting
    echo -e "\nSo you're back... about time..."
end

# # acme
function acme
    acme_t -f /home/thecsw/gits/plan9/font/lucm/euro.9.font $argv &;disown
end	

alias em="emacsclient -nw"
alias x="startx"

abbr gco "git checkout"
abbr gb "git branch"

# Downloading with youtube-dl
abbr youtube-mp3 "youtube-dl -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --ignore-errors"
abbr youtube-get "youtube-dl --get-filename -o '%(title)s.%(ext)s' --restrict-filename --ignore-errors"
abbr youtube-playlist "youtube-dl -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s'"
abbr youtube-download "youtube-dl -f '(bestvideo+bestaudio)[protocol^=http]' -o '%(title)s.%(ext)s' --ignore-errors"

function youtube-play
    youtube-dl --ignore-errors -o - $argv | mpv -
end
