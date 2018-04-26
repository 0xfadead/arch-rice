# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=/usr/bin/vim
export EDITOR="$VISUAL"

# shell opts: see bash(1)
shopt -s cdspell dirspell checkwinsize

alias ls='ls -h --group-directories-first --color=auto -F'
alias ll='ls -lh --group-directories-first --color=auto -F'
alias lla='ls -lah --group-directories-first --color=auto -F'
alias df='df -h'
alias godark='sudo openvpn --config $HOME/.config/cryptostorm/cstorm_linux-uswest_udp.ovpn --auth-nocache --daemon'
alias morning='sudo pacman -Syyu && trizen -Syu'
alias v='/usr/bin/vim'
alias vkern="/usr/bin/vim -c ':set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab'"
alias duals='xrandr --output DP2 --right-of eDP1 --mode 1440x900 && i3-msg restart'
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias zerotier='zerotier-cli'
alias astsu='sudo' # Mr Robot ;)
alias nyan='telnet nyancat.dakko.us'


# ocf stuff
alias ocfs='ssh keur@supernova'
alias phost='ssh -L 8443:printhost:443 keur@supernova'
alias ocfv='ssh keur@virus'
alias ocfp="ssh -tt keur@supernova 'ssh puppet'"
alias ocfm="ssh -tt keur@supernova 'ssh mirrors'"

export PS1="\[\e[0;49;31m\][\[\e[0;49;32m\]\u\[\e[0;49;33m\]@\[\e[0;49;36m\]\h \[\e[0;39;35m\]\W\[\e[0;49;31m\]]\[\e[0;49;37m\]\\$ \[$(tput sgr0)\]"

# External config
if [[ -r ~/.dircolors ]] && type -p dircolors >/dev/null; then
  eval $(dircolors -b "$HOME/.dircolors")
fi

leetmux() {
    if [[ $(type cmatrix 2>/dev/null) ]]; then
        PANE=$((($COLUMNS-2)/10))
        exec tmux new-session \; \
            split-window -h \; \
            split-window -h \; \
            select-pane -t 1 \; \
            resize-pane -t 0 -x $PANE \;  \
            send-keys -t 0 'cmatrix' C-m \;  \
            resize-pane -t 2 -x $PANE \; \
            send-keys -t 2 'cmatrix -C magenta' C-m \;
    else
        exec tmux
    fi
}

hiveme() {
    MACHINE=28
    [[ -n "$1" ]] && MACHINE="$1"
    ssh "cs61c-apx@hive$MACHINE"".cs.berkeley.edu"
}

# Remove trailing whitespace from files
rmwht() {
    for i in $@; do sed -i 's/[[:space:]]\+$//' $i; done;
}

# Convert machine code to shell code
mkshellcode() {
	for i in $(objdump -d $1 -M intel |grep "^ " |cut -f2); do echo -n '\x'$i; done;echo
}

wipedev() {
    bs="4k"
    if [[ -z "$2" ]]; then
        bs="$2"
    fi
    echo $2
    sudo dd if=/dev/zero of=$1 bs="$bs" && sync
}

#fol() {
#    target=$(fc -lnr | perl -lne "print $1 and last if /^\s*(?:cp|mv).*?((?:[^\s\0]|(?<=\\) |(?:(?<=")(?:.*?)(?=")))+$)/")
#
#    if [ -z "$target" ]; then
#        echo "No recent cp or mv cmds."
#    else
#        target=$(eval realpath "$target")
#        # In case a custom filename was given...
#        if [ -f "$target" ]; then
#            target=$(dirname "$target")
#        fi
#        cd "$target"
#    fi
#}

streaming() {
    INRES="1440x900" # input resolution
    OUTRES="1440x900" # output resolution
    FPS="30" # target FPS
    GOP="60" # i-frame interval, should be double of FPS,
    GOPMIN="30" # min i-frame interval, should be equal to fps,
    THREADS="2" # max 6
    CBR="2000k" # constant bitrate (should be between 1000k - 3000k)
    QUALITY="ultrafast"  # one of the many FFMPEG preset
    AUDIO_RATE="44100"
    STREAM_KEY="$1" # use the terminal command Streaming streamkeyhere to stream your video to twitch or justin
    SERVER="live-lax" # twitch server in Los Angeles, see http://bashtech.net/twitch/ingest.php for list

    ffmpeg -f x11grab -s "$INRES" -r "$FPS" -i :0.0+1600,0 -f alsa -i pulse -f alsa -i pulse -f flv -filter_complex amix=inputs=2 -ac 2 -ar $AUDIO_RATE \
      -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR -minrate $CBR -maxrate $CBR -pix_fmt yuv420p\
      -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS -strict normal \
      -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"
}

