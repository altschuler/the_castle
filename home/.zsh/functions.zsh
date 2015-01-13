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
        : ${pos:="above"}
        xrandr --output $id --auto --$pos eDP1
    fi
}

# radio!
ro () {
    case "$1" in
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
