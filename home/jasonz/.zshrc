export PATH=$HOME/bin:$PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# i'd prefer to use binaries from homebrew
export PATH="/opt/homebrew/opt/file-formula/bin:$PATH"
export TERM="xterm-256color"

alias v="vim"
alias l="eza"
alias ll="eza -lhF --color"
alias tmux="tmux -2"
alias tmuxn="tmux -2 new-session -s $USER"
alias tmuxa="tmux a -t"
alias top="htop"
alias h="history"
alias q="exit"
#alias cd="z"
alias j="z"
alias grep="rg"
alias aws.sh="pushd ~/bin/saml2aws &>/dev/null && pipenv run python3 ./saml2aws.py && source ~/.awsrc && popd &>/dev/null"
alias aws-fedramp-cert.sh="pushd ~/bin/saml2aws &>/dev/null && pipenv run python3 ./saml2aws-fedramp-cert.py && source ~/.awsrc && popd &>/dev/null"
alias proxy="export HTTP_PROXY='http://192.168.50.99:10900' && export HTTPS_PROXY='http://192.168.50.99:10900' && export NO_PROXY='localhost,127.0.0.1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16,localaddress,.localdomain.com'"
alias unproxy="unset HTTP_PROXY && unset HTTPS_PROXY && unset NO_PROXY"

if [ -f ~/.awsrc ]; then
    source ~/.awsrc
fi

ulimit -s 65520
ulimit -u 5333
ulimit -n unlimited

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
source <(limactl completion zsh)
source <(hubble completion zsh)
compdef klima=kind
