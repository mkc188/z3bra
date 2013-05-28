#!/bin/bash

pgrep ^mpd >> /dev/null
retour=$?
if [ "$retour" = 0 ]; then

CURRENT=`ncmpcpp --now-playing "[ {%a - %t}|{%f} ]"`
cat << EOFMPD
<openbox_pipe_menu>
    <separator label="$CURRENT"/>
    <item label="Play / Pause">
        <action name="Execute">
            <execute>mpc toggle</execute>
        </action>
    </item>
    <item label="Stop">
        <action name="Execute">
            <execute>mpc stop</execute>
        </action>
    </item>
    <item label="Suivante">
        <action name="Execute">
            <execute>mpc next</execute>
        </action>
    </item>
    <item label="Précédente">
        <action name="Execute">
            <execute>mpc prev</execute>
        </action>
    </item>
    <separator/>
        <menu id="volume" label="volume">
            <item label="10">
                <action name="Execute">
                    <execute>mpc volume 10</execute>
                </action>
            </item>
            <item label="20">
                <action name="Execute">
                    <execute>mpc volume 20</execute>
                </action>
            </item>
            <item label="30">
                <action name="Execute">
                    <execute>mpc volume 30</execute>
                </action>
            </item>
            <item label="40">
                <action name="Execute">
                    <execute>mpc volume 40</execute>
                </action>
            </item>
            <item label="50">
                <action name="Execute">
                    <execute>mpc volume 50</execute>
                </action>
            </item>
            <item label="60">
                <action name="Execute">
                    <execute>mpc volume 60</execute>
                </action>
            </item>
            <item label="70">
                <action name="Execute">
                    <execute>mpc volume 70</execute>
                </action>
            </item>
            <item label="80">
                <action name="Execute">
                    <execute>mpc volume 80</execute>
                </action>
            </item>
            <item label="90">
                <action name="Execute">
                    <execute>mpc volume 90</execute>
                </action>
            </item>
            <item label="100">
                <action name="Execute">
                    <execute>mpc volume 100</execute>
                </action>
            </item>
        </menu>
        <item label="Répétition">
            <action name="Execute">
                <execute>mpc repeat</execute>
            </action>
        </item>
        <item label="Aléatoire">
            <action name="Execute">
                <execute>mpc random</execute>
            </action>
        </item>
        <separator/>
        <item label="Mise à jour">
            <action name="Execute">
                <execute>mpc update</execute>
            </action>
        </item>
        <item label="Kill mpd">
            <action name="Execute">
                <execute>mpd --kill</execute>
            </action>
        </item>
</openbox_pipe_menu>
EOFMPD

else
cat << EOFNOMPD
<openbox_pipe_menu>
    <separator label="MPD est inactif"/>
    <item label="Lancer MPD">
        <action name="Execute">
            <execute>mpd</execute>
        </action>
    </item>
</openbox_pipe_menu>
EOFNOMPD
fi
