# make dir and cd to it
mdir () {
    mkdir $1 && cd $1
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
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_p1_telemark_mp3_h.m3u
            ;;
        np1p)
            echo "Playing NRK P1+"
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_p1pluss_mp3_h.m3u
            ;;
        np2)
            echo "Playing NRK P2"
            vlc --intf dummy http://lyd.nrk.no/nrk_radio_p2_mp3_h.m3u
            ;;
        wusf)
            echo "Playing WUSF"
            vlc --intf dummy http://dir.xiph.org/listen/289827/listen.m3u
            ;;
        k)
            echo "Playing K-classical"
            vlc --intf dummy http://dir.xiph.org/listen/299408/listen.m3u
            ;;
        ab_bach)
            echo "Playing Abacus Bach"
            vlc --intf dummy http://dir.xiph.org/listen/277514/listen.m3u
            ;;
        ab_bar)
            echo "Playing Abacus Baroque"
            vlc --intf dummy http://dir.xiph.org/listen/255984/listen.m3u
            ;;
        ab_m)
            echo "Playing Abacus Mozart"
            vlc --intf dummy http://dir.xiph.org/listen/277208/listen.m3u
            ;;
        p1)
            echo "Playing: DR P1"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A03L.mp3.m3u
            ;;
        p2)
            echo "Playing: DR P2"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A04L.mp3.m3u
            ;;
        p3)
            echo "Playing: DR P3"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A05L.mp3.m3u
            ;;
        p5)
            echo "Playing: DR P5"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A25L.mp3.m3u
            ;;
        p6)
            echo "Playing: DR P6 BEAT"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A29L.mp3.m3u
            ;;
        p7)
            echo "Playing: DR P7 MIX"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A21L.mp3.m3u
            ;;
        p8)
            echo "Playing: DR P8 JAZZ"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A22L.mp3.m3u
            ;;
        nyheder)
            echo "Playing: DR Nyheder"
            vlc --intf dummy http://live-icy.gss.dr.dk:/A/A02L.mp3.m3u
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
