#  ---------------------------------------------------------------------------
#
#  ______      _  ______ _ _           
#  |  _  \    | | |  ___(_) |          
#  | | | |___ | |_| |_   _| | ___  ___ 
#  | | | / _ \| __|  _| | | |/ _ \/ __|
#  | |/ / (_) | |_| |   | | |  __/\__ \
#  |___/ \___/ \__\_|   |_|_|\___||___/
#                                                                            
#  Description:  Mac OS X Dotfiles - Simply designed to fit your shell life.
#
#  Sections:
#
#  	1.  Allow aliases to be with sudo
#  	2.  Generic aliases
#  	3.  Quicker navigation
#  	4.  Jekyll
#  	5.  Heroku's commands
#  	6.  Ionic commands
#  	7.  Emulate iOS using different Apple devices
#  	8.  Git SCM Cheats
#  	9.  App engine commands
#  	10. Add an 'alert' alias for long running commands.
#  	11. Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
#  	12. Shorter commands for `Homebrew`.
#  	13. Speed-up Terminal load time by clearing system logs
#  	14. Empty the Trash on all mounted volumes and the main HDD
#  	15. Open the device simulators
#  	16. Recursively delete .DS_Store files
#  	17. Hidden Files
#  	18. Clean up LaunchServices to remove duplicates in the 'Open With' menu
#  	19. Run a screen saver on the Desktop
#  	20. Things for Subversion
#  	21. Application launchers
#  	22. Recommended 'top' invocation to minimize resources
#  	23. Networking
#  	24. Limit Ping to 5 ECHO_REQUEST packets
#  	25. Wget with resume
#  	26. Searching
#  	27. Find memory hogs
#  	28. Find CPU hogs
#
#  ---------------------------------------------------------------------------


# Detect which `ls` flavour is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag='--color'
  export colorflag
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag='-G'
  export colorflag
	export CLICOLOR=1
	export LSCOLORS='GxFxCxDxBxegedabagaced'
fi


#  ---------------------------------------------------------------------------
#  	1.  Allow aliases to be with sudo
#       Please refer to http://www.shellperson.net/using-sudo-with-an-alias/
#  ---------------------------------------------------------------------------

# Common
alias sudo='sudo '
alias reload='reset'

# Purging Xcode DerivedData
alias purge='rm -rf ~/library/Developer/Xcode/DerivedData/*'


#  ---------------------------------------------------------------------------
#  	2.  Generic aliases
#  ---------------------------------------------------------------------------
alias c="clear && printf '\e[3J'"
alias dt='tee ~/Desktop/terminalOut.txt' # dt: Pipe content to file on MacOS Desktop
alias du='du -h'
alias flush='sudo dscacheutil -flushcache'
alias grep='grep --color'
alias h='history'
alias kp='ps auxwww'
alias l='ls -lF ${colorflag}' # Show long listing information about the file/directory
alias l1='ls -1' # Display one file per line
alias la='ls -a' # Display Hidden Files
alias la='ls -lAF ${colorflag}'
alias last='ls -t' # Sorts all files by modification time, showing the last edited file first.
alias ld='ls -ld' # Display directory information
alias lf='ls -lf' # Visual Classification of Files With Special Characters
alias lh='ls -lh' # Display file size in human readable format
alias li='ls -i' # Display File Inode Number 
alias ll='/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first'
alias ln='ls -n' # Display File UID and GID 
alias locale='locale -a | grep UTF-8'
alias lq='ls -q' # Hide Control Characters
alias lr='ls -R | grep ':$' | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias lr='ls -R' # Display Files Recursively
alias ls='command ls ${colorflag}'
alias lsd='ls -lF ${colorflag} | grep --color=never "^d"'
alias lt='ls -lt' # Order Files Based on Last Modified Time
alias ltr='ls -ltr' # Order Files Based on Last Modified Time (In Reverse Order)
alias makedir='mkdir -pv'
alias numFiles='echo $(ls -1 | wc -l)' # numFiles: Function to count of non-hidden files in current dir
alias p='pwd'
alias path='echo -e ${PATH//:/\\n}'
alias q='exit'
alias r='reload'
alias removedir=rmdir
alias repair_permissions='diskutil repairPermissions /'
alias repair_volume='diskutil repairvolume /'
alias rmdir='rm –rf'
alias shutdown="shutdown -h now"
alias top='htop'
alias verify_permissions='diskutil verifyPermissions /'
alias verify_volume='diskutil verifyvolume /'



#  ---------------------------------------------------------------------------
#  	3.  Quicker navigation
#  ---------------------------------------------------------------------------
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias cd.='cd $(readlink -f .)'     # go to real dir (i.e. if current dir is linked)
alias less='less -R'                # Make less always work with coloured input
alias opendir='open -a Finder ./'
alias path='echo "$PATH" | tr ":" "\n" | nl'
alias so='shopt'
alias zap='rm -i'                   # Remove file with warning
alias ~='cd ~'


#  ---------------------------------------------------------------------------
#  	4.  Jekyll
#  ---------------------------------------------------------------------------

