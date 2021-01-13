#!/bin/bash
set -e

if [ ! $(which mplayer) ]; then 
  echo "Missing mplayer - please install (e.g \"brew install mplayer\")"
  exit 1;
fi

if [ $(crontab -l > /dev/null) ]; then
  crontab -l > mycron
fi

echo "00 11,14,17 * * 1-5 mplayer ~/.kloppi/kloppi.wav" >> tempcron
crontab tempcron
rm tempcron

echo "Installed cronjob - will execute at 11:00, 14:00 and 17:00"

mkdir ~/.kloppi
curl -sSLo ~/.kloppi/kloppi.wav "https://github.com/trenchbear/kloppstaller/blob/main/bin/kloppi.wav?raw=true"
echo "Downloaded audio to ~/.kloppi/kloppi.wav"

echo;
echo "Have a nice day. Kloppi!"
