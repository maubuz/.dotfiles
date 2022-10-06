# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

mousef () {
#	MOUSE_ELECOM=$(xinput list | grep "ELECOM" | head -n 1 | sed -r 's/.*id=([0-9]+).*/\1/')

	MOUSE_ELECOM=$(xinput list | grep "ELECOM TrackBall Mouse HUGE TrackBall.*pointer" | sed -r 's/.*id=([0-9]+).*/\1/')
	xinput --set-button-map "$MOUSE_ELECOM" 9 2 3 4 5 6 7 8 1 10 11 12
	echo 'Buttons swaped for ELECOM mouse as device '"$MOUSE_ELECOM"
	
	# Enable trackball scroll when button 1 (the original) is pressed
	xinput set-prop "pointer:ELECOM TrackBall Mouse HUGE TrackBall" 'libinput Button Scrolling Button' 1
	xinput set-prop "pointer:ELECOM TrackBall Mouse HUGE TrackBall" 'libinput Scroll Method Enabled' 0 0 1
}

# Open VS Code into my sofle config, build it
sofle(){
  pushd /home/mau/Code/qmk_firmware/keyboards/sofle/keymaps/mau_sofle
  code .
  pushd /home/mau/Code/qmk_firmware
  util/docker_build.sh sofle:mau_sofle
}

sofle-build(){
  if [[ "$PWD" != "$HOME/Code/qmk_firmware" ]]; then
    pushd /home/mau/Code/qmk_firmware
    util/docker_build.sh sofle:mau_sofle
    popd
  else
    echo "Already in qmk directory"
    util/docker_build.sh sofle:mau_sofle
  fi
}

sofle-flash(){
  if [[ "$PWD" != "$HOME/Code/qmk_firmware" ]]; then
    pushd /home/mau/Code/qmk_firmware
    sudo util/docker_build.sh sofle:mau_sofle:flash
    popd
  else
    echo "Already in qmk directory"
    sudo util/docker_build.sh sofle:mau_sofle:flash
  fi
}

# Aliases to facilitate working with Insync
alias 1p6='cd /home/mau/Insync/mau.jac.cs@gmail.com/Google\ Drive/JAC\ G/Courses/420-1P6/1P6/1P6-Notes'

1p6-serve(){
    1p6
    npx docsify serve &
    sleep 1
    firefox http://localhost:3000
}

# Set NVM environmental variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Start Teams in google-chrome as an app
alias teams='google-chrome --app=https://teams.microsoft.com --enable-features=WebRTCPipeWireCapturer --enable-features=UseOzonePlatform --ozone-platform=wayland'

alias vi='nvim'
alias v='nvim'

alias em='emacs'

alias py='python' 

alias lsa='ls -a'
alias lsall='ls -all'

alias so='source'
alias sobrc='source ~/.bashrc'

# Setup starship for terminal
eval "$(starship init bash)"

# LSDelux for nice ls expericence
alias ls='lsd'

# Video application v4l2-ctl
alias v4l='v4l2-ctl'

alias wm='cd ~/Insync/mauri.andres@gmail.com/GDrive/Local_Sync/ZettleMau && emacs index.org'

alias wj='cd ~/Insync/mau.jac.cs@gmail.com/Google\ Drive/JAC\ G && nvim index.md'

alias myvim='cd ~/.config/nvim && nvim init.lua'

alias lg='lazygit'

alias Code='cd ~/Code && lsa'

alias brc='nvim ~/.bashrc'

alias dnr='dotnet run'

# Fancy splash screen in terminal
# Disabled because was too slow. Suspect GPU was causing slowdown
#neofetch

# bash parameter completion for the dotnet CLI

_dotnet_bash_complete()
{
  local word=${COMP_WORDS[COMP_CWORD]}

  local completions
  completions="$(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)"
  if [ $? -ne 0 ]; then
    completions=""
  fi

  COMPREPLY=( $(compgen -W "$completions" -- "$word") )
}

complete -f -F _dotnet_bash_complete dotnet

# Deno paths
export DENO_INSTALL="/home/mau/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Doom Emacs
export PATH="~/.emacs.d/bin:$PATH"

