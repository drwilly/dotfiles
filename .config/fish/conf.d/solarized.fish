# http://ethanschoonover.com/solarized#the-values

# Use these settings if you've applied a Solarized theme to your terminal (for
# example, if "ls -G" produces Solarized output). i.e. if "blue" is #268bd2, not
# whatever the default is. (See "../etc/Solarized Dark.terminal" for OS X.)

set -l base03  "brblack"
set -l base02  "black"
set -l base01  "brgreen"
set -l base00  "bryellow"
set -l base0   "brblue"
set -l base1   "brcyan"
set -l base2   "white"
set -l base3   "brwhite"
set -l yellow  "yellow"
set -l orange  "brred"
set -l red     "red"
set -l magenta "magenta"
set -l violet  "brmagenta"
set -l blue    "blue"
set -l cyan    "cyan"
set -l green   "green"

# Use these settings if your terminal supports term256 and your terminal hasn't
# been configured with a Solarized theme.i.e. if "blue" is the default blue, not
# Solarized blue.
#
# set -l base03  002b36
# set -l base02  073642
# set -l base01  586e75
# set -l base00  657b83
# set -l base0   839496
# set -l base1   93a1a1
# set -l base2   eee8d5
# set -l base3   fdf6e3
# set -l yellow  b58900
# set -l orange  cb4b16
# set -l red     dc322f
# set -l magenta d33682
# set -l violet  6c71c4
# set -l blue    268bd2
# set -l cyan    2aa198
# set -l green   859900

# Used by fish's completion; see
# http://fishshell.com/docs/current/index.html#variables-color

set fish_color_normal        $base0
set fish_color_command       --bold
set fish_color_param         $base0
set fish_color_redirection   $violet
set fish_color_comment       $base01
set fish_color_error         $red
set fish_color_escape        $yellow --bold
set fish_color_operator      $yellow
set fish_color_end           $magenta
set fish_color_quote         $yellow
set fish_color_autosuggestion $base01

set fish_color_match         --background=$base02
set fish_color_search_match  --background=$base02
set fish_color_selection     $base1 --bold --background=$base02

set fish_color_cancel        -r

# Used by fish_prompt

set fish_color_cwd         $yellow
set fish_color_user        $cyan
set fish_color_host        $cyan

# Completion pager

set fish_pager_color_prefix          $base1
set fish_pager_color_completion      $base0
set fish_pager_color_description     $yellow
set fish_pager_color_progress        $base01
#set fish_pager_color_secondary       "--background=$base02"
