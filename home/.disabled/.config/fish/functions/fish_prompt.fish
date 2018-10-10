function fish_prompt
    set_color red
    echo -n (whoami)

    set_color normal
    echo -n " at "

    set_color green
    echo -n (hostname)

    set_color normal
    echo -n " in "

    set_color yellow
    echo -n (prompt_pwd)

    set_color normal
    echo -n " as "

    set_color blue
    echo -n (git config --get user.email)

    echo

    set_color normal
    echo "λ "
end
