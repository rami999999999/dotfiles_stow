# Comment




PROMPT='%F{166}%B[%c] %b%f'

RPROMPT='%F{214}$(git_prompt_info)%f $(git_prompt_status)%f'

if [[ $(whoami) == "root" ]]; then
PROMPT='%F{124}%B[%c] %b%f'
fi

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="%F{132} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{172} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%F{124} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{66} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{175} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{245} ✱"
