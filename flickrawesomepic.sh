#! /bin/bash

prevname=$(grep -e "<file>/.*.jpg" contest/precise.xml | sed "s/<file>/ /g" | sed "s/<[\/?]file>/ /g" | tail -1 | cut -d" " -f 6)
name=/usr/share/backgrounds/$(/usr/bin/python /usr/share/backgrounds/flickrawesomepic.py)
echo "debug : " $prevname
echo "debug : " $name

eval "sed -i s,\</background\>,\<transition\>\<duration\>5.0\</duration\>\<from\>${prevname}\</from\>\<to\>${name}\</to\>\</transition\>\<static\>\<duration\>1795.0\</duration\>\<file\>${name}\</file\>\</static\>\</background\>,g /usr/share/backgrounds/contest/precise.xml"
