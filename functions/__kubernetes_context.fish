function __kubernetes_context -d "Show the kubernetes context"
    if not type -q kubectl
        # No kubectl, there's nothing to do here
        return
    end

    set -l KUBECTL_PROMPT_ICON "⎈"
    set -l config $KUBECONFIG
    [ -z "$config" ]
    and set -l config "$HOME/.kube/config"

    set -l ctx (kubectl config current-context 2>/dev/null)

    set -l ns (kubectl config view -o "jsonpath={.contexts[?(@.name==\"$context\")].context.namespace}")
    [ -z $ns ]
    and set -l ns 'default'

    if test "$ctx" = ""
        return
    end

    switch "$ctx"
    case "minikube"
        echo (set_color green)"$KUBECTL_PROMPT_ICON"(set_color normal)
    case "docker-for-desktop"
        echo (set_color blue)"$KUBECTL_PROMPT_ICON"(set_color normal)" $ctx"(set_color normal)
    case '*'
        echo (set_color red)"$KUBECTL_PROMPT_ICON"(set_color normal)" $ctx/$ns"(set_color normal)
    end
end
