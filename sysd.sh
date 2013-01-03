#!/bin/bash
#
# vim:          ft=sh tw=79 sw=4:
# file:         sysd.sh
# author:       Jason Wryan, further modified by Brian Buccola
#
# description:  wrapper for managing systemd services


usage() {
    cat <<EOF

    Systemctl options:

    start       |   start a service
    restart     |   reload unit configuration
    stop        |   a service
    enable      |   start at boot
    is-enabled  |   check if enabled
    status      |   current status
    disable     |   do not start at boot

    list        |   list all running services
    installed   |   list all installed unit files
    read        |   read the relevant service file
    failed      |   list failed services

    reboot      |   restart
    shut        |   poweroff

    help        |   show the unit manual page

EOF
}


# These actions require super user permissions.
actions=("start" "restart" "stop" "enable" "disable")

for i in "${actions[@]}"; do
    if [[ "$i" = "$1" ]]; then
        super="yes"
    fi
done


if [[ $# -eq 2 ]] && [[ "$super" == "yes" ]]; then
    sudo systemctl "$1" "$2".service

elif [[ $# -eq 2 ]] && [[ "$1" == "read" ]]; then
    less -FX /usr/lib/systemd/system/"$2".service

elif [[ $# -eq 2 ]]; then
    systemctl "$1" "$2".service
fi

if [[ $# -eq 1 ]]; then
    case "$1" in
             list) systemctl list-units      ;;
        installed) systemctl list-unit-files ;;
            fail*) systemctl --failed        ;;
           reboot) systemctl reboot          ;;
            shut*) systemctl poweroff        ;;
                *) usage && exit             ;;
   esac
fi
