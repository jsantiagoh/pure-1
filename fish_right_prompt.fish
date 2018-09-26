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
        echo (set_color red)"$KUBECTL_PROMPT_ICON"(set_color normal)" $ctx/$ns"(set_color normal)
    end
end

function fish_right_prompt
    echo (__kubernetes_context)
end
