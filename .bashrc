# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

pathadd()
{
	if ! echo $PATH | grep -q "$1:"; then
		export PATH="$1:$PATH"
	fi
}

# Fixups for fedora toolbox containers
if [ "$(hostname)" = "toolbox" ]; then
	export HOME="$(getent passwd "$USER" | cut -d: -f6)"
fi

# ccache
export CCACHE_DIR="$HOME/.ccache"
export USE_CCACHE="1"
export CCACHE_MAXSIZE="100G"

# Golang
export GOPATH="$HOME/.local/share/go"
export GOFLAGS=""

# $PATH modifications
pathadd "/usr/lib64/ccache"
pathadd "$HOME/.local/bin"
pathadd "$HOME/.local/share/go/bin"

# Editors / Desktops
case $XDG_CURRENT_DESKTOP in
GNOME)
	export VISUAL="gedit"
	export QT_QPA_PLATFORMTHEME="qt5ct"
	;;
KDE)
	export VISUAL="kate"
	export QT_QPA_PLATFORMTHEME="kde"
	export GTK_USE_PORTAL="1"
	;;
esac
export QT_AUTO_SCREEN_SCALE_FACTOR="1"
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export WINIT_UNIX_BACKEND="x11"
export WINEARCH="win64"
export WINEPREFIX="$HOME/.wine/default"
export PROTONPREFIX="$HOME/.proton/default"
export SPACEVIMDIR="$HOME/.config/spacevim/"

# Git
git config --global user.name "Dorian Stoll"
git config --global user.email "dorian.stoll@tmsp.io"
git config --global user.signingkey "dorian.stoll@tmsp.io"
git config --global user.github "StollD"
git config --global commit.gpgsign true
git config --global tag.forcesignannotated true
git config --global core.editor $EDITOR

# Start fish as an interactive shell
if [ ! -z "$BASH_EXECUTION_STRING" ]; then
	NOFISH="1"
fi
if [ ! "$NOFISH" = "1" ]; then
	exec fish
fi
