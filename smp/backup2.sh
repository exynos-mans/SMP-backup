sleep 420

cd /workspace/SMP-backup/smp

if [ "${STOP_BACKUP}" == "" ]; then
     bash backup1.sh
else
     echo "backup stopped forcibly!"
     exit
fi