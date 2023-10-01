Läuft auf / Runs on:
- Linux Mint Mate
- Kubuntu (KDE)
- Xubuntu (XFCE)
- Debian Mate Desktop

Probleme auf / Problems on:
- Linux Mint Cinnamon (Grafik läuft nur im Hintergrund)
- Lubuntu (xset s on, xset s 60 60, xset s noblank, xset q >> schwarzer Bildschirm)
- Fedora (libGL error: MESA-LOADER: failed to open swrast)
- Debian ohne/without Mate Desktop


Bei Systemen ohne MATE-SCREENSAVER ist zuerst der xscreensaver zu installieren.
ZBsp. unter Ubuntu: sudo apt install xscreensaver

For systems without MATE-SCREENSAVER the xscreensaver has to be installed first.
E.g. on Ubuntu: sudo apt install xscreensaver


Installieren/deinstallieren (install/uninstall):
================================================

./installer.sh


Konfigurieren (configure):
==========================

./configure.sh

ENTER behält den aktuellen Wert bei (ENTER keeps the current value).
- Variante: 1 = diagonal, 2 = horizontal/vertikal
- Verzögerung: Je kleiner, je schneller (The smaller, the faster). 0 to 1 second.
- Display: Normal 0. In virtuellen Maschinen oft 3 (Normally 0. In virtual machines often 3).


Kompiliert mit einem 64bit LM System.
Bei Interesse gebe ich den original Python3 Quelltext gerne raus.

Compiled with a 64bit LM system.
If you are interested I will give you the original Python3 source code.
