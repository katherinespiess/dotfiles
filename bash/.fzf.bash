# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ghspiess/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ghspiess/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ghspiess/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/ghspiess/.fzf/shell/key-bindings.bash"
