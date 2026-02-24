function aws_info {
    [[ -f ~/.awsrc ]] && \
        source ~/.awsrc
    local account=${AWS_PROFILE%%_*}
    local profile=${AWS_PROFILE##*_}
    local region=$AWS_REGION
    [ -z "$profile" ] && profile="N/A"
    [ -z "$region" ] && region="N/A"
    echo "${FG[246]}$account:$profile:$region%{$reset_color%}"
}

function kubectl_info {
    local context=$(kubectl config current-context)
    context=${context##*_}
    [ -z "$context" ] && \
        echo "${FG[196]}N/A%{$reset_color%}" && \
        exit 0

    [[ "$context" =~ "prod" ]] && \
        echo "${FG[196]}$context%{$reset_color%}" && \
        exit 0

    [[ "$context" =~ "cert" ]] && \
        echo "${FG[220]}$context%{$reset_color%}" && \
        exit 0

    echo "${FG[246]}$context%{$reset_color%}"
}

function prompt_char {
    if [ $UID -eq 0 ]; then
        echo "${FG[196]}#%{$reset_color%}"
    else
        echo "${FG[242]}>%{$reset_color%}"
    fi
}

function git_prompt_info {
    local branch_name=$(git symbolic-ref --short HEAD 2>/dev/null)
    if [ -n "$branch_name" ]; then
        local git_status=$(git status --porcelain)
        local has_changes=""
        if [[ -n "$git_status" ]]; then
            has_changes="*"
        fi
        echo "${FG[248]}$branch_name$has_changes%{$reset_color%}"
    fi
}

function prompt_misc_above {
    local exit_code=$1
    if [ $exit_code -ne 0 ]; then
        echo "${FG[196]}╭%{$reset_color%}"
    else
        echo "${FG[237]}╭%{$reset_color%}"
    fi
}

function prompt_misc_below {
    local exit_code=$1
    if [ $exit_code -ne 0 ]; then
        echo "${FG[196]}╰%{$reset_color%}"
    else
        echo "${FG[237]}╰%{$reset_color%}"
    fi
}

precmd() {
    exit_code=$?
}

PROMPT='$(prompt_misc_above $exit_code) ${FG[242]}%2~%{$reset_color%} $(git_prompt_info)
$(prompt_misc_below $exit_code) ${FG[242]}$(prompt_char)%{$reset_color%} '
