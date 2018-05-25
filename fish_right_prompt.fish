function fish_right_prompt
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color green
                echo '⒩'
            case insert
                # set_color --bold --background green white
                # echo 'i'
            case replace_one
                set_color red
                echo '⒭'
            case visual
                set_color blue
                echo '⒱'
        end
        set_color normal
        echo -n ' '
    end
end
