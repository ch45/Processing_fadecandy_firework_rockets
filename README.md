
Processing fadecandy firework rockets
-------------------------------------

Cmd Line
--------

rem Windows

    path %PATH%;D:\Apps\processing-3.5.4
    processing-java.exe --sketch=%cd%\Processing_fadecandy_firework_rockets --run exit=60

\# raspi (vnc)

    processing-java --sketch=./Processing_fadecandy_firework_rockets --run exit=60

\# raspi (ssh i.e. headless)

    xvfb-run processing-java --sketch=./Processing_fadecandy_firework_rockets --run exit=60


Thanks to
---------

Daniel Shiffman, CC_027_FireWorks_2D: http://codingtra.in, http://patreon.com/codingtrain
