# countdown: Function for countdown
function countdown(){
   date1=$((`gdate +%s` + $1));
   while [ "$date1" -ge `gdate +%s` ]; do
     echo -ne "$(gdate -u --date @$(($date1 - `gdate +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

#function countdown
#(
#  IFS=:
#  set -- $*
#  secs=$(( ${1#0} * 3600 + ${2#0} * 60 + ${3#0} ))
#  PREFIX="$4"
#  while [ $secs -gt 0 ]
#  do
#    sleep 1 &
#    printf "\r%s >  %02d:%02d:%02d" "$PREFIX"  $((secs/3600)) $(( (secs/60)%60)) $((secs%60))
#    secs=$(( $secs - 1 ))
#    wait
#  done
#  echo
#)

# Execute the function
#countdown "00" "20" "00" "Countdown-timer"

# If you wish to run a command after this timer, place it after this comment
#echo "Done!"

# Exit cleanly
#exit 0