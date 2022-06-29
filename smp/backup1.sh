git add -A
git commit -m "$(date)"
git push -f

cd /workspace/SMP-backup/smp

bash backup2.sh