if status is-interactive

  fish_add_path /home/jv/bin/
  fish_add_path /home/jv/.cargo/bin/

  # hide help greeting
  set -g fish_greeting
  # use vi bindings
  fish_vi_key_bindings

  # create or attach to "session"
  if not [ $TMUX ]
    tmux new -As DEFAULT
  end

  # use LS_COLORS
  export LS_COLORS="*.*=0"
  #eval (dircolors -c ~/.config/LS_COLORS)

  # set variables
  set -gx EDITOR nvim
  set -gx VISUAL nvim
  
  # aliases
  alias ls="exa --color=always --icons"
  alias ll="exa -al --color=always --icons"
  alias r=ranger
  alias v=nvim
  alias g=grep
  alias o=open
  alias screenshot=gnome-screenshot

  # built in open function did not like launching nvim
  function  open
    xdg-open $argv 
  end


  cat /etc/motd  
end
