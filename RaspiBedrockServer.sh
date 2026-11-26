## Set up Bedrock Dedicated Server on ARM64 Debian
install_box64() {
    echo "palaceholder: install box64"
}
echo -e "RaspiBedrockServer v1.0.0\n"
c=false
while [[ $device != "pi3" && $device != "pi4" && $device != "other" ]]; do
    if [ $c = true ]; then
        echo "Invalid input."
    fi
    c=true
    read -p "What device are you using? (pi3, pi4, pi5, other): " device
done

echo -e "\nSelected device: $device"
confirmed=false
while [ $confirmed = false ]; do 
    read -p "box64 will need to be installed. Do you want to continue? (y/n): " confirm
    if [ ${confirm,,} = "y" ]; then
        confirmed=true
        install_box64
    elif [ ${confirm,,} = "n" ]; then
        echo "Ending."
        confirmed=true
    else
        echo "Invalid input."
    fi
done

