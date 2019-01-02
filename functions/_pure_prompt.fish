function _pure_prompt
    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name
    set --local pure_symbol (_pure_prompt_symbol $argv[1])
    set --local kubernetes (__kubernetes_context) # Kubernetes context

    echo (_pure_print_prompt $virtualenv $kubernetes $pure_symbol)
end
