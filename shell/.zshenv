# NNN Config
export NNN_PLUG='v:!nvim .*;c:!convert "$nnn" png:- | xclip -sel clipboard -t image/png*;g:-!git diff;l:-!git log;p:-!less -iR "$nnn"*'
export NNN_USE_EDITOR=1
export VISUAL=/usr/bin/nvim
export EDITOR=/usr/bin/nvim
source ~/.zshtheme
export PATH
unset NNN_OPS_PROG
. "$HOME/.cargo/env"
