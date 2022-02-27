# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

radj () {
    echo "sudo ryzenadj --fast-limit=$1 --slow-limit=$2"
    sudo ryzenadj --fast-limit=$1 --slow-limit=$2
}
alias l='ls --color=always'
alias ls='ls -a --color=always'
alias la='ls -al --color=auto'
alias ll='ls -lahF --color=auto'

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

alias tearfree="xrandr --output HDMI-A-0 --set TearFree on && xrandr --output eDP --set TearFree on"
alias cold="sudo ryzenadj --stapm-limit=13000 --fast-limit=13000 --slow-limit=13000 --tctl-temp=48"
alias normal="sudo ryzenadj --stapm-limit=10000 --fast-limit=13000 --slow-limit=11000"
alias boost="su -c 'echo 0 > /sys/devices/system/cpu/cpufreq/boost'"
alias ssh='kitty +kitten ssh'
alias npmcd='npm --registry http://verdaccio.dev.codedrills.io/'
alias vim='nvim'
alias vi='nvim'

export EDITOR='vim'
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.ghcup/bin

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export ANDROID_HOME=$HOME/devdroid
export PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
export PATH=$ANDROID_HOME/emulator/:$PATH
export PATH=$ANDROID_HOME/platform-tools/:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

set completion-ignore-case 1
eval "$(starship init bash)"
# export PS1="\n\@ ${USER}@\h - \${PWD} \n➜ "
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

alias spd='/usr/bin/spotifyd --config-path /home/anik/.config/spotifyd/spotifyd.conf --verbose --no-daemon'

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export PATH=$JAVA_HOME/bin:$PATH

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
