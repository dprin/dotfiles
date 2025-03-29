set -x LANG en_US.UTF-8
set -x SHELL /bin/fish
set -x fish_greeting ""
set -x VISUAL hx
set -x EDITOR hx

alias c=clear
alias nr="sudo nixos-rebuild switch --flake ~/.config/nix/#prin"

if status is-interactive
    starship init fish | source
    zoxide init fish | source
end
