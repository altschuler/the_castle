# make dir and cd to it
mdir () {
    mkdir $1 && cd $1
}

# find-in-files
fif() {
    find $1 -name $2 | xargs ag $3
}

# (dis)connect a monitor
sc () {
    local id=`xrandr | awk '$2 == "connected" && $1 != "eDP1" { print $1 }'`
    if [[ -z $id ]]
    then
        echo "No monitors found"
    elif [[ $1 == "off" ]]
    then
        echo "Disconnecting $id"

        xrandr --output $id --off
    else
        echo "Connecting $id"

        local pos=$1
        case "$pos" in
            ro) pos=right-of ;;
            lo) pos=left-of ;;
            a) pos=above ;;
            b) pos=below ;;
        esac
        xrandr --output $id --auto --$pos eDP1
    fi
}

# radio!
ro () {
    case "$1" in
        np1t)
            echo "Playing NRK P1 Telemark"
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_p1_telemark_mp3_h
            ;;
        np1p)
            echo "Playing NRK P1+"
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_p1pluss_mp3_h
            ;;
        np1tr)
            echo "Playing NRK P1 Trondheim"
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_p1_trondelag_aac_h
            ;;
        np2)
            echo "Playing NRK P2"
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_p2_mp3_h
            ;;
        nk)
            echo "Playing NRK Klassisk"
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_klassisk_mp3_h
            ;;
        wusf)
            echo "Playing WUSF"
            vlc --intf dummy http://dir.xiph.org/listen/289827/listen
            ;;
        k)
            echo "Playing K-classical"
            vlc --intf dummy http://dir.xiph.org/listen/299408/listen
            ;;
        ab_bach)
            echo "Playing Abacus Bach"
            vlc --intf dummy http://dir.xiph.org/listen/277514/listen
            ;;
        ab_bar)
            echo "Playing Abacus Baroque"
            vlc --intf dummy http://dir.xiph.org/listen/255984/listen
            ;;
        ab_m)
            echo "Playing Abacus Mozart"
            vlc --intf dummy http://dir.xiph.org/listen/277208/listen
            ;;
        p1)
            echo "Playing: DR P1"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A03L.mp3
            ;;
        p2)
            echo "Playing: DR P2"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A04L.mp3
            ;;
        p3)
            echo "Playing: DR P3"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A05L.mp3
            ;;
        p5)
            echo "Playing: DR P5"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A25L.mp3
            ;;
        p6)
            echo "Playing: DR P6 BEAT"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A29L.mp3
            ;;
        p7)
            echo "Playing: DR P7 MIX"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A21L.mp3
            ;;
        p8)
            echo "Playing: DR P8 JAZZ"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A22L.mp3
            ;;
        nyheder)
            echo "Playing: DR Nyheder"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A02L.mp3
            ;;
        *)
            echo "Unknown channel '$1'"
            ;;
    esac
}

# timers
function countdown() {
    date1=$((`date +%s` + $1));
    while [ "$date1" -ne `date +%s` ]; do
        echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
        sleep 0.1
    done
}

function stopwatch() {
    date1=`date +%s`;
    while true; do
        echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
        sleep 0.1
    done
}

# sound
function vol() {
    amixer -c 1 set Master $1
}

# vpn
function vpn() {
    sudo openvpn /etc/openvpn/client/$1.nordvpn.com.tcp443.ovpn
}

function recgif() {
    TMP_AVI=$(mktemp /tmp/outXXXXXXXXXX.avi)
    ffcast -s % ffmpeg -y -f x11grab -show_region 1 -framerate 15  \
           -video_size %s -i %D+%c -codec:v huffyuv                \
           -vf crop="iw-mod(iw\\,2):ih-mod(ih\\,2)" $TMP_AVI       \
        && convert -set delay 10 -layers Optimize $TMP_AVI out.gif
}

# terminal font size
function fsize() {
    printf '\33]50;%s%d\007' "xft:Source Code Pro:pixelsize=" $1
}

# lipsum
function lipsum() {
    lorem-ipsum-generator $@ | xclip -i -selection clipboard
}