alias site-dev='JEKYLL_ENV=dev bundle exec jekyll serve --watch --trace'
alias site-production='JEKYLL_ENV=production bundle exec jekyll serve --watch --trace'


#  ---------------------------------------------------------------------------
#  	5.  Heroku's commands
#  ---------------------------------------------------------------------------

alias hcp='heroku console --remote production'
alias hcs='heroku console --remote staging'
alias hlp='heroku logs -t --remote production'
alias hls='heroku logs -t --remote staging'


#  ---------------------------------------------------------------------------
#  	6.  Ionic commands
#  ---------------------------------------------------------------------------

alias ionandroid='ionic emulate android'
alias ionandroidrun='ionic run android'
alias ionb='ionic build'
alias ionbandroid='ionic build android'
alias ionbios='ionic build ios'
alias iondroidreset='ionpr-android | ionpa-android | ionbandroid'
alias ionicons='open http://ionicons.com/'
alias ionios='ionic emulate ios'
alias ioniosrun='ionic run ios'
alias ionosreset='ionpr-ios | ionpa-ios | ionbios'
alias ionpa-android='ionic platform add android'
alias ionpa-ios='ionic platform add ios'
alias ionpr-android='ionic platform remove android'
alias ionpr-ios='ionic platform remove ios'
alias ions='ionic serve'
alias ionup='npm update -g cordova ionic'


#  ---------------------------------------------------------------------------
#  	7.  Emulate iOS using different Apple devices
#  ---------------------------------------------------------------------------

alias ione-ios-4s='ionic emulate ios --target='iPhone-4s''
alias ione-ios-5='ionic emulate ios --target='iPhone-5''
alias ione-ios-5s='ionic emulate ios --target='iPhone-5s''
alias ione-ios-6-Plus='ionic emulate ios --target='iPhone-6-Plus''
alias ione-ios-6='ionic emulate ios --target='iPhone-6''
alias ione-ios-iPad-2='ionic emulate ios --target='iPad-2''
alias ione-ios-iPad-Air='ionic emulate ios --target='iPad-Air''
alias ione-ios-iPad-Retina='ionic emulate ios --target='iPad-Retina''


#  ---------------------------------------------------------------------------
#  	8.  Git SCM Cheats
#  ---------------------------------------------------------------------------

alias g=git
alias ga='git add'
alias gaa='git add --all'
alias gad='git add .'
alias gau='git add --update'
alias gb='git branch'
alias gbd='git branch -d'
alias gbl='git blame --date short'
alias gbr='git branch -r'
alias gbs='git branch -a'
alias gc='git commit'
alias gcam='git commit --amend -m'
alias gce='git commit -a'
alias gcl='git config --list'
alias gcm='git commit -m '
alias gco='git checkout'            #undo to last commit
alias gd='git diff'
alias gdh='git diff HEAD'
alias gdh1='git diff HEAD^'
alias gdh2='git diff HEAD^^'
alias gdh5='git diff HEAD~5'
alias gds='git diff --staged'
alias gf='git fetch'
alias gi='git init'
alias gitremoveallmergedbranches='git branch --merged | grep -v '\*' | xargs -n 1 git branch -d'
alias gl1d='git log --since=1.day.ago'
alias gl1w='git log --since=1.week.ago'
alias gl7d='git log --since=7.days.ago'
alias glg='git log --oneline --graph --all --decorate'
alias glgc='clear && git log --oneline --graph --all --decorate'
alias gll='git log --graph --full-history --all --color'
alias gm='git merge'
alias gnuke='git branch --merged | xargs git branch -d'
alias gob='git checkout -b'
alias gout='git checkout'
alias gpo='git push -u origin'
alias gpo='git push origin'
alias gpom='git push -u origin master'
alias gpt='git push --tags'
alias gpul='git pull'
alias gpum='git pull origin master'
alias gpus='git push'
alias gra='git remote add'
alias grao='git remote add origin'
alias grh='git reset HEAD'          #unstage some files
alias grhh='git reset --hard HEAD^' #role back fully to last commit! //be careful
alias grm='git rm'
alias grmc='git rm --cached'
alias grs='git remote -v'
alias grsh='git reset --soft HEAD^' #role back to stage!
alias grso='git remote show origin'
alias grv='git revert'
alias gs='git status -sb'
alias gsu='git submodule update --recursive'
alias gt='git tag'
alias gta='git tag -a'
alias gts='git tag'


#  ---------------------------------------------------------------------------
#  	9.  App engine commands
#  ---------------------------------------------------------------------------

alias gaeauth='appcfg.py --oauth2'
alias gaeup='appcfg.py --oauth2 update .'
alias gaeupauth='appcfg.py --oauth2 -V dev update . && appcfg.py --oauth2 update . -V'



#  ---------------------------------------------------------------------------
#  	10.  Add an 'alert' alias for long running commands.  Use like so: sleep 10; alert
#  ---------------------------------------------------------------------------

#alias alert='notify-send --urgency=low -i ''$([ $? = 0 ] && echo terminal || echo error)'' ''$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')'''


#  ---------------------------------------------------------------------------
#  	11.  Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
#  ---------------------------------------------------------------------------

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages

alias update='sudo softwareupdate -i -a; brew cu --all; brew doctor; brew update; brew upgrade; brew cask cleanup; brew prune; brew cleanup; mas upgrade; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

#  ---------------------------------------------------------------------------
#  	12.  Shorter commands for `Homebrew`.
#  ---------------------------------------------------------------------------

alias brewd='brew doctor'
alias brewi='brew install'
alias brews='brew search'
alias brewu='brew uninstall'
alias brewupdate='brew update && brew upgrade && brew cleanup && brew doctor'


#  ---------------------------------------------------------------------------
#  	13.  Speed-up Terminal load time by clearing system logs
#  ---------------------------------------------------------------------------

alias speedup='sudo rm -rf /private/var/log/asl/*'


#  ---------------------------------------------------------------------------
#  	14.  Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
#  ---------------------------------------------------------------------------

alias emptytrash='rm -rf ~/.Trash/*'


#  ---------------------------------------------------------------------------
#  	15.  Open the device simulators
#  ---------------------------------------------------------------------------

alias iphone='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'


#  ---------------------------------------------------------------------------
#  	16.  cleanupDS: Recursively delete .DS_Store files
#  ---------------------------------------------------------------------------

alias cleanupDS='find . -type f -name ''*.DS_Store'' -ls -delete'


#  ---------------------------------------------------------------------------
#  	17.  Hidden Files  
#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#  ---------------------------------------------------------------------------

alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'
alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'


#  ---------------------------------------------------------------------------
#  	18.  cleanupLS:  Clean up LaunchServices to remove duplicates in the 'Open With' menu
#  ---------------------------------------------------------------------------

alias cleanupLS='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder'


#  ---------------------------------------------------------------------------
#  	19.  screensaverDesktop: Run a screensaver on the Desktop
#  ---------------------------------------------------------------------------

alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'


#  ---------------------------------------------------------------------------
#  	20.  Subversion
#  ---------------------------------------------------------------------------

alias sa='svn add'
alias sc='svn commit'
alias sd='svn delete'
alias sm='svn move'
alias sr='svn rename'
alias ss='svn status'


#  ---------------------------------------------------------------------------
#  	21.  Application launchers
#  ---------------------------------------------------------------------------

alias css='open -a /Applications/CSSEdit.app'
alias e='open -a "Visual Studio Code"'
alias edit='open -a "Visual Studio Code"'
alias ipinfo='$HOME/Bin/gt-ipinfo.sh'
alias mate='open -a "Visual Studio Code"'
alias preview='open -a /System/Applications/Preview.app'
alias sql='open -a /Applications/Sequel\ Pro.app'
alias www='open -a /Applications/Safari.app'
alias xcode='open -a xcode'




#  ---------------------------------------------------------------------------
#  	22.  ttop:  Recommended 'top' invocation to minimize resources
#  ---------------------------------------------------------------------------

alias ttop='top -R -F -s 10 -o rsize'


#  ---------------------------------------------------------------------------
#  	23.  Networking
#  ---------------------------------------------------------------------------

alias flushDNS='sudo killall -HUP mDNSResponder'                                                # flushDNS:     Flush out the DNS Cache
alias ipInfo0='ipconfig getpacket en0'                                                          # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'                                                          # ipInfo1:      Get info on connections for en1
alias lsock='sudo /usr/sbin/lsof -i -P'                                                         # lsock:        Display open sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'                                               # lsockT:       Display only open TCP sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'                                               # lsockU:       Display only open UDP sockets
alias myip='curl -s checkip.dyndns.org | sed -e ''s/.*Current IP Address: //'' -e ''s/<.*$//''' # myip:         Public facing IP Address
alias netCons='lsof -i'                                                                         # netCons:      Show all open TCP/IP sockets
alias op='sudo lsof -i -P'                                                                      # op:           List of open ports
alias openPorts='sudo lsof -i | grep LISTEN'                                                    # openPorts:    All listening connections

#  ---------------------------------------------------------------------------
#  	24.  Limit Ping to 5 ECHO_REQUEST packets
#  ---------------------------------------------------------------------------

alias ping='ping -c 5'

#  ---------------------------------------------------------------------------
#  	25.  wget with resume
#  ---------------------------------------------------------------------------

alias wget='wget -c'


#  ---------------------------------------------------------------------------
#  	26.  Searching
#  ---------------------------------------------------------------------------

alias qfind='find . -name '              # qfind:    Quickly search for file


#  ---------------------------------------------------------------------------
#  	27.  memHogsTop, memHogsPs:  Find memory hogs
#  ---------------------------------------------------------------------------

alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias memHogsTop='top -l 1 -o rsize | head -20'

#  ---------------------------------------------------------------------------
#  	28.  cpuHogs:  Find CPU hogs
#  ---------------------------------------------------------------------------

alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
