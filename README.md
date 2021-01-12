# Mi-BigSur

- [Mi-BigSur](#mi-bigsur)
  - [Configuration](#configuration)
  - [Musthave](#musthave)
  - [Post-Install](#post-install)
  - [Tools](#tools)

## Configuration

| Specification | Details
| --- | ---
| Computer model | Xiaomi Mi NoteBook PRO 2019 Enhanced Edition 15.6" I7-10510U 1TB/16GB/MX250
| Motherboard | Timi TM1905 AX23XXAXE
| BIOS | XMACM500P0201
| CPU | Intel® Core(TM) i7-10510U 1.80GHz (Comet Lake U platform)
| RAM | Samsung DDR4 2666MHz 2x8GB (Part num: M471A1G44AB0-CTD)
| SSD | Intel® SSD 660P Series (SSDPEKNW010T8; M.2 22x80mm; NVMe; 1Tb)
| iGPU | Intel UHD Graphics 620
| dGPU | nVIDIA GeForce MX250
| Monitor | Sharp LQ156M1JW01 15.6" LCD (FHD) 1920x1080 142ppi
| Sound Card | Realtek ALC256 (layout-id:69)
| Wireless Card | Intel Wireless-AC 9560 160MHz
| SD Card Reader | Realtek RTS5129
| Webcam | Chicony Electronics Co., Ltd XiaoMi USB 2.0 Webcam
| Fingerprint | ELAN

## Musthave

| Name | Type | Details
| --- | --- | ---
| [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi) | [Driver](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#firmware-drivers) | *Latest commit 192ed42 on Mar 1, 2020*
| [Lilu](https://github.com/acidanthera/Lilu) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.5.0
| [VirtualSMC](https://github.com/acidanthera/VirtualSMC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.1.9
| [SMCProcessor](https://github.com/acidanthera/VirtualSMC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.1.9 (plugin for VirtualSMC.kext)
| [SMCSuperIO](https://github.com/acidanthera/VirtualSMC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.1.9 (plugin for VirtualSMC.kext)
| [WhateverGreen](https://github.com/acidanthera/WhateverGreen) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#graphics) | v1.4.6 (NEED to edit section DeviceProperties)
| [AppleALC](https://github.com/acidanthera/AppleALC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#audio) | v1.5.6 (NEED to edit section DeviceProperties `ALC256 layout-id 69 for Xiaomi Pro Enhanced 2019`)
| [AirportItlwm](https://github.com/OpenIntelWireless/itlwm) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth) | v1.2.0 alpha
| [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth) | v1.1.2
| [IntelBluetoothInjector](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth) | v1.1.2 (plugin for IntelBluetoothFirmware.kext)

## Post-Install

| Action | Deps | Type | Details
| --- | --- | --- | ---
| [Battery Patching](https://dortania.github.io/OpenCore-Post-Install/laptop-specific/battery.html) | [SMCBatteryManager](https://github.com/acidanthera/VirtualSMC) | Kext | v1.1.9

## Tools

- [ProperTree](https://github.com/corpnewt/ProperTree) - Universal plist editor
- [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) - For generating our SMBIOS data
