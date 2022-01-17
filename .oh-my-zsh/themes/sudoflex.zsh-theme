# Clean, simple, compatible and meaningful.
# Tested on Linux, Unix and Windows under ANSI colors.
# It is recommended to use with a dark background.
# Colors: black, red, green, yellow, *blue, magenta, cyan, and white.
#
# Feb 2020 R. Nsinga

# Show active virtualenv @Nov1720
local venv_info='$(virtualenv_info)'
function virtualenv_info {
 [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

# Show folder icon @Feb1720
local show_ficon='$(cea_show_icon)'
function cea_show_icon {
  echo -e "\uf179"
}

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}\ue725 %{$FG[013]%}\uf737 "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[013]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
        # make sure this is a hg dir
        if [ -d '.hg' ]; then
                echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
                echo -n $(hg branch 2>/dev/null)
                if [ -n "$(hg status 2>/dev/null)" ]; then
                        echo -n "$YS_VCS_PROMPT_DIRTY"
                else
                        echo -n "$YS_VCS_PROMPT_CLEAN"
                fi
                echo -n "$YS_VCS_PROMPT_SUFFIX"
        fi
}

local exit_code="%(?,,C:%{$fg[red]%}%?%{$reset_color%})"

# For example:
#
# % ys @ ys-mbp in ~/.oh-my-zsh on git:master x [21:47:42] C:0
# $
PROMPT="
%{$fg[green]%}${venv_info}%{$reset_color%}% \
%{$terminfo[bold]$fg[green]%}>_%{$reset_color%} \
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}%n)\
%{$fg[white]%}@\
%{$fg[green]%}%m \
%{$fg[white]%}${show_ficon} \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${hg_info}\
${git_info}\
$exit_code
%{$terminfo[bold]$fg[cyan]%}$ %{$reset_color%}"