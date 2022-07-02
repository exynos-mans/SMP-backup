sleep 2

cd /workspace/SMP-backup/smp

if [ "${STOP_BACKUP}" == "" ]; then
     bash backup1.sh
fi