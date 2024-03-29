#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo "
$(tput setaf 6)=============================================================================
$(tput setaf 6)::::::::  :::    :::     :::     :::::::::  :::    ::: :::    :::  ::::::::   :::::::: ::::::::::: 
$(tput setaf 6):+:    :+: :+:    :+:   :+: :+:   :+:    :+: :+:   :+:  :+:    :+: :+:    :+: :+:    :+:    :+:     
$(tput setaf 6)+:+        +:+    +:+  +:+   +:+  +:+    +:+ +:+  +:+   +:+    +:+ +:+    +:+ +:+           +:+     
$(tput setaf 6)+#++:++#++ +#++:++#++ +#++:++#++: +#++:++#:  +#++:++    +#++:++#++ +#+    +:+ +#++:++#++    +#+     
$(tput setaf 6)       +#+ +#+    +#+ +#+     +#+ +#+    +#+ +#+  +#+   +#+    +#+ +#+    +#+        +#+    +#+     
$(tput setaf 6)#+#    #+# #+#    #+# #+#     #+# #+#    #+# #+#   #+#  #+#    #+# #+#    #+# #+#    #+#    #+#     
$(tput setaf 6)########  ###    ### ###     ### ###    ### ###    ### ###    ###  ########   ########     ###         
$(tput setaf 6)==============================================================================
    "  
}

function forceStuffs {
  # Forcing Default Server Icon.
  curl -O https://media.discordapp.net/attachments/1042768468308656138/1043587981233098752/server-icon.png

}

function launchJavaServer {
  # Using Aikars flags.
  java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}
# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=6" >> server.properties

  # Slows down incremental chunk saving during the world save task
  # echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  # echo "optimize-explosions: true" >> paper.yml
  
  # Disable overload warnings
  # echo "warn-on-overload: false" >> spigot.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  # echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml
  
}

# Check if the node IP is matched.
#IP=$(curl -s https://checkip.amazonaws.com)
#if [ ! "$IP" = 140.99.96.61 ]
#then
   # display
 #   echo "$(tput setaf 1)This node is not authorized to use this Multi-Egg. Reason: Invalid IP."
#else 

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
sleep 5
echo "

  $(tput setaf 1)If you found any bug or errors, please submit it to me via UWUX2#1097 or https://discord.gg/7Qkzg6mNbf

  $(tput setaf 3)Which platform are you gonna use?

  1) Paper 1.8.8       6)  BungeeCord 
  2) Paper 1.12.2      7)  Paper 1.19.2
  3) Paper 1.16.5      8)  Start Server (if you have already jar)
  4) Paper 1.17.1      9)  Bedrock [latest]
  5) Paper 1.18.2      
  "
read -r n

# I was uploading all the server jars to Discord because I was in hurry for vacation lol, will do a complete recode soon.
case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Downloading Paper 1.8.8 Please Wait...."

    sleep 4

    forceStuffs

    curl -L https://sharkhost.cf/jar/spigot-1.8.8-R0.1-SNAPSHOT-latest.jar -o paper-server.jar

    display
    
    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 8."
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

  2) 
    sleep 1

    echo "$(tput setaf 3)Downloading Paper 1.12.2 Please Wait...."

    sleep 4

    forceStuffs

    curl -L https://sharkhost.cf/jar/spigot-1.12.2.jar -o paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 11."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Downloading Paper 1.16.5 Please Wait...."

    sleep 4

    forceStuffs

    curl -L https://sharkhost.cf/jar/purpur-1.16.5-1171.jar -o paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Downloading Paper 1.17.1 Please Wait...."

    sleep 4

    forceStuffs

    curl -L https://sharkhost.cf/jar/purpur-1.17.1-1428.jar -o paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Downloading Paper 1.18.2 Please Wait...."

    sleep 4

    forceStuffs

    curl -L https://sharkhost.cf/jar/purpur-1.18.2-1632.jar -o paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  6)
    echo "$(tput setaf 3)Downloading Bungeecord [Waterfall] Please Wait...."

    curl -O https://sharkhost.cf/jar/waterfall-1.19-507.jar

    display 

    java -Xms512M -Xmx512M -jar waterfall-1.19-507.jar
  ;;

  7)
    sleep 1

    echo "$(tput setaf 3)Downloading Paper 1.19.2 Please Wait...."

    sleep 4

    forceStuffs

    curl -L https://sharkhost.cf/jar/purpur-1.19.2-1857.jar -o paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;
  
  
    8)
    sleep 1

    echo "$(tput setaf 3)Starting Server Please wait...."

    sleep 4

    forceStuffs

    java -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer

  ;;
  
  
    9)
    sleep 1

    echo "$(tput setaf 3)Downloading Nukkit 1.18.30 Please Wait...."

    sleep 4

    forceStuffs

    curl -L https://search.maven.org/remotecontent?filepath=org/powernukkit/powernukkit/1.6.0.1-PN/powernukkit-1.6.0.1-PN-shaded.jar -o paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer

      
  ;;
  *) 
    echo "Invalid option, exiting..."
    exit
  ;;
esac  
else
if [ -f waterfall-1.19-507.jar ]; then
  display
  java -Xms512M -Xmx512M -jar waterfall-1.19-507.jar
else
if [ ! -f hA5AW4Ni6Si6S4WvZ4WvZhA5AW4N.png ]; then
# Force the server icon.
curl -O https://cdn.discordapp.com/attachments/911903645157707826/1043558966707363961/server-icon.png
fi
fi
fi
fi
