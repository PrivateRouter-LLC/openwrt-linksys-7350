# PrivateRouter's OpenWRT Build for Linksys 7350

This repository provides a build script and accompanying files to facilitate the compilation and installation of OpenWRT for the **Linksys Router Model E7350**. 

## ⚙️ Installation Instructions

The Linksys E7350 router is a dual-boot partition model, which means it retains the ability to boot from one of two partitions. This allows for safer firmware updates and system recovery. 

1. **Factory Image**:
    - Start with the factory image. You can obtain this from the release section or compile it using the provided build script.
    - Navigate to the Linksys Advanced Config menu in the router's original firmware.
    - Use the option to update or flash the firmware and select the factory image file you've obtained.
    - Once flashed, the router will reboot.

2. **OpenWRT Boot**:
    - Upon rebooting, the router should now boot into OpenWRT.
    - Navigate to the OpenWRT interface. By default, this is often at `http://192.168.1.1/`.

3. **Sysupgrade Image**:
    - In the OpenWRT interface, go to the System Upgrade section.
    - Upload the sysupgrade image and proceed with the upgrade.
    - The router will reboot once more after the upgrade.

🔔 **Reminder**: Always ensure you're using the correct image for your specific model and version of the router. Incorrectly flashing can lead to a bricked device.

## 📝 Notes

- Ensure you backup any essential configuration before performing system upgrades.
- While the dual-boot partition provides a safety net, always be cautious during firmware updates.
- If you face any challenges, revert to the other partition or seek assistance from community forums.

## 🔗 Resources

For additional details, builds, and updates, please visit the main repository at: 
[https://gittylab.com/ben/openwrt-linksys-7350](https://gittylab.com/ben/openwrt-linksys-7350)

## 🤝 Contributing

Encountered any issues or have suggestions? Head over to the main repository's issues section and please contribute. All inputs are welcomed.

**⚠️ Disclaimer**: The authors and contributors are not responsible for any damage, data loss, or other issues that might occur by using this firmware or following these instructions. Always proceed with caution.
