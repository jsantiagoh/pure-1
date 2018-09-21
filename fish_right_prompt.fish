function fish_right_prompt_vi_mode
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

function __kubernetes_context -d "Show the kubernetes context"
    set -l KUBECTL_PROMPT_ICON "⎈"
    set -l config $KUBECONFIG
    [ -z "$config" ]
    and set -l config "$HOME/.kube/config"

    set -l ctx (kubectl config current-context 2>/dev/null)

    set -l ns (kubectl config view -o "jsonpath={.contexts[?(@.name==\"$context\")].context.namespace}")
    [ -z $ns ]
    and set -l ns 'default'

    if test "$ctx" = "docker-for-desktop"
        echo (set_color green)"$KUBECTL_PROMPT_ICON"(set_color normal)
    else
        echo (set_color red)"$KUBECTL_PROMPT_ICON"(set_color normal)
    end
    # echo "$ctx"
end

function fish_right_prompt
#   echo (__kubernetes_context)
end