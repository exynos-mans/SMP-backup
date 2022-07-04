cd tools/
rm -rf port.txt
./ngrok config add-authtoken 2Ase99pbx7l6hCJZjZQdpqmF2Lp_28n4AESywRyeUeYeEQSNY
./ngrok tcp 25565 --log stdout >> port.txt &
sleep 5
bash splitter.sh
echo "Your SMP IP is $(cat port2.txt)"
echo ""

# send message (smp has started)
message1="The SMP has started!"
## format to parse to curl
## echo Sending message: $message
msg_content=\"$message1\"

## discord webhook
url='https://discord.com/api/webhooks/823109852662071317/IHX5Horiqpktu740QrXWkVvE2K5bv-HMhpIprVDoYQXPIcStSHdhcJ1kT2a7LoyG5Pyu'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url

# send message (ip)
message2="$(cat port2.txt)"
## format to parse to curl
## echo Sending message: $message
msg_content=\"$message2\"

## discord webhook
url='https://discord.com/api/webhooks/823109852662071317/IHX5Horiqpktu740QrXWkVvE2K5bv-HMhpIprVDoYQXPIcStSHdhcJ1kT2a7LoyG5Pyu'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url

# send message (dynmap)
message4="Dynamic Map URL -- $(gp url 8123)"
## format to parse to curl
## echo Sending message: $message
msg_content=\"$message4\"

## discord webhook
url='https://discord.com/api/webhooks/823109852662071317/IHX5Horiqpktu740QrXWkVvE2K5bv-HMhpIprVDoYQXPIcStSHdhcJ1kT2a7LoyG5Pyu'
curl -H "Content-Type: application/json" -X POST -d "{\"content\": $msg_content}" $url