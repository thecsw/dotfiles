#!/usr/bin/fish

# Don't know why I do this in the fish config, when I have all of those already
# set up in /etc/paths. 
set -gx PATH /usr/local/go/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /usr/bin $PATH
set -gx PATH /usr/local/bin $PATH
set -gx PATH /usr/bin $PATH
set -gx PATH /bin $PATH
set -gx PATH /usr/sbin $PATH
set -gx PATH /sbin $PATH

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

# Old stuff from my compiler's class, I don't think I would ever ever need these,
# but keeping them here for old time's sake.
set -gx LDFLAGS -L/usr/local/opt/flex/lib
set -gx CPPFLAGS "-I/usr/local/opt/flex/include -I/opt/homebrew/Cellar/libgccjit/11.1.0"
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk/include -I/opt/homebrew/Cellar/libgccjit/11.1.0"
set -gx CPATH "/Library/Developer/CommandLineTools/SDKs/MacOSX11.3.sdk/System/Library/Perl/5.30/darwin-thread-multi-2level/CORE" $CPATH

export NVM_DIR="$HOME/.nvm"

# In Linux we trust
function fish_greeting
    echo -e "\nSo you're back... about time..."
end

alias em="emacsclient -nw"
alias r="ranger"
alias nani="figlet nani"
alias enclose="sed 's/^/\"/;s/\$/\"/'"
alias rbrew="arch -arm64 /opt/homebrew/bin/brew"
alias rbison="/opt/homebrew/opt/bison/bin/bison"
alias docker="podman"

abbr gco "git checkout"
abbr gb "git branch"

# Downloading with yt-dlp
abbr youtube-mp3 "yt-dlp -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --ignore-errors"

function youtube-get
    yt-dlp --get-filename -o '%(title)s.%(ext)s' --restrict-filename --ignore-errors $argv
end

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

if set -q SSH_TTY
    set -g fish_color_host brred
end

function get_youtube_mp3
    command xclip -o | sed 's/^/"/;s/$/"/' | xargs yt-dlp -f '(bestaudio)[protocol^=http]' --extract-audio --audio-format mp3 -o '%(title)s.%(ext)s' --ignore-errors
end

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

set -g fish_user_paths /opt/homebrew/opt/flex/bin $fish_user_paths

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

set -g fish_user_paths /opt/homebrew/bin $fish_user_paths
set -g fish_user_paths "$HOME/.cabal/bin" $fish_user_paths
set -g fish_user_paths /opt/homebrew/opt/openjdk/bin $fish_user_paths
set -g fish_user_paths "/opt/homebrew/opt/llvm@13/bin" $fish_user_paths
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /Users/thecsw/.ghcup/bin $PATH # ghcup-env

# Bun
set -Ux BUN_INSTALL "/Users/thecsw/.bun"
set -px --path PATH "/Users/thecsw/.bun/bin"

# Zig
set -px --path PATH "/Users/thecsw/.local/bin/zig"

# opam configuration
source /Users/thecsw/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# for https://github.com/jdx/mise
~/.local/bin/mise activate fish | source

### key-bindings.fish ###
#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/ key-bindings.fish
#
# - $FZF_TMUX_OPTS
# - $FZF_CTRL_T_COMMAND
# - $FZF_CTRL_T_OPTS
# - $FZF_CTRL_R_OPTS
# - $FZF_ALT_C_COMMAND
# - $FZF_ALT_C_OPTS


# Key bindings
# ------------
function fzf_key_bindings

  function __fzf_defaults
    # $1: Prepend to FZF_DEFAULT_OPTS_FILE and FZF_DEFAULT_OPTS
    # $2: Append to FZF_DEFAULT_OPTS_FILE and FZF_DEFAULT_OPTS
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    echo "--height $FZF_TMUX_HEIGHT --bind=ctrl-z:ignore" $argv[1]
    test -r "$FZF_DEFAULT_OPTS_FILE"; and string collect -N -- <$FZF_DEFAULT_OPTS_FILE
    echo $FZF_DEFAULT_OPTS $argv[2]
  end

  # Store current token in $dir as root for the 'find' command
  function fzf-file-widget -d "List files and folders"
    set -l commandline (__fzf_parse_commandline)
    set -lx dir $commandline[1]
    set -l fzf_query $commandline[2]
    set -l prefix $commandline[3]

    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS (__fzf_defaults "--reverse --walker=file,dir,follow,hidden --scheme=path --walker-root=$dir" "$FZF_CTRL_T_OPTS")
      set -lx FZF_DEFAULT_COMMAND "$FZF_CTRL_T_COMMAND"
      set -lx FZF_DEFAULT_OPTS_FILE ''
      eval (__fzfcmd) -m --query=$fzf_query | while read -l r; set -a result $r; end
    end
    if test -z "$result"
      commandline -f repaint
      return
    else
      # Remove last token from commandline.
      commandline -t ""
    end
    for i in $result
      commandline -it -- $prefix
      commandline -it -- (string escape -- $i)
      commandline -it -- ' '
    end
    commandline -f repaint
  end

  function fzf-history-widget -d "Show command history"
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -l FISH_MAJOR (string split '.' -- $version)[1]
      set -l FISH_MINOR (string split '.' -- $version)[2]

      # merge history from other sessions before searching
      test -z "$fish_private_mode"; and builtin history merge

      # history's -z flag is needed for multi-line support.
      # history's -z flag was added in fish 2.4.0, so don't use it for versions
      # before 2.4.0.
      if test "$FISH_MAJOR" -gt 2 -o \( "$FISH_MAJOR" -eq 2 -a "$FISH_MINOR" -ge 4 \)
        set -lx FZF_DEFAULT_OPTS (__fzf_defaults "" "-n2..,.. --scheme=history --bind=ctrl-r:toggle-sort --wrap-sign '"\t"↳ ' --highlight-line $FZF_CTRL_R_OPTS +m")
        set -lx FZF_DEFAULT_OPTS_FILE ''
        if type -q perl
          builtin history -z --reverse | command perl -0 -pe 's/^/$.\t/g; s/\n/\n\t/gm' | eval (__fzfcmd) --tac --read0 --print0 -q '(commandline)' | string replace -r '^\d*\t' '' | read -lz result
          and commandline -- $result
        else
          set -l line 0
          for i in (builtin history -z --reverse | string split0)
            set line (math $line + 1)
            string escape -n -- $line\t$i
          end | string join0 | string replace -a '\n' '\n\t' | string unescape -n | eval (__fzfcmd) --tac --read0 --print0 -q '(commandline)' | string replace -r '^\d*\t' '' | read -lz result
          and commandline -- $result
        end
      else
        builtin history | eval (__fzfcmd) -q '(commandline)' | read -l result
        and commandline -- $result
      end
    end
    commandline -f repaint
  end

  function fzf-cd-widget -d "Change directory"
    set -l commandline (__fzf_parse_commandline)
    set -lx dir $commandline[1]
    set -l fzf_query $commandline[2]
    set -l prefix $commandline[3]

    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
      set -lx FZF_DEFAULT_OPTS (__fzf_defaults "--reverse --walker=dir,follow,hidden --scheme=path --walker-root=$dir" "$FZF_ALT_C_OPTS")
      set -lx FZF_DEFAULT_OPTS_FILE ''
      set -lx FZF_DEFAULT_COMMAND "$FZF_ALT_C_COMMAND"
      eval (__fzfcmd) +m --query=$fzf_query | read -l result

      if test -n "$result"
        cd -- $result

        # Remove last token from commandline.
        commandline -t ""
        commandline -it -- $prefix
      end
    end

    commandline -f repaint
  end

  function __fzfcmd
    test -n "$FZF_TMUX"; or set FZF_TMUX 0
    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    if test -n "$FZF_TMUX_OPTS"
      echo "fzf-tmux $FZF_TMUX_OPTS -- "
    else if test "$FZF_TMUX" = "1"
      echo "fzf-tmux -d$FZF_TMUX_HEIGHT -- "
    else
      echo "fzf"
    end
  end

  bind \cr fzf-history-widget
  if not set -q FZF_CTRL_T_COMMAND; or test -n "$FZF_CTRL_T_COMMAND"
    bind \ct fzf-file-widget
  end
  if not set -q FZF_ALT_C_COMMAND; or test -n "$FZF_ALT_C_COMMAND"
    bind \ec fzf-cd-widget
  end

  if bind -M insert &> /dev/null
    bind -M insert \cr fzf-history-widget
    if not set -q FZF_CTRL_T_COMMAND; or test -n "$FZF_CTRL_T_COMMAND"
      bind -M insert \ct fzf-file-widget
    end
    if not set -q FZF_ALT_C_COMMAND; or test -n "$FZF_ALT_C_COMMAND"
      bind -M insert \ec fzf-cd-widget
    end
  end

  function __fzf_parse_commandline -d 'Parse the current command line token and return split of existing filepath, fzf query, and optional -option= prefix'
    set -l commandline (commandline -t)

    # strip -option= from token if present
    set -l prefix (string match -r -- '^-[^\s=]+=' $commandline)
    set commandline (string replace -- "$prefix" '' $commandline)

    # escape special characters, except for the $ sign of valid variable names,
    # so that after eval, the original string is returned, but with the
    # variable names replaced by their values.
    set commandline (string escape -n -- $commandline)
    set commandline (string replace -r -a '\x5c\$(?=[\w])' '\$' -- $commandline)

    # eval is used to do shell expansion on paths
    eval set commandline $commandline

    # Combine multiple consecutive slashes into one
    set commandline (string replace -r -a '/+' '/' -- $commandline)

    if test -z "$commandline"
      # Default to current directory with no --query
      set dir '.'
      set fzf_query ''
    else
      set dir (__fzf_get_dir $commandline)

      # BUG: on combined expressions, if a left argument is a single `!`, the
      # builtin test command of fish will treat it as the ! operator. To
      # overcome this, have the variable parts on the right.
      if test "." = "$dir" -a "." != (string sub -l 1 -- $commandline)
        # if $dir is "." but commandline is not a relative path, this means no file path found
        set fzf_query $commandline
      else
        # Also remove trailing slash after dir, to "split" input properly
        set fzf_query (string replace -r "^$dir/?" '' -- $commandline)
      end
    end

    echo (string escape -- $dir)
    echo (string escape -- $fzf_query)
    echo $prefix
  end

  function __fzf_get_dir -d 'Find the longest existing filepath from input string'
    set dir $argv

    # Strip trailing slash, unless $dir is root dir (/)
    set dir (string replace -r '(?<!^)/$' '' -- $dir)

    # Iteratively check if dir exists and strip tail end of path
    while test ! -d "$dir"
      # If path is absolute, this can keep going until ends up at /
      # If path is relative, this can keep going until entire input is consumed, dirname returns "."
      set dir (dirname -- "$dir")
    end

    echo $dir
  end

end
### end: key-bindings.fish ###
fzf_key_bindings
