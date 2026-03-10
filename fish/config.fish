if not status is-interactive
    exit
end

if not type -q fisher
    echo "Installing Fisher..."
    curl -sL https://git.io/fisher | source && fisher update
end

set -U __done_notification_urgency_level low
set -U __done_min_cmd_duration 10000
zoxide init fish | source
export BROWSER="librewolf"
fish_add_path $HOME/.cargo/bin
alias unlock='sudo rm /var/lib/pacman/db.lck'
alias clear='clear && fastfetch'
alias clearn='/bin/clear'
