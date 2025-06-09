HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# don't put duplicate lines or lines start with space in the history.
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY_TIME
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST


# Start typing + [Up-Arrow] - find history starts-with (backward)
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search

bindkey -M emacs "^[[A" up-line-or-beginning-search
bindkey -M viins "^[[A" up-line-or-beginning-search
bindkey -M vicmd "^[[A" up-line-or-beginning-search
if [[ -n "${terminfo[kcuu1]}" ]]; then
  bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
fi


# Start typing + [Down-Arrow] - find history starts-with (forward)
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -M emacs "^[[B" down-line-or-beginning-search
bindkey -M viins "^[[B" down-line-or-beginning-search
bindkey -M vicmd "^[[B" down-line-or-beginning-search
if [[ -n "${terminfo[kcud1]}" ]]; then
  bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
fi

insert-fuzzy-history-search() {
    # Clear current line temporarily
    local original_buffer="$BUFFER"
    local original_cursor="$CURSOR"

    # Run your utility (replace with your actual command)
    local selected_command=$(fc -l -n 1 | fzf --tac --no-sort --scheme=history --reverse --height=8 --prompt '? ' --query "$BUFFER")

    # If command was selected, insert it
    if [[ -n "$selected_command" ]]; then
        LBUFFER="$selected_command"
	RBUFFER=""
    else
        # Restore original state if cancelled
        BUFFER="$original_buffer"
        CURSOR="$original_cursor"
    fi

    zle redisplay
}

zle -N insert-fuzzy-history-search
bindkey "^R" insert-fuzzy-history-search

