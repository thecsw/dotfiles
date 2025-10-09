#!/usr/bin/fish

# Bun
set -Ux BUN_INSTALL "/Users/thecsw/.bun"
set -px --path PATH "/Users/thecsw/.bun/bin"

# Zig
set -px --path PATH "/Users/thecsw/.local/bin/zig"

# God, I forgot I even have this installed.
zoxide init fish | source

# In case the term can't guess this.
set -gx SHELL /opt/homebrew/bin/fish

# Stuff.
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
set -gx GOPATH /Users/thecsw/go
set -gx CARP_DIR /Users/thecsw/carp
set -gx EDITOR vim
set -gx PLAN9 /Users/thecsw/gits/plan9
set -gx GOEXPERIMENT loopvar

# Even setting ALL cursor-blinking options off in ghostty does nothing to the
# cursor, which continues blinking unbothered. The reason for this is fish_shell
# forcing the cursor to blink under the assumption that it's in vi mode, when it
# in fact is not. So, forcing this config in fish resolves the issue.
set fish_cursor_unknown block

# In my new ghostty setup, the command would get colored yellow, but I'm so used
# to that blue color that just keep it.
set fish_color_command blue

# In Linux we trust
function fish_greeting
    echo -e "\nSo you're back... about time..."
end

alias em="emacsclient -nw"
alias r="ranger"
alias nani="figlet nani"
alias enclose="sed 's/^/\"/;s/\$/\"/'"
alias rbrew="brew"

abbr gco "git checkout"
abbr gb "git branch"

#                    _ _
#  _ __   __ _  __ _(_) |_ ___
# | '_ \ / _` |/ _` | | __/ _ \
# | | | | (_| | (_| | | || (_) |
# |_| |_|\__,_|\__, |_|\__\___/
#              |___/
# ------------------------------

function nag
	nagito -auth "youngmastertool" -url "$argv"
end

function nagp
	pbpaste > /tmp/nagito.txt
	nagito -auth "youngmastertool" -urls /tmp/nagito.txt | tr ',' '\n' | tail -n 1 | tr -d '\n' | pbcopy
end

function nags
	nagito -auth "youngmastertool" -urls "$argv"
end

#                        _      _
#  _ __ ___   __ _  __ _(_) ___| | __
# | '_ ` _ \ / _` |/ _` | |/ __| |/ /
# | | | | | | (_| | (_| | | (__|   <
# |_| |_| |_|\__,_|\__, |_|\___|_|\_\
#                  |___/
# ------------------------------------

function convert1920x
    magick $argv -resize 1920x $argv
    jpegoptim -s $argv
end

function convert1920strip
    magick $argv -resize 1920x $argv
end

function convert1280x
    magick $argv -resize 1280x $argv
end

function convert1280strip
    magick $argv -resize 1280x $argv
    jpegoptim -s $argv
end

function convert1000xstrip
    magick $argv -resize 1000x -density 1x1 $argv
    jpegoptim -s $argv
end

function convert1000ystrip
    magick $argv -resize x1000 -density 1x1 $argv
    jpegoptim -s $argv
end

function convert750x
    magick $argv -resize 750x $argv
end

function convert500x
    magick $argv -resize 500x $argv
end

function convert300x
    magick $argv -resize 300x $argv
end

function standardize-images-1000
    for img in (find . -type f \( -iname "*.jpeg" -o -iname "*.webp" -o -iname "*.jpg" \))
        set dims (identify -format "%w %h" "$img" 2>/dev/null)
        if test -z "$dims"
            echo "Skipping unreadable file: $img"
            continue
        end

        set width (echo $dims | awk '{print $1}')
        set height (echo $dims | awk '{print $2}')

        if test "$width" -gt "$height"
            echo "Landscape → resizing height for: $img"
            convert1000ystrip "$img"
        else
            echo "Portrait → resizing width for: $img"
            convert1000xstrip "$img"
        end
    end
end

#                    _         _
#  _   _  ___  _   _| |_ _   _| |__   ___
# | | | |/ _ \| | | | __| | | | '_ \ / _ \
# | |_| | (_) | |_| | |_| |_| | |_) |  __/
#  \__, |\___/ \__,_|\__|\__,_|_.__/ \___|
#  |___/

abbr youtube-playlist "yt-dlp -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s'"

function youtube-download
    #notify-send "Starting download" $argv
    set out (yt-dlp -f '(bestvideo+bestaudio)[protocol^=http]' -o '%(title)s.%(ext)s' --ignore-errors --write-subs $argv | tee /dev/tty)
    set video_name (echo $out | grep 'Destination' | sed 1q | sed -E "s/.*Destination: ([^.]+)\..*/\1/g")
    #notify-send "Download Complete" $video_name
end

function youtube-play
    yt-dlp --ignore-errors -o - $argv | mpv -
end

function get_youtube_mp3
    command xclip -o | sed 's/^/"/;s/$/"/' | xargs yt-dlp -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --ignore-errors
end

# Downloading with yt-dlp
abbr youtube-mp3 "yt-dlp -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --ignore-errors"

function youtube-get
    yt-dlp --get-filename -o '%(title)s.%(ext)s' --restrict-filename --ignore-errors $argv
end

#                      _
#   ___ ___  _ __   __| | __ _
#  / __/ _ \| '_ \ / _` |/ _` |
# | (_| (_) | | | | (_| | (_| |
#  \___\___/|_| |_|\__,_|\__,_|
# -----------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# for https://github.com/jdx/mise
~/.local/bin/mise activate fish | source

if set -q SSH_TTY
    set -g fish_color_host brred
end
