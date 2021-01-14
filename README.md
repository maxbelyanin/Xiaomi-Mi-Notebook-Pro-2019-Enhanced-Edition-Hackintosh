# Mi-BigSur

- [Mi-BigSur](#mi-bigsur)
  - [Configuration](#configuration)
  - [EFI/OC/Drivers](#efiocdrivers)
    - [HfsPlus.efi](#hfsplusefi)
  - [EFI/OC/ACPI](#efiocacpi)
    - [1. Fixing System Clocks (SSDT-AWAC)](#1-fixing-system-clocks-ssdt-awac)
    - [2. Disabling laptop dGPUs (SSDT-dGPU-Off/NoHybGfx)](#2-disabling-laptop-dgpus-ssdt-dgpu-offnohybgfx)
      - [2.1 Disabling laptop dGPUs. Optimus Method (SSDT-DGPU-OPT.dsl)](#21-disabling-laptop-dgpus-optimus-method-ssdt-dgpu-optdsl)
      - [2.2 Disabling laptop dGPUs. Bumblebee Method (SSDT-DGPU-BUM.dsl)](#22-disabling-laptop-dgpus-bumblebee-method-ssdt-dgpu-bumdsl)
    - [3. Fixing Embedded Controllers (SSDT-EC-USBX.dsl)](#3-fixing-embedded-controllers-ssdt-ec-usbxdsl)
    - [4. Let brightness key and screenshot key work with VoodooPS2Controller.kext (SSDT-LGPA.dsl)](#4-let-brightness-key-and-screenshot-key-work-with-voodoops2controllerkext-ssdt-lgpadsl)
    - [5. Fixing SMBus support (SSDT-SBUS-MCHC.dsl)](#5-fixing-smbus-support-ssdt-sbus-mchcdsl)
    - [6. Fixing Backlight (SSDT-PNLFCFL.dsl)](#6-fixing-backlight-ssdt-pnlfcfldsl)
    - [7. Customize VoodooPS2Keyboard.kext (SSDT-PS2K.dsl)](#7-customize-voodoops2keyboardkext-ssdt-ps2kdsl)
    - [8. Enable trackpad GPIO interrupt mode, work with VoodooI2C.kext and VoodooI2CHID.kext (SSDT-TPD0)](#8-enable-trackpad-gpio-interrupt-mode-work-with-voodooi2ckext-and-voodooi2chidkext-ssdt-tpd0)
  - [EFI/OC/Kexts](#efiockexts)
  - [Fixes](#fixes)
  - [Trackpad](#trackpad)
  - [Post-Install](#post-install)
  - [Tools](#tools)
  - [config.plist](#configplist)
  - [Useful commands](#useful-commands)
    - [rebuild kext cache](#rebuild-kext-cache)
  - [Refs](#refs)
    - [Dortania](#dortania)
    - [Virtual keycodes](#virtual-keycodes)
  - [USB Mapping (USBMap.kext)](#usb-mapping-usbmapkext)

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

## EFI/OC/Drivers

### [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi)

[Required Driver](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#firmware-drivers) - Latest commit 192ed42 on Mar 1, 2020

## EFI/OC/ACPI

| Purpose | Name | Enable
| --- | --- | :---:
| [1. Fixing System Clocks](#1-fixing-system-clocks-ssdt-awac) | SSDT-AWAC | Y
| [2.1 Disabling laptop dGPUs. Optimus Method](#21-disabling-laptop-dgpus-optimus-method-ssdt-dgpu-optdsl) | SSDT-DGPU-OPT | Y
| [2.2 Disabling laptop dGPUs. Bumblebee Method](#22-disabling-laptop-dgpus-bumblebee-method-ssdt-dgpu-bumdsl) | SSDT-DGPU-BUM | `N`
| [3. Fixing Embedded Controllers](#3-fixing-embedded-controllers-ssdt-ec-usbxdsl) | SSDT-EC-USBX | Y
| [4. Let brightness key and screenshot key work with VoodooPS2Controller.kext](#4-let-brightness-key-and-screenshot-key-work-with-voodoops2controllerkext-ssdt-lgpadsl) | SSDT-LGPA | Y
| [5. Fixing SMBus support](#5-fixing-smbus-support-ssdt-sbus-mchcdsl) | SSDT-SBUS-MCHC | Y
| [6. Fixing Backlight](#6-fixing-backlight-ssdt-pnlfcfldsl) | SSDT-PNLFCFL | Y
| [7. Customize VoodooPS2Keyboard.kext](#7-customize-voodoops2keyboardkext-ssdt-ps2kdsl) | SSDT-PS2K | Y
| [8. Enable trackpad GPIO interrupt mode, work with VoodooI2C.kext and VoodooI2CHID.kext](#8-enable-trackpad-gpio-interrupt-mode-work-with-voodooi2ckext-and-voodooi2chidkext-ssdt-tpd0) | SSDT-TPD0 | Y

### [1. Fixing System Clocks (SSDT-AWAC)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac-methods/manual.html)

Fixing System Clocks. Force enable legacy RTC on Intel 300-series.

macOS does yet not support AWAC, so we have to force enable RTC. Do not use RTC ACPI patch.

The Time and Alarm device provides an alternative to the real time clock (RTC), which is defined as a fixed feature hardware device.

The wake timers allow the system to transition from the S3 (or optionally S4/S5) state to S0 state after a time period elapses.

In comparison with the Real Time Clock (RTC) Alarm, the Time and Alarm device provides a larger scale of flexibility in the operation of the wake timers, and allows the implementation of the time source to be abstracted from the OSPM.

SSDT-AWAC tries to re-enable the old RTC clock that is compatible with macOS, while SSDT-RTC0 will instead create a "fake" RTC clock if there is no legacy one to enable.

### [2. Disabling laptop dGPUs (SSDT-dGPU-Off/NoHybGfx)](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html)

#### [2.1 Disabling laptop dGPUs. Optimus Method (SSDT-DGPU-OPT.dsl)](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html#optimus-method)

How this works is that we call the `.off` method found on Optimus GPUs, this is the expected way to power off a GPU but some may find their dGPU will power back up later on. Mainly seen in Lenovo's, the Optimus method should work for most users

#### [2.2 Disabling laptop dGPUs. Bumblebee Method (SSDT-DGPU-BUM.dsl)](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html#bumblebee-method)

With some machines, the simple `.off` call won't keep the card off properly, that's where the Bumblebee method comes in. This SSDT will actually send the dGPU into D3 state being the lowest power state a device can support. Credit to Maemo for the original adaptation.

### [3. Fixing Embedded Controllers (SSDT-EC-USBX.dsl)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-methods/manual.html)

Device (LPCB)

### [4. Let brightness key and screenshot key work with VoodooPS2Controller.kext (SSDT-LGPA.dsl)](https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659/)

Necessary:

1. SSDT-PS2K
2. VoodooPS2Controller.kext
3. Rename Method(LGPA,1,S) to XGPA (config.plist -> ACPI -> Patch):

```xml
<dict>
  <key>Comment</key>
  <string>Rename Method(LGPA,1,S) to XGPA, pair with SSDT-LGPA.aml (Brightness Key)</string>
  <key>Count</key>
  <integer>0</integer>
  <key>Enabled</key>
  <true/>
  <key>Find</key>
  <data>TEdQQQk=</data>
  <key>Limit</key>
  <integer>0</integer>
  <key>Mask</key>
  <data></data>
  <key>OemTableId</key>
  <data></data>
  <key>Replace</key>
  <data>WEdQQQk=</data>
  <key>ReplaceMask</key>
  <data></data>
  <key>Skip</key>
  <integer>0</integer>
  <key>TableLength</key>
  <integer>0</integer>
  <key>TableSignature</key>
  <data>RFNEVA==</data>
</dict>
```

### [5. Fixing SMBus support (SSDT-SBUS-MCHC.dsl)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html)

IOReg Path: `/PCI0@0/AppleACPIPCI/SBUS@1F,4`
Converted: `PCI0.SBUS`

Fixing AppleSMBus support in macOS, what is AppleSMBus? Well this mainly handles the System Management Bus, which has many functions like:

- AppleSMBusController
  - Aids with correct temperature, fan, voltage, ICH, etc readings
- AppleSMBusPCI
  - Same idea as AppleSMBusController except for low bandwidth PCI devices
- Memory Reporting
  - Aids in proper memory reporting and can aid in getting better kernel panic details if memory related
- Other things SMBus does: [SMBus wiki](https://en.wikipedia.org/wiki/System_Management_Bus)

For install purposes, this SSDT isn't needed but for post-install it's recommended to put the final touches on your hack

[Verify](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus-methods/manual.html#verify-it-s-working)

Once you've installed macOS, you can actually check whether your SSDT-SBUS-MCHC is working or not in terminal:

```zsh
kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
```

### [6. Fixing Backlight (SSDT-PNLFCFL.dsl)](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/backlight.html)

The purpose of this SSDT is to create a PNLF device for macOS to play with, specifically one with a hardware ID of APP0002. Luckily WhateverGreen will handle the rest of the work for us.

### [7. Customize VoodooPS2Keyboard.kext (SSDT-PS2K.dsl)](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/blob/master/VoodooPS2Keyboard/ApplePS2ToADBMap.h)

[ApplePS2ToADBMap.h](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/blob/master/VoodooPS2Keyboard/ApplePS2ToADBMap.h)

Example:

```C++
Package (0x09)
{
  Package (0x00){}, 
  "e01d=3d", // Right Ctrl -> Right Option
  "e038=36", // Right Alt  -> Right Command
  "38=37",   // Left Alt   -> Left Command
  "e05b=3a", // Left Win   -> Left Option
}, 
```

### [8. Enable trackpad GPIO interrupt mode, work with VoodooI2C.kext and VoodooI2CHID.kext (SSDT-TPD0)](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/main/ACPI/CML/SSDT-TPD0.dsl)

Necessary hotpatch, work with VoodooI2C.kext and VoodooI2CHID.kext

## EFI/OC/Kexts

| Name | Type | Details
| --- | --- | ---
| [Lilu](https://github.com/acidanthera/Lilu) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.5.0
| [VirtualSMC](https://github.com/acidanthera/VirtualSMC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.1.9
| [SMCProcessor](https://github.com/acidanthera/VirtualSMC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.1.9 (plugin for VirtualSMC.kext)
| [SMCSuperIO](https://github.com/acidanthera/VirtualSMC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#kexts) | v1.1.9 (plugin for VirtualSMC.kext)
| [WhateverGreen](https://github.com/acidanthera/WhateverGreen) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#graphics) | v1.4.6 (NEED to edit section DeviceProperties)
| [AppleALC](https://github.com/acidanthera/AppleALC) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#audio) | v1.5.6 (NEED to edit section DeviceProperties `ALC256 layout-id 69 for Xiaomi Pro Enhanced 2019`)
| [AirportItlwm](https://github.com/OpenIntelWireless/itlwm) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth) | v1.2.0 alpha
| [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth) | v1.1.2
| [IntelBluetoothInjector](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth) | v1.1.2 (plugin for IntelBluetoothFirmware.kext)
| [VoodooI2CServices](https://github.com/VoodooI2C/VoodooI2C) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics) | v2.6.3 (plugin for VoodooI2C)
| [VoodooGPIO](https://github.com/VoodooI2C/VoodooI2C) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics) | v2.6.3 (plugin for VoodooI2C)
| [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics) | v2.6.3
| [VoodooI2CHID](https://github.com/VoodooI2C/VoodooI2C) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics) | v2.6.3 (from VoodooI2C bundle)
| [VoodooInput](https://github.com/VoodooI2C/VoodooI2C) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics) | v2.6.3 (plugin for VoodooI2C)
| [VoodooPS2Controller](https://github.com/acidanthera/VoodooPS2) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics) | v2.2.0 (from VoodooPS2 bundle)
| [VoodooPS2Keyboard](https://github.com/acidanthera/VoodooPS2) | [Kext](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics) | v2.2.0 (plugin for VoodooPS2Controller from VoodooPS2 bundle)

## Fixes

## Trackpad

## Post-Install

| Action | Deps | Type | Details
| --- | --- | --- | ---
| [Battery Patching](https://dortania.github.io/OpenCore-Post-Install/laptop-specific/battery.html) | [SMCBatteryManager](https://github.com/acidanthera/VirtualSMC) | Kext | v1.1.9

## Tools

- [ProperTree](https://github.com/corpnewt/ProperTree) - Universal plist editor
- [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) - For generating our SMBIOS data

## config.plist

Booter -> Quirks:

- EnableSafeModeSlide `true`???
- DevirtualiseMmio `true`???
- ProtectUefiServices `true`???
- SetupVirtualMap `false`???

Kernel -> Quirks:

- CustomSMBIOSGuid `false`???
- DisableRtcChecksum `false`???

Kernel -> Scheme:

- FuzzyMatch `true`???

Misc -> Debug:

- AppleDebug `false`???
- ApplePanic `false`???
- DisableWatchDog `false`???
- Target `0`???

Misc -> Security:

- AuthRestart `false`???
- SecureBootModel `disabled`???

## Useful commands

### rebuild kext cache

```zsh
sudo kextcache -i /
```

## Refs

### Dortania

- [Dortania Home Site](https://dortania.github.io/)
- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [Getting started with ACPI](https://dortania.github.io/Getting-Started-With-ACPI)
- [OpenCore Post-Install](https://dortania.github.io/OpenCore-Post-Install/)
- [GPU Buyers Guide](https://dortania.github.io/GPU-Buyers-Guide/)
- [Wireless Buyers Guide](https://dortania.github.io/Wireless-Buyers-Guide/)
- [Anti-Hackintosh Buyers Guide](https://dortania.github.io/Anti-Hackintosh-Buyers-Guide/)

### Virtual keycodes

```C++
/*
 *  Summary:
 *    Virtual keycodes
 *  
 *  Discussion:
 *    These constants are the virtual keycodes defined originally in
 *    Inside Mac Volume V, pg. V-191. They identify physical keys on a
 *    keyboard. Those constants with "ANSI" in the name are labeled
 *    according to the key position on an ANSI-standard US keyboard.
 *    For example, kVK_ANSI_A indicates the virtual keycode for the key
 *    with the letter 'A' in the US keyboard layout. Other keyboard
 *    layouts may have the 'A' key label on a different physical key;
 *    in this case, pressing 'A' will generate a different virtual
 *    keycode.
 */
enum {
  kVK_ANSI_A                    = 0x00,
  kVK_ANSI_S                    = 0x01,
  kVK_ANSI_D                    = 0x02,
  kVK_ANSI_F                    = 0x03,
  kVK_ANSI_H                    = 0x04,
  kVK_ANSI_G                    = 0x05,
  kVK_ANSI_Z                    = 0x06,
  kVK_ANSI_X                    = 0x07,
  kVK_ANSI_C                    = 0x08,
  kVK_ANSI_V                    = 0x09,
  kVK_ANSI_B                    = 0x0B,
  kVK_ANSI_Q                    = 0x0C,
  kVK_ANSI_W                    = 0x0D,
  kVK_ANSI_E                    = 0x0E,
  kVK_ANSI_R                    = 0x0F,
  kVK_ANSI_Y                    = 0x10,
  kVK_ANSI_T                    = 0x11,
  kVK_ANSI_1                    = 0x12,
  kVK_ANSI_2                    = 0x13,
  kVK_ANSI_3                    = 0x14,
  kVK_ANSI_4                    = 0x15,
  kVK_ANSI_6                    = 0x16,
  kVK_ANSI_5                    = 0x17,
  kVK_ANSI_Equal                = 0x18,
  kVK_ANSI_9                    = 0x19,
  kVK_ANSI_7                    = 0x1A,
  kVK_ANSI_Minus                = 0x1B,
  kVK_ANSI_8                    = 0x1C,
  kVK_ANSI_0                    = 0x1D,
  kVK_ANSI_RightBracket         = 0x1E,
  kVK_ANSI_O                    = 0x1F,
  kVK_ANSI_U                    = 0x20,
  kVK_ANSI_LeftBracket          = 0x21,
  kVK_ANSI_I                    = 0x22,
  kVK_ANSI_P                    = 0x23,
  kVK_ANSI_L                    = 0x25,
  kVK_ANSI_J                    = 0x26,
  kVK_ANSI_Quote                = 0x27,
  kVK_ANSI_K                    = 0x28,
  kVK_ANSI_Semicolon            = 0x29,
  kVK_ANSI_Backslash            = 0x2A,
  kVK_ANSI_Comma                = 0x2B,
  kVK_ANSI_Slash                = 0x2C,
  kVK_ANSI_N                    = 0x2D,
  kVK_ANSI_M                    = 0x2E,
  kVK_ANSI_Period               = 0x2F,
  kVK_ANSI_Grave                = 0x32,
  kVK_ANSI_KeypadDecimal        = 0x41,
  kVK_ANSI_KeypadMultiply       = 0x43,
  kVK_ANSI_KeypadPlus           = 0x45,
  kVK_ANSI_KeypadClear          = 0x47,
  kVK_ANSI_KeypadDivide         = 0x4B,
  kVK_ANSI_KeypadEnter          = 0x4C,
  kVK_ANSI_KeypadMinus          = 0x4E,
  kVK_ANSI_KeypadEquals         = 0x51,
  kVK_ANSI_Keypad0              = 0x52,
  kVK_ANSI_Keypad1              = 0x53,
  kVK_ANSI_Keypad2              = 0x54,
  kVK_ANSI_Keypad3              = 0x55,
  kVK_ANSI_Keypad4              = 0x56,
  kVK_ANSI_Keypad5              = 0x57,
  kVK_ANSI_Keypad6              = 0x58,
  kVK_ANSI_Keypad7              = 0x59,
  kVK_ANSI_Keypad8              = 0x5B,
  kVK_ANSI_Keypad9              = 0x5C
};

/* keycodes for keys that are independent of keyboard layout*/
enum {
  kVK_Return                    = 0x24,
  kVK_Tab                       = 0x30,
  kVK_Space                     = 0x31,
  kVK_Delete                    = 0x33,
  kVK_Escape                    = 0x35,
  kVK_Command                   = 0x37,
  kVK_Shift                     = 0x38,
  kVK_CapsLock                  = 0x39,
  kVK_Option                    = 0x3A,
  kVK_Control                   = 0x3B,
  kVK_RightShift                = 0x3C,
  kVK_RightOption               = 0x3D,
  kVK_RightControl              = 0x3E,
  kVK_Function                  = 0x3F,
  kVK_F17                       = 0x40,
  kVK_VolumeUp                  = 0x48,
  kVK_VolumeDown                = 0x49,
  kVK_Mute                      = 0x4A,
  kVK_F18                       = 0x4F,
  kVK_F19                       = 0x50,
  kVK_F20                       = 0x5A,
  kVK_F5                        = 0x60,
  kVK_F6                        = 0x61,
  kVK_F7                        = 0x62,
  kVK_F3                        = 0x63,
  kVK_F8                        = 0x64,
  kVK_F9                        = 0x65,
  kVK_F11                       = 0x67,
  kVK_F13                       = 0x69,
  kVK_F16                       = 0x6A,
  kVK_F14                       = 0x6B,
  kVK_F10                       = 0x6D,
  kVK_F12                       = 0x6F,
  kVK_F15                       = 0x71,
  kVK_Help                      = 0x72,
  kVK_Home                      = 0x73,
  kVK_PageUp                    = 0x74,
  kVK_ForwardDelete             = 0x75,
  kVK_F4                        = 0x76,
  kVK_End                       = 0x77,
  kVK_F2                        = 0x78,
  kVK_PageDown                  = 0x79,
  kVK_F1                        = 0x7A,
  kVK_LeftArrow                 = 0x7B,
  kVK_RightArrow                = 0x7C,
  kVK_DownArrow                 = 0x7D,
  kVK_UpArrow                   = 0x7E
};
```

## USB Mapping (USBMap.kext)

| # | ID | USB | Location | Enabled
| :---: | :---: | --- | --- | :---:
| 01 | 14100000 | HS01 USB20 | N/R | Y
| 03 | 14200000 | HS03 USB20 | N/L | Y
| 04 | 14300000 | HS04 USB20 | F/R | Y
| 06 | 14600000 | HS06 Webcam | | Y
| 07 | 14700000 | USB20 | SD Card Reader | `N`
| 08 | 14800000 | USB20 | Fingerprint | `N`
| 09 | 14400000 | HS09 USB20 | F/L | Y
| 10 | 14a00000 | HS10 USB20 | Bluetooth | Y
| 13 | 14500000 | SS01 USB30 | N/R | Y
| 14 | 14600000 | SS02 USB30 | N/L | Y
| 15 | 14700000 | SS03 USB30 | F/L | Y
| 16 | 14800000 | SS04 USB30 | F/R | Y
