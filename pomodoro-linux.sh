# https://gist.github.com/bashbunni/3880e4194e3f800c4c494de286ebc1d7
# Requires https://github.com/caarlos0/timer
# sudo apt install lolcat

declare -A pomo_options
pomo_options["work"]="50"
pomo_options["break"]="10"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
    val=$1
    echo $val | lolcat
    timer ${pomo_options["$val"]}m
    spd-say "'$val' session done"
    echo $(date +%H:%M) | lolcat
  else
    timer "${1}m"
    spd-say "Session done"
    echo $(date +%H:%M) | lolcat
  fi
}

alias pwo="pomodoro 'work'"
alias pbr="pomodoro 'break'"
