#!/bin/bash

startername="balls"

function check_file {
    [ -f "$1" ]
    return $?
}

if check_file /usr/share/applications/screensavers/$startername.desktop; then
    echo "Der Screensaver $startername ist bereits installiert."
    echo "Möchtest Du ihn deinstallieren oder neu installieren?"
    echo
    echo "The screensaver $startername is already installed."
    echo "Do you want to uninstall or reinstall it?"
    echo
    read -p"Deinstallieren/Uninstall (u) | Neuinstallation/Reinstall (r) | Abbruch/Cancel (q)" response
    if [[ "$response" == "u" ]]; then
        uninst=1
    fi
    if [[ "$response" == "r" ]]; then
        uninst=0
    fi
    if [[ "$response" != "u" && "$response" != "r" ]]; then
        exit
    fi
else
    uninst=0
    echo "Bei Systemen ohne MATE-SCREENSAVER ist der xscreensaver zu installieren."
    echo "ZBsp. unter Ubuntu: sudo apt install xscreensaver"
    echo
    echo "For systems without MATE-SCREENSAVER the xscreensaver has to be installed."
    echo "E.g. on Ubuntu: sudo apt install xscreensaver"
    echo
    read -p"Weiter (j/n) | Continue (y/n)? " response
    if [[ "$response" != "j" && "$response" != "y" ]]; then
        exit
    fi
fi

dist=$(cat /etc/os-release | grep ^"ID=")

sudo_command="sudo"

if [[ "$dist" == *"debian"* ]]; then
    #su - root
    sudo_command="sudo"
fi

username=$USER
DIR="$(dirname "${BASH_SOURCE[0]}")"
pfad="$(realpath "${DIR}")"

if [[ $uninst == 1 ]]; then
    $sudo_command rm /usr/share/applications/screensavers/$startername.desktop
    $sudo_command rm /usr/lib/xscreensaver/$startername
    $sudo_command rm /usr/libexec/xscreensaver/$startername
    $sudo_command rm /usr/share/xscreensaver/config/$startername.xml

    if check_file $HOME/.xscreensaver; then
        sed -i '/		balls      	/d' $HOME/.xscreensaver
    fi

    echo "Screensaver $startername ist deinstalliert!"
    echo "Screensaver $startername is uninstalled!"
    exit
fi

echo "#!/bin/bash" > $startername
echo >> $startername
echo "killall -9 balls.bin" >> $startername
echo >> $startername
echo "#su "$username >> $startername
echo >> $startername
echo "cd "$pfad >> $startername
echo >> $startername
echo "export LD_PRELOAD=/usr/lib64/libstdc++.so.6" >> $startername
echo "export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libstdc++.so.6" >> $startername
echo >> $startername
echo "/usr/bin/mate-screensaver-command -p" >> $startername
echo >> $startername
echo "/usr/bin/xscreensaver-command -exit" >> $startername
echo "/usr/bin/xscreensaver-command -deactivate" >> $startername
echo >> $startername
echo "./$startername.bin" >> $startername
echo >> $startername
echo "exit" >> $startername

chmod +x $startername

$sudo_command mkdir -p /usr/share/applications/screensavers && $sudo_command cp $startername.desktop $_
$sudo_command mkdir -p /usr/lib/xscreensaver && $sudo_command cp $startername $_
$sudo_command mkdir -p /usr/libexec/xscreensaver && $sudo_command cp $startername $_
$sudo_command mkdir -p /usr/share/xscreensaver/config && $sudo_command cp $startername.xml $_

$sudo_command chmod 644 /usr/share/applications/screensavers/$startername.desktop
$sudo_command chmod 644 /usr/share/xscreensaver/config/$startername.xml
$sudo_command chmod 755 /usr/lib/xscreensaver/$startername
$sudo_command chmod 755 /usr/libexec/xscreensaver/$startername
chmod 755 $pfad/$startername.bin

rm $startername

if check_file $HOME/.xscreensaver; then
    sed -i '/\- GL\:/{ a\ \ GL\: 				balls      			    \\n\\
    ; :label n; b label }' $HOME/.xscreensaver
else
    echo "Warning: ~/.xscreensaver not found! With mate-screensaver this warning is not relevant."
fi

echo "Screensaver $startername ist installiert! Möglicherweise muss das System neu gestartet werden! Viel Spass ;)"
echo "Screensaver $startername is installed! It may be necessary to restart the system! Have fun ;)"

