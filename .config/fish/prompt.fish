#!/usr/bin/env fish

#
# Custom prompt based on 'Informative VCS'
#

function fish_prompt
    set -l last_status $status

    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 1
    set -g __fish_git_prompt_color_branch magenta --bold
    set -g __fish_git_prompt_showupstream 'informative'
    set -g __fish_git_prompt_char_upstream_ahead ' ↑ '
    set -g __fish_git_prompt_char_upstream_behind ' ↓ '
    set -g __fish_git_prompt_char_upstream_prefix ''
    set -g __fish_git_prompt_char_stagedstate ' ● '
    set -g __fish_git_prompt_char_dirtystate ' ✚ '
    set -g __fish_git_prompt_char_untrackedfiles ' … '
    set -g __fish_git_prompt_char_invalidstate ' ✖ '
    set -g __fish_git_prompt_char_cleanstate ' ✔ '
    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate green --bold
    set -g __fish_prompt_normal (set_color normal)

    set -l color_cwd
    set -l prefix
    set -l suffix

    switch $USER
	case root toor
	    set color_cwd $fish_color_cwd_root
	    set suffix '#'
	case '*'
	    set color_cwd $fish_color_cwd
	    set suffix '$'
    end

    # Toolbox
    if [ "$TOOLBOX_PATH" = "" ]
	set_color yellow
	printf '[HOST] '
	set_color normal
    end

    # PWD
    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    printf '%s ' (__fish_vcs_prompt)

    if not test $last_status -eq 0
	set_color $fish_color_error
	printf '[%s] ' $last_status
	set_color normal
    end

    printf '%s ' $suffix
end
