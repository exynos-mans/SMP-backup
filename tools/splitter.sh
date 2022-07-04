cd /workspace/SMP-backup/tools
rm -rf port2.txt
grep -oE '(url)[^ ]*' port.txt >> port2.txt
sed -i 's@url=tcp://@@g' port2.txt