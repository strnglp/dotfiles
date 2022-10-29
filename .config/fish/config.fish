if status is-interactive

  source ~/.profile

  # hide help greeting
  set -g fish_greeting
  # use vi bindings
  fish_vi_key_bindings

  # create or attach to "session"
  if not [ $TMUX ]
    tmux new -As (hostname)
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
  alias mount_cube_sync="sudo sshfs -o allow_other,default_permissions jv@cube:/home/jv/Sync/ ~/Sync/"
  alias reconnect_tmux="tmux new -As DEFAULT"
end
