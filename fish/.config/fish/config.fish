if status is-interactive
	fish_vi_key_bindings
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

set -g fish_greeting
set fish_cursor_default block
set fish_cursor_insert block
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
set fish_cursor_external block
set fish_cursor_visual block
