
compile: wifi_compile bluetooth_compile

load: wifi_load bluetooth_load

clean: wifi_clean bluetooth_clean

wifi_clean:
	cd rt2x00 && make clean

wifi_compile:
	sudo cp firmware/Wi-FI/MT7650E234.bin /lib/firmware/
	cd rt2x00 && make
	@echo "Wifi driver has been compiled successfully."

wifi_unload:
	cd rt2x00 && sudo ./unload_wifi.sh; true
	@echo "Wifi has been successfully unloaded."

wifi_load: wifi_compile wifi_unload
	cd rt2x00 && sudo ./load_wifi.sh
	@echo "Wifi has been successfully loaded."

bluetooth_clean:
	cd btloader/ && make clean

bluetooth_compile:
	sudo cp firmware/BT/mt76x0.bin /lib/firmware/
	cd btloader/ && make
	@echo "Bluetooth driver has been compiled successfully."

bluetooth_unload:
	cd btloader/ && sudo ./unload_bt.sh; true
	@echo "Bluetooth has been successfully unloaded."

bluetooth_load: bluetooth_compile bluetooth_unload
	cd btloader/ && sudo ./load_bt.sh
	@echo "Bluetooth has been successfully loaded."

uninstall:
	sudo rm -rf /usr/local/MT7630E
	sudo update-rc.d load_wifi.sh remove
	sudo update-rc.d load_bt.sh remove
	sudo rm -f /etc/init.d/load_wifi.sh
	sudo rm -f /etc/init.d/load_bt.sh
	@echo "Uninstallation successful."

# Note : I'm not sure it's the best place to put this folder...
install: compile
	sudo rm -rf /usr/local/MT7630E
	sudo mkdir -p /usr/local/MT7630E
	sudo cp -R rt2x00/*.ko /usr/local/MT7630E
	sudo cp -R btloader/*.ko /usr/local/MT7630E
	sudo cp rt2x00/load_wifi_install.sh /etc/init.d/load_wifi.sh
	sudo update-rc.d load_wifi.sh defaults
	sudo cp btloader/load_bt_install.sh /etc/init.d/load_bt.sh
	sudo update-rc.d load_bt.sh defaults
	@echo "Installation successful."

.PHONY: compile load clean wifi_clean wifi_compile wifi_unload wifi_load bluetooth_clean bluetooth_compile bluetooth_load bluetooth_unload uninstall install
