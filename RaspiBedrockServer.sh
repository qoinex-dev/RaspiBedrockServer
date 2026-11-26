## Set up Bedrock Dedicated Server on ARM64 Debian
install_box64() {
    cd
    echo "Starting box64 installation..."
    if [ $device = "pi3" ]; then
        curl -o box64.deb https://github.com/ryanfortner/box64-debs/raw/refs/heads/master/debian/box64-rpi3arm64_0.4.5+20261125.1e27979-1_arm64.deb
    elif [ $device = "pi4" ]; then
        curl -o box64.deb https://github.com/ryanfortner/box64-debs/raw/refs/heads/master/debian/box64-rpi4arm64_0.4.5+20261125.1e27979-1_arm64.deb
    elif [ $device = "pi5" ]; then
        curl -o box64.deb https://github.com/ryanfortner/box64-debs/raw/refs/heads/master/debian/box64-rpi5arm64_0.4.5+20261125.1e27979-1_arm64.deb
    else
        curl -o box64.deb https://github.com/ryanfortner/box64-debs/raw/refs/heads/master/debian/box64_0.4.5+20261125.1e27979-1_arm64.deb
    fi
    dpkg -i box64.deb
    if test -e "/bin/box64" then
        echo "box64 has been installed."
    else
        read -p "box64 was not installed. Do you want to retry? (y/n): " confirm
        if [ $confirm = true ]; then
            install_box64
        elif [ $confirm = false ]; then
            echo "Ending."
        else
            echo "Invalid input."
        fi
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

