# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pedramos/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/pedramos/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pedramos/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/pedramos/.fzf/shell/key-bindings.bash"
