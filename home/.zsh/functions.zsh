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
