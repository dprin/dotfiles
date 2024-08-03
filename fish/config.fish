source ~/.config/fish/alias.fish

set -x LANG en_US.UTF-8
set -x SHELL "fish"
set -x fish_greeting ""

if status is-interactive
	starship init fish | source
	zoxide init fish | source
end
