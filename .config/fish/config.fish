#!/usr/bin/env fish

#
# Environment configuration
#

set -gx EDITOR em
set -gx SUDO_EDITOR em

switch $XDG_CURRENT_DESKTOP
case GNOME
	set -gx VISUAL e
	set -gx QT_QPA_PLATFORMTHEME qt5ct
	set -gx WINIT_UNIX_BACKEND x11
case KDE
	set -gx VISUAL e
	set -gx QT_QPA_PLATFORMTHEME kde
	set -gx GTK_USE_PORTAL 1
end

set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1

# Wine
set -gx WINEARCH win64
set -gx WINEPREFIX ~/.wine/default
set -gx PROTONPREFIX ~/.proton/default

# ccache
set -gx CCACHE_DIR ~/.ccache
set -gx USE_CCACHE 1
set -gx CCACHE_MAXSIZE 100G

# Misc paths
set -gx GOPATH ~/.local/share/go
set -gx SPACEVIMDIR ~/.config/spacevim/

# Force qtdeploy to link against system libraries
set -gx QT_PKG_CONFIG true

# $PATH
set -gx PATH ~/.local/share/ndk/toolchains/llvm/prebuilt/linux-x86_64/bin
set -gx PATH /usr/local/sbin /usr/sbin /sbin $PATH
set -gx PATH /usr/local/bin /usr/bin /bin $PATH
set -gx PATH /usr/share/Modules/bin $PATH
set -gx PATH /usr/lib64/ccache $PATH
set -gx PATH ~/.local/share/go/bin $PATH
set -gx PATH ~/.config/emacs/bin $PATH
set -gx PATH ~/.dotnet/tools $PATH
set -gx PATH ~/.local/bin $PATH

set -gx XDG_DATA_DIRS /usr/share
set -gx XDG_DATA_DIRS /usr/local/share:$XDG_DATA_DIRS
set -gx XDG_DATA_DIRS /var/lib/flatpak/exports/share:$XDG_DATA_DIRS
set -gx XDG_DATA_DIRS ~/.local/share/flatpak/exports/share:$XDG_DATA_DIRS

# Mesa stuff
set -gx mesa_glthread true
set -gx MOZ_X11_EGL 1

# Git config
# 
# Why set this every time the shell is started? Because I generally want
# to gpg sign my commits, but in some situations I need to disable it
# temporarily. This is so I don't forget to reenable it later on.
#
git config --global user.name 'Dorian Stoll'
git config --global user.email 'dorian.stoll@tmsp.io'
git config --global user.signingkey 'dorian.stoll@tmsp.io'
git config --global user.github 'StollD'
git config --global commit.gpgsign true
git config --global tag.forcesignannotated true
git config --global core.editor $EDITOR

#
# Fish configuration
#

set fish_greeting
set fish_prompt_pwd_dir_length 1

# Replace all hex colors in the default config with aliases that can
# be set through the terminal emulator. That way we dont get issues with
# different themes on different machines.
set fish_color_autosuggestion brblack
set fish_color_command brblue
set fish_color_comment brmagenta
set fish_color_end brmagenta
set fish_color_error brred
set fish_color_escape brcyan
set fish_color_operator normal
set fish_color_param normal
set fish_color_quote yellow
set fish_color_redirection bryellow
set fish_pager_color_completion normal
set fish_pager_color_description yellow

source ~/.config/fish/prompt.fish
