#!/usr/bin/fish

# Configuring fuck to give some fucks
#thefuck --alias | source
#comment

#status --is-interactive; and source (jump shell fish | psub)
status --is-interactive; and source (pyenv init -|psub)
set -Ux GOPATH /home/thecsw/go
set -gx PATH $GOPATH/bin $PATH
set -gx PATH /home/thecsw/.local/bin $PATH
set -gx PATH /home/thecsw/gits/dotfiles/bin $PATH
set -gx PATH /opt/Citrix/ICAClient $PATH
set -gx PATH /home/thecsw/.gem/ruby/2.7.0/bin $PATH
set -gx PATH /home/thecsw/gits/emsdk:/home/thecsw/gits/emsdk/upstream/emscripten:/home/thecsw/gits/emsdk/node/12.9.1_64bit/bin $PATH
set -gx TERMINAL urxvt
set -gx EDITOR emacsclient -nw
set -gx PAGER less
set -gx KEYBASE_RUN_MODE prod

# In Linux we trust
function fish_greeting
    echo -e "\nSo you're back... about time..."
end

# acme
function acme
    acme_t -f /home/thecsw/gits/plan9/font/lucm/euro.9.font $argv &;disown
end	

# libre
function libre
    libreoffice $argv &;disown
end

# open
function djvu
    evince $argv &;disown
end

function play
    mpv $argv 2>&1 >/dev/null
end

alias em="emacsclient -nw"
alias r="ranger"
alias x="startx"
alias nani="figlet nani"
alias enclose="sed 's/^/\"/;s/\$/\"/'"

abbr gco "git checkout"
abbr gb "git branch"

# Downloading with youtube-dl
abbr youtube-mp3 "youtube-dl -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --ignore-errors"

function youtube-get
    youtube-dl --get-filename -o '%(title)s.%(ext)s' --restrict-filename --ignore-errors $argv
end

abbr youtube-playlist "youtube-dl -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s'"

function youtube-download
    notify-send "Starting download" $argv
    set out (youtube-dl -f '(bestvideo+bestaudio)[protocol^=http]' -o '%(title)s.%(ext)s' --ignore-errors $argv | tee /dev/tty)
    set video_name (echo $out | grep 'Destination' | sed 1q | sed -E "s/.*Destination: ([^.]+)\..*/\1/g")
    notify-send "Download Complete" $video_name
end

abbr m "udevil mount"
abbr um "udevil umount"

#abbr v "xclip -o"
#abbr c "xclip -i"

function youtube-play
    youtube-dl --ignore-errors -o - $argv | mpv -
end

# Start X at login
if status is-login	
   if test -z "$DISPLAY" -a $XDG_VTNR = 1
      exec startx -- -keeptty	
   end
end

if set -q SSH_TTY
   set -g fish_color_host brred
end

function su
   command su --shell=/usr/bin/fish $argv
end

function get_youtube_mp3
   command xclip -o | sed 's/^/"/;s/$/"/' | xargs youtube-dl -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --ignore-errors
end
