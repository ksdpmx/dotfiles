export LANG=en_US.UTF-8
export LC_CTYPE=zh_CN.UTF-8
export LC_ALL=
export EDITOR="/usr/bin/vim"
export TERM="xterm-256color"
export REPO=$HOME/repo
# export PATH=/home/jasonz/go/bin:/home/jasonz/bin:/sbin:$PATH
export PATH=/home/jasonz/go/bin:/home/jasonz/bin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/games
export GOPATH=/home/jasonz/go

alias e="emacs -nw --debug-init"
alias v="vim"
alias l="ls"
alias ll="ls -lhF --color"
alias tmux="tmux -2"
alias tmuxn="tmux -2 new-session -s $USER"
alias tmuxa="tmux a -t"
alias muxn="mux start jasonz"
alias gcc="time gcc -W -Wall"
alias gcc+="gcc -v -pg -W -Wall"
alias g++="time g++ -W -Wall"
alias clang="time clang"
alias top="htop"
alias h="history"
alias q="exit"
alias cd..="cd .."
alias mv="mv -i"

ZSH=$HOME/repo/github.com/ohmyzsh/ohmyzsh
ZSH_THEME="jasonz"
plugins=(git colorize tmux zoxide git-auto-fetch zsh-autosuggestions zsh-syntax-highlighting)

# colorize
ZSH_COLORIZE_TOOL="pygmentize"
ZSH_COLORIZE_STYLE="colorful"

# tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_CONFIG="$HOME/.tmux.conf"
ZSH_TMUX_DEFAULT_SESSION_NAME="jasonz"
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_ITERM2=false
ZSH_TMUX_UNICODE=true

# git-auto-fetch
GIT_AUTO_FETCH_INTERVAL=300 # seconds

source $ZSH/oh-my-zsh.sh

