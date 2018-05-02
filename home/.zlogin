#{
  ## Compile the completion dump to increase startup speed.
  #zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  #if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    #zcompile "$zcompdump"
  #fi
#} &!

# Print a centered logon message
if (( $+commands[adage] )); then
  if [[ -t 0 || -t 1 ]]; then
    if [[ "$TMUX_PANE" == "%1" ]]; then
      echo "tmux pane"
      adage -e -s | center-text
    fi
  fi
fi
