if status is-interactive
# Commands to run in interactive sessions can go here
  set -g fish_greeting

  command -v zoxide &> /dev/null && zoxide init fish | source

  command -v lsd &> /dev/null && alias ls="lsd"

  cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
  alias s='firefox --search'

  function apply_terminal_colors --on-event fish_postexec
    if test -f ~/.local/state/caelestia/sequences.txt
      cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
    end
  end

  function y
    if test (count $argv) -eq 0
      firefox "https://www.youtube.com"
      return
    end
    set query (string join ' ' $argv | string escape --style=url)
    firefox "https://www.youtube.com/results?search_query=$query"
  end

  function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
  end

end


#cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
# uv
fish_add_path "/home/jayfaza/.local/bin"
