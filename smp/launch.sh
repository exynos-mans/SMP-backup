#!/bin/sh
export JAVA_HOME=/workspace/SMP-backup/tools/jdk-16.0.2+7
export PATH=$JAVA_HOME/bin:"$PATH"

git add -A
git commit -m "$(date)"
git push -f

cd /workspace/SMP-backup/smp

java -Xmx8144M -Xms8144M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper*.jar

# send message (ip)
message3="SMP has stopped, the current IP has been shut down and a new one will be renewed next time it starts up!"
## format to parse to curl
## echo Sending message: $message
msg_content=\"$message3\"

## discord webhook
url='https://discord.com/api/webhooks/823109852662071317/IHX5Horiqpktu740QrXWkVvE2K5bv-HMhpIprVDoYQXPIcStSHdhcJ1kT2a7LoyG5Pyu'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url

git add -A
git commit -m "$(date)"
git push -f