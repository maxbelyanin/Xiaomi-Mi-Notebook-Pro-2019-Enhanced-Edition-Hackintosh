# Xiaomi-Mi-Notebook-Pro-2019-Enhanced-Edition-Hackintosh

- [Xiaomi-Mi-Notebook-Pro-2019-Enhanced-Edition-Hackintosh](#xiaomi-mi-notebook-pro-2019-enhanced-edition-hackintosh)
  - [Hardware Configuration](#hardware-configuration)
  - [Opencore Configuration](#opencore-configuration)
    - [EFI/BOOT](#efiboot)
    - [EFI/OC](#efioc)
      - [EFI/OC/config.plist](#efiocconfigplist)
        - [EFI/OC/config.plist -> ACPI](#efiocconfigplist---acpi)
          - [EFI/OC/config.plist -> ACPI -> Add](#efiocconfigplist---acpi---add)
          - [EFI/OC/config.plist -> ACPI -> Delete](#efiocconfigplist---acpi---delete)
          - [EFI/OC/config.plist -> ACPI -> Patch](#efiocconfigplist---acpi---patch)
          - [EFI/OC/config.plist -> ACPI -> Quirks](#efiocconfigplist---acpi---quirks)
        - [EFI/OC/config.plist -> Booter](#efiocconfigplist---booter)
          - [EFI/OC/config.plist -> Booter -> Quirks](#efiocconfigplist---booter---quirks)
        - [EFI/OC/config.plist -> DeviceProperties](#efiocconfigplist---deviceproperties)
          - [EFI/OC/config.plist -> DeviceProperties -> Add](#efiocconfigplist---deviceproperties---add)
          - [EFI/OC/config.plist -> DeviceProperties -> Delete](#efiocconfigplist---deviceproperties---delete)
        - [EFI/OC/config.plist -> Kernel](#efiocconfigplist---kernel)
          - [EFI/OC/config.plist -> Kernel -> Quirks](#efiocconfigplist---kernel---quirks)
          - [EFI/OC/config.plist -> Kernel -> Scheme](#efiocconfigplist---kernel---scheme)
        - [EFI/OC/config.plist -> Misc](#efiocconfigplist---misc)
          - [EFI/OC/config.plist -> Misc -> BlessOverride](#efiocconfigplist---misc---blessoverride)
          - [EFI/OC/config.plist -> Misc -> Boot](#efiocconfigplist---misc---boot)
          - [EFI/OC/config.plist -> Misc -> Debug](#efiocconfigplist---misc---debug)
          - [EFI/OC/config.plist -> Misc -> Security](#efiocconfigplist---misc---security)
        - [EFI/OC/config.plist -> NVRAM](#efiocconfigplist---nvram)
          - [EFI/OC/config.plist -> NVRAM -> Add](#efiocconfigplist---nvram---add)
          - [EFI/OC/config.plist -> NVRAM -> Delete](#efiocconfigplist---nvram---delete)
        - [EFI/OC/config.plist -> PlatformInfo](#efiocconfigplist---platforminfo)
        - [EFI/OC/config.plist -> PlatformInfo -> Generic](#efiocconfigplist---platforminfo---generic)
        - [EFI/OC/config.plist -> UEFI](#efiocconfigplist---uefi)
      - [EFI/OC/ACPI](#efiocacpi)
      - [EFI/OC/Drivers](#efiocdrivers)
      - [EFI/OC/Kexts](#efiockexts)
  - [Step By Step Configuration (From Scratch)](#step-by-step-configuration-from-scratch)
    - [Adding The Base OpenCore Files (OpenCorePkg)](#adding-the-base-opencore-files-opencorepkg)
    - [Creating config.plist](#creating-configplist)
    - [Customizing config.plist -> DeviceProperties](#customizing-configplist---deviceproperties)
    - [Customizing config.plist -> PlatformInfo](#customizing-configplist---platforminfo)
      - [Generating SMBIOS](#generating-smbios)
    - [Adding HFS driver (HfsPlus.efi)](#adding-hfs-driver-hfsplusefi)
    - [Fixing System Clocks (SSDT-AWAC)](#fixing-system-clocks-ssdt-awac)
    - [Adding a platform for arbitrary kext, library, and program patching (Lilu.kext)](#adding-a-platform-for-arbitrary-kext-library-and-program-patching-lilukext)
    - [Adding SMC chip emulator (VirtualSMC.kext)](#adding-smc-chip-emulator-virtualsmckext)
    - [Adding Hardware Monitoring (SMCBatteryManager, SMCProcessor.kext, SMCSuperIO.kext)](#adding-hardware-monitoring-smcbatterymanager-smcprocessorkext-smcsuperiokext)
    - [Fixing Sleep (HibernationFixup, config.plist)](#fixing-sleep-hibernationfixup-configplist)
    - [Optimizing Power Management (SSDT-PLUG, CPUFriendDataProvider.kext, CPUFriend.kext)](#optimizing-power-management-ssdt-plug-cpufrienddataproviderkext-cpufriendkext)
      - [Enabling X86PlatformPlugin (SSDT-PLUG)](#enabling-x86platformplugin-ssdt-plug)
      - [Using CPU Friend (CPUFriendDataProvider.kext, CPUFriend.kext)](#using-cpu-friend-cpufrienddataproviderkext-cpufriendkext)
        - [LFM: Low Frequency Mode](#lfm-low-frequency-mode)
        - [EPP: Energy Performance Preference](#epp-energy-performance-preference)
        - [Performance Bias](#performance-bias)
    - [Fixing USB (SSDT-RHUB-Reset, USBInjectAll.kext, USBMap.kext)](#fixing-usb-ssdt-rhub-reset-usbinjectallkext-usbmapkext)
      - [Fixing USB. System Preparation (SSDT-RHUB-Reset, USBInjectAll.kext)](#fixing-usb-system-preparation-ssdt-rhub-reset-usbinjectallkext)
      - [Fixing USB. USB Mapping (USBMap.kext)](#fixing-usb-usb-mapping-usbmapkext)
      - [Fixing USB. USB Power and Embedded Controller (SSDT-EC-USBX)](#fixing-usb-usb-power-and-embedded-controller-ssdt-ec-usbx)
      - [Fixing USB. Shutdown/Restart (SSDT-USB-FIXSHUTDOWN, config.plist)](#fixing-usb-shutdownrestart-ssdt-usb-fixshutdown-configplist)
      - [Fixing USB. Instant Wake (SSDT-GPRW, config.plist)](#fixing-usb-instant-wake-ssdt-gprw-configplist)
      - [Fixing USB. Keyboard Wake (config.plist)](#fixing-usb-keyboard-wake-configplist)
    - [Disabling laptop dGPUs (SSDT-DGPU-OPT, SSDT-DGPU-BUM)](#disabling-laptop-dgpus-ssdt-dgpu-opt-ssdt-dgpu-bum)
      - [Disabling laptop dGPUs. Optimus Method (SSDT-DGPU-OPT.dsl)](#disabling-laptop-dgpus-optimus-method-ssdt-dgpu-optdsl)
      - [Disabling laptop dGPUs. Bumblebee Method (SSDT-DGPU-BUM.dsl)](#disabling-laptop-dgpus-bumblebee-method-ssdt-dgpu-bumdsl)
    - [Patching Intel iGPU (WhateverGreen.kext, config.plist)](#patching-intel-igpu-whatevergreenkext-configplist)
    - [Fixing Backlight (SSDT-PNLFCFL.dsl)](#fixing-backlight-ssdt-pnlfcfldsl)
    - [Patching Audio (AppleALC.kext config.plist)](#patching-audio-applealckext-configplist)
    - [Fixing NVMe (NVMeFix.kext)](#fixing-nvme-nvmefixkext)
    - [Fixing SMBus support (SSDT-SBUS-MCHC)](#fixing-smbus-support-ssdt-sbus-mchc)
    - [Fixing Trackpad (SSDT-TPD0, VoodooI2CServices.kext, VoodooGPIO.kext, VoodooI2C.kext, VoodooI2CHID.kext, VoodooInput.kext)](#fixing-trackpad-ssdt-tpd0-voodooi2cserviceskext-voodoogpiokext-voodooi2ckext-voodooi2chidkext-voodooinputkext)
    - [Fixing Keyboard (SSDT-LGPA, SSDT-PS2K, VoodooPS2Controller.kext, VoodooPS2Keyboard.kext, config.plist)](#fixing-keyboard-ssdt-lgpa-ssdt-ps2k-voodoops2controllerkext-voodoops2keyboardkext-configplist)
    - [Fixing Wifi (AirportItlwm.kext)](#fixing-wifi-airportitlwmkext)
    - [Fixing Bluetooth (IntelBluetoothFirmware.kext, IntelBluetoothInjector.kext)](#fixing-bluetooth-intelbluetoothfirmwarekext-intelbluetoothinjectorkext)
    - [Battery Patching](#battery-patching)
  - [Debug](#debug)
    - [Useful commands](#useful-commands)
  - [Refs](#refs)
    - [Tools](#tools)
    - [Dortania](#dortania)
  - [Credits](#credits)

## Hardware Configuration

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

## Opencore Configuration

### EFI/BOOT

| Name | Version | Purpose | Comment
| ---- | ------- | ------- | -------
| BOOTx64.efi | 0.6.7 | Initial bootstrap loader | [Adding The Base OpenCore Files (OpenCorePkg)](#adding-the-base-opencore-files-opencorepkg)

### EFI/OC

#### [EFI/OC/config.plist](#creating-configplist)

##### EFI/OC/config.plist -> ACPI

###### EFI/OC/config.plist -> ACPI -> Add

- [Used SSDT list](#efiocacpi)

###### EFI/OC/config.plist -> ACPI -> Delete

- Empty Array

###### EFI/OC/config.plist -> ACPI -> Patch

1. Patch-GPRW - [Fixing USB. Instant Wake (SSDT-GPRW, config.plist)](#fixing-usb-instant-wake-ssdt-gprw-configplist)

    | Key | Type | Value
    | --- | ---- | -----
    | Comment | String | change Method(GPRW,2,N) to XPRW, pair with SSDT-GPRW.aml
    | Count | Number | 0
    | Enabled | Boolean | True
    | Find | Data | <47505257 02>
    | Limit | Number | 0
    | Mask | Data | <>
    | OemTableId | Data | <>
    | Replace | Data | <58505257 02>
    | ReplaceMask | Data | <>
    | Skip | Number | 0
    | TableLength | Number | 0
    | TableSignature | Data | <>

2. Patch-LGPA - [Fixing Keyboard (SSDT-LGPA, SSDT-PS2K, VoodooPS2Controller.kext, VoodooPS2Keyboard.kext, config.plist)](#fixing-keyboard-ssdt-lgpa-ssdt-ps2k-voodoops2controllerkext-voodoops2keyboardkext-configplist)

    | Key | Type | Value
    | --- | ---- | -----
    | Comment | String | Rename Method(LGPA,1,S) to XGPA, pair with SSDT-LGPA.aml (Brightness Key)
    | Count | Number | 0
    | Enabled | Boolean | True
    | Find | Data | <4C475041 09>
    | Limit | Number | 0
    | Mask | Data | <>
    | OemTableId | Data | <>
    | Replace | Data | <58475041 09>
    | ReplaceMask | Data | <>
    | Skip | Number | 0
    | TableLength | Number | 0
    | TableSignature | Data | <44534454>

3. Patch-USB-FIXSHUTDOWN - [Fixing USB. Shutdown/Restart (SSDT-USB-FIXSHUTDOWN, config.plist)](#fixing-usb-shutdownrestart-ssdt-usb-fixshutdown-configplist)

    | Key | Type | Value
    | --- | ---- | -----
    | Comment | String | _PTS to ZPTS
    | Count | Number | 1
    | Enabled | Boolean | True
    | Find | Data | <5F505453>
    | Limit | Number | 0
    | Mask | Data | <>
    | OemTableId | Data | <>
    | Replace | Data | <5A505453>
    | ReplaceMask | Data | <>
    | Skip | Number | 0
    | TableLength | Number | 0
    | TableSignature | Data | <>

###### EFI/OC/config.plist -> ACPI -> Quirks

TODO: !!!

##### EFI/OC/config.plist -> Booter

###### EFI/OC/config.plist -> Booter -> Quirks

- EnableSafeModeSlide `true`???
- DevirtualiseMmio `true`???
- ProtectUefiServices `true`???
- SetupVirtualMap `false`???

##### EFI/OC/config.plist -> DeviceProperties

###### EFI/OC/config.plist -> DeviceProperties -> Add

| Key | Type | Value | Comments
| --- | ---- | ----- | --------
| PciRoot(0x0)/Pci(0x0,0x0) -> device_type | String | Intel Comet Lake-U 4C - Host Bridge/DRAM Controller
| PciRoot(0x0)/Pci(0x2,0x0) -> AAPL,ig-platform-id | Data | <0400A53E> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> complete-modeset-framebuffers | Data | <00000000 00000001> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> device-id | Data | < A53E0000 > | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> force-online | Data | <01000000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> force-online-framebuffers | Data | <00000000 00000001> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-con1-enable | Data | <01000000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-con1-pipe | Data | <0A000000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-con1-type | Data | <00080000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-con2-enable | Data | <01000000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-con2-type | Data | <00040000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-fbmem | Data | <00009000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-flags | Data | <0B07E300> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-patch-enable | Data | <01000000> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> framebuffer-stolenmem | Data | <00003001> | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| PciRoot(0x0)/Pci(0x2,0x0) -> hda-gfx | String | onboard-1
| PciRoot(0x0)/Pci(0x2,0x0) -> model | String | Intel UHD620
| PciRoot(0x0)/Pci(0x2,0x0) -> DeviceDescription | String | Intel Comet Lake-U GT2 - Integrated Graphics Controller [V0]
| PciRoot(0x0)/Pci(0x8,0x0) -> device_type | String | System Peripheral
| PciRoot(0x0)/Pci(0x8,0x0) -> model | String | Intel 10th Gen Core Processor Gaussian Mixture Model
| PciRoot(0x0)/Pci(0x12,0x0) -> model | String | Intel Comet Point-LP PCH - Thermal Controller
| PciRoot(0x0)/Pci(0x14,0x0) -> model | String | Intel Comet Lake PCH-LP USB 3.1 xHCI Host Controller
| PciRoot(0x0)/Pci(0x14,0x0) -> name | String | pci8086,2ed | [Fixing USB. Keyboard Wake (config.plist)](#fixing-usb-keyboard-wake-configplist)
| PciRoot(0x0)/Pci(0x14,0x0) -> acpi-wake-type | Data | <01> | [Fixing USB. Keyboard Wake (config.plist)](#fixing-usb-keyboard-wake-configplist)
| PciRoot(0x0)/Pci(0x14,0x2) -> device_type | String | Memory controller
| PciRoot(0x0)/Pci(0x14,0x2) -> model | String | Intel Comet Lake PCH-LP Shared SRAM
| PciRoot(0x0)/Pci(0x14,0x3) -> model | String | Intel Wireless-AC 9560 160MHz Wireless Network Adapter
| PciRoot(0x0)/Pci(0x15,0x0) -> device_type | String | Serial Bus Controller
| PciRoot(0x0)/Pci(0x15,0x0) -> model | String | Intel Comet Point-LP PCH - LPSS: I2C Controller 0
| PciRoot(0x0)/Pci(0x16,0x0) -> device_type | String | Communication Controller
| PciRoot(0x0)/Pci(0x16,0x0) -> model | String | Intel Comet Point-LP PCH - HECI Controller #1
| PciRoot(0x0)/Pci(0x19,0x0) -> device_type | String | Serial Bus Controller
| PciRoot(0x0)/Pci(0x19,0x0) -> model | String | Intel Comet Lake Serial IO I2C Host Controller #4
| PciRoot(0x0)/Pci(0x1c,0x0) -> model | String | Intel Comet Point-LP PCH - PCI Express Root Port #5
| PciRoot(0x0)/Pci(0x1d,0x0) -> model | String | Intel Comet Point-LP PCH - PCI Express Root Port #13
| PciRoot(0x0)/Pci(0x1f,0x0) -> model | String | Intel Comet Lake PCH-LP LPC/eSPI Controller
| PciRoot(0x0)/Pci(0x1f,0x3) -> hda-gfx | String | onboard-1 | [Patching Audio](#patching-audio-applealckext-configplist)
| PciRoot(0x0)/Pci(0x1f,0x3) -> No-idle-support | String | 0 | [Patching Audio](#patching-audio-applealckext-configplist)
| PciRoot(0x0)/Pci(0x1f,0x3) -> layout-id | Number | 69 | [Patching Audio](#patching-audio-applealckext-configplist)
| PciRoot(0x0)/Pci(0x1f,0x3) -> model | String | Intel Comet Lake PCH-LP cAVS | [Patching Audio](#patching-audio-applealckext-configplist)
| PciRoot(0x0)/Pci(0x1f,0x4) -> model | String | Intel Comet Lake PCH-LP SMBus Host Controller
| PciRoot(0x0)/Pci(0x1f,0x5) -> device_type | String | Serial Bus Controller
| PciRoot(0x0)/Pci(0x1f,0x5) -> model | String | Intel Comet Lake SPI (flash) Controller

###### EFI/OC/config.plist -> DeviceProperties -> Delete

- Empty Array

##### EFI/OC/config.plist -> Kernel

###### EFI/OC/config.plist -> Kernel -> Quirks

| Key                     | Value | Comments
| ----------------------- | ----- | --------
| AppleCpuPmCfgLock       | NO *(Default)*  | Disables PKG_CST_CONFIG_CONTROL (0xE2) MSR modification in AppleIntelCPUPowerManagement.kext, commonly causing early kernel panic, when it is locked from writing. **Only applicable for Ivy Bridge and older**
| AppleXcpmCfgLock        | **YES**         | Disables PKG_CST_CONFIG_CONTROL (0xE2) MSR modification in XNU kernel, commonly causing early kernel panic, when it is locked from writing (XCPM power management). **Not needed if CFG-Lock is disabled in the BIOS**
| AppleXcpmExtraMsrs      | NO *(Default)*  | Disables multiple MSR access critical for select CPUs, which have no native XCPM support
| AppleXcpmForceBoost     | NO *(Default)*  | Forces maximum performance in XCPM mode
| CustomSMBIOSGuid        | NO *(Default)*  | TODO: Performs GUID patching for UpdateSMBIOSMode Custom mode. Usually relevant for Dell laptops
| DisableIoMapper         | **YES**         | Disables IOMapper support in XNU (VT-d), which may conflict with the firmware implementation. **Not needed if VT-D is disabled in the BIOS**
| DisableLinkeditJettison | YES *(Default)* | Disables __LINKEDIT jettison code. This option lets Lilu.kext and possibly some others function in macOS Big Sur with best performance without `keepsyms=1` boot argument
| DisableRtcChecksum      | **YES**         | TODO: Disables primary checksum (0x58-0x59) writing in AppleRTC. Prevents AppleRTC from writing to primary checksum (0x58-0x59), required for users who either receive BIOS reset or are sent into Safe mode after reboot/shutdown
| ExtendBTFeatureFlags    | NO *(Default)*  | Set FeatureFlags to 0x0F for full functionality of Bluetooth, including Continuity
| ExternalDiskIcons       | NO *(Default)*  | Apply icon type patches to AppleAHCIPort.kext to force internal disk icons for all AHCI disks
| ForceSecureBootScheme   | NO *(Default)*  | Force x86 scheme for IMG4 verification
| IncreasePciBarSize      | NO *(Default)*  | Increases 32-bit PCI bar size in IOPCIFamily from 1 to 4 GBs
| LapicKernelPanic        | NO *(Default)*  | Disables kernel panic on LAPIC interrupts. **HP Machines will require this quirk**
| LegacyCommpage          | NO *(Default)*  | Replaces the default 64-bit commpage bcopy implementation with one that does not require SSSE3, useful for legacy platforms.
| PanicNoKextDump         | **YES**         | Prevent kernel from printing kext dump in the panic log preventing from observing panic details. Affects 10.13 and above
| PowerTimeoutKernelPanic | **YES**         | Disables kernel panic on setPowerState timeout
| SetApfsTrimTimeout      | -1  *(Default)* | Set trim timeout in microseconds for APFS filesystems on SSDs.
| ThirdPartyDrives        | **YES**         | Apply vendor patches to IOAHCIBlockStorage.kext to enable native features for third-party drives, such as TRIM on SSDs or hibernation support on 10.15 and newer
| XhciPortLimit           | [Fixing USB. System Preparation (SSDT-RHUB-Reset, USBInjectAll.kext)](#fixing-usb-system-preparation-ssdt-rhub-reset-usbinjectallkext) | Patch various kexts (AppleUSBXHCI.kext, AppleUSBXHCIPCI.kext, IOUSBHostFamily.kext) to remove USB port count limit of 15 ports

###### EFI/OC/config.plist -> Kernel -> Scheme

- FuzzyMatch `true`???

##### EFI/OC/config.plist -> Misc

###### EFI/OC/config.plist -> Misc -> BlessOverride

- Empty Array

###### EFI/OC/config.plist -> Misc -> Boot

| Key                    | Type | Value | Comments
| -----------------------| ---- | ----- | --------
| ConsoleAttributes | Number | 0  *(Default)*
| HibernateMode | String | None  *(Default)* | Avoid hibernation (Recommended). We're gonna avoid the black magic that is S4 for this guide. [Fixing Sleep](#fixing-sleep-hibernationfixup-configplist)
| HideAuxiliary | Boolean | False  *(Default)*
| LauncherOption | String | Disabled  *(Default)*
| LauncherPath | String | Default  *(Default)*
| PickerAttributes | Number | 17  *(Default)*
| PickerAudioAssist | Boolean | False  *(Default)*
| PickerMode | String | Builtin  *(Default)*
| PickerVariant | String | Auto  *(Default)*
| PollAppleHotKeys | Boolean | False  *(Default)*
| ShowPicker | Boolean | True  *(Default)*
| TakeoffDelay | Number | 0  *(Default)*
| Timeout | Number | 5  *(Default)*

###### EFI/OC/config.plist -> Misc -> Debug

- AppleDebug `false`???
- ApplePanic `false`???
- DisableWatchDog `false`???
- Target `0`???

###### EFI/OC/config.plist -> Misc -> Security

- AuthRestart `false`???
- SecureBootModel `disabled`???

##### EFI/OC/config.plist -> NVRAM

| Key                    | Type | Value | Comments
| -----------------------| ---- | ----- | --------
| LegacyEnable | Boolean | False  *(Default)*
| LegacyOverwrite | Boolean | False  *(Default)*
| LegacySchema | Dictionary | **Empty**
| WriteFlash | Boolean | True  *(Default)*

###### EFI/OC/config.plist -> NVRAM -> Add

| Key                    | Type | Value | Comments
| -----------------------| ---- | ----- | --------
| 4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14 -> DefaultBackgroundColor | Data | <00000000>  *(Default)*
| 4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14 -> UIScale | Data | <01>  *(Default)*
| 4D1FDA02-38C7-4A6A-9CC6-4BCCA8B30102 -> rtc-blacklist | Data | <> *(Default)*
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> SystemAudioVolume | Data | <46> *(Default)*
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> boot-args | String | -v keepsyms=1 gfxrst=1 -f swd_panic=1 | [Fixing Sleep](#fixing-sleep-hibernationfixup-configplist)
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> csr-active-config | Data | <00000000> *(Default)*
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> prev-lang:kbd | Data | <72752D52 553A3235 32> *(Default)*
| 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> run-efi-updater | String | No *(Default)*

###### EFI/OC/config.plist -> NVRAM -> Delete

##### EFI/OC/config.plist -> PlatformInfo

| Key | Value | Comments
| --- | ----- | --------
| Automatic | Yes *(Default)* | Generate PlatformInfo based on Generic section instead of using values from DataHub, NVRAM, and SMBIOS sections.
| CustomMemory | False *(Default)* | Use custom memory configuration defined in the Memory section. This completely replaces any existing memory configuration in SMBIOS, and is only active when UpdateSMBIOS is set to true.
| Generic |
| UpdateDataHub | YES *(Default)* | Update Data Hub fields. These fields are read from Generic or DataHub sections depending on Automatic value.
| UpdateNVRAM | YES *(Default)* | Update NVRAM fields related to platform information. These fields are read from Generic or PlatformNVRAM sections depending on Automatic value.
| UpdateSMBIOS | YES *(Default)* | Update SMBIOS fields. These fields are read from Generic or SMBIOS sections depending on Automatic value.
| UpdateSMBIOSMode | Create *(Default)* | Update SMBIOS fields approach. Create - Replace the tables with newly allocated EfiReservedMemoryType at AllocateMaxAddress without any fallbacks.
| UseRawUuidEncoding | False *(Default)* | Use raw encoding for SMBIOS UUIDs.

##### EFI/OC/config.plist -> PlatformInfo -> Generic

| Key | Value | Comments
| --- | ----- | --------
| AdviseWindows | False *(Default)* | Forces Windows support in FirmwareFeatures
| MaxBIOSVersion | False *(Default)* | Sets BIOSVersion to 9999.999.999.999.999, recommended for legacy Macs when using Automatic
| MLB | **[Generating SMBIOS](#generating-smbios)** |  Refer to SMBIOS BoardSerialNumber
| ProcessorType | 0 *(Default)* | Refer to SMBIOS ProcessorType. *0 (Automatic)*
| ROM | | Refer to 4D1EDE05-38C7-4A6A-9CC6-4BCCA8B38C14:ROM
| SpoofVendor | **False** | Sets SMBIOS vendor fields to Acidanthera
| SystemMemoryStatus | Auto *(Default)* | Indicates whether system memory is upgradable in PlatformFeature. This controls the visibility of the Memory tab in About This Mac. Auto — use the original PlatformFeature value.
| SystemProductName | **[Generating SMBIOS](#generating-smbios)** | Refer to SMBIOS SystemProductName
| SystemSerialNumber | **[Generating SMBIOS](#generating-smbios)** | Refer to SMBIOS SystemSerialNumber
| SystemUUID | **[Generating SMBIOS](#generating-smbios)** | Refer to SMBIOS SystemUUID

##### EFI/OC/config.plist -> UEFI

#### EFI/OC/ACPI

| #   | Name | Enable | Purpose | Comment
| :-: | ---- | :----: | ------- | -------
| 01  | SSDT-AWAC | Y | [Fixing System Clocks](#fixing-system-clocks-ssdt-awac) | |
| 02  | SSDT-PLUG | Y | [Optimizing Power Management](#optimizing-power-management-ssdt-plug-cpufrienddataproviderkext-cpufriendkext) | |
| 03  | SSDT-DGPU-OPT | `N` | [Disabling laptop dGPUs. Optimus Method](#disabling-laptop-dgpus-optimus-method-ssdt-dgpu-optdsl) | Enable only one of SSDT-DGPU-OPT or SSDT-DGPU-BUM  |
| 04  | SSDT-DGPU-BUM | Y | [Disabling laptop dGPUs. Bumblebee Method](#disabling-laptop-dgpus-bumblebee-method-ssdt-dgpu-bumdsl) | Enable only one of SSDT-DGPU-OPT or SSDT-DGPU-BUM |
| 05  | SSDT-GPRW | Y | [Fixing USB. Instant Wake](#fixing-usb-instant-wake-ssdt-gprw-configplist) | |
| 06  | SSDT-RHUB-Reset | `N` | [Fixing USB. System Preparation](#fixing-usb-system-preparation-ssdt-rhub-reset-usbinjectallkext). Enable for tuning ONLY | |
| 07  | SSDT-EC-USBX | Y | [Fixing USB. USB Power and Embedded Controller](#fixing-usb-usb-power-and-embedded-controller-ssdt-ec-usbx) | |
| 08  | SSDT-USB-FIXSHUTDOWN | Y | [Fixing USB. Shutdown/Restart](#fixing-usb-shutdownrestart-ssdt-usb-fixshutdown-configplist) | |
| 09  | SSDT-LGPA | Y | [Fixing Keyboard](#fixing-keyboard-ssdt-lgpa-ssdt-ps2k-voodoops2controllerkext-voodoops2keyboardkext-configplist) | |
| 10  | SSDT-SBUS-MCHC | Y | [Fixing SMBus support](#fixing-smbus-support-ssdt-sbus-mchc) | |
| 11  | SSDT-PNLFCFL | Y | [Fixing Backlight](#fixing-backlight-ssdt-pnlfcfldsl) | |
| 12  | SSDT-PS2K | Y | [Fixing Keyboard](#fixing-keyboard-ssdt-lgpa-ssdt-ps2k-voodoops2controllerkext-voodoops2keyboardkext-configplist) | |
| 13  | SSDT-TPD0 | Y | [Fixing Trackpad](#fixing-trackpad-ssdt-tpd0-voodooi2cserviceskext-voodoogpiokext-voodooi2ckext-voodooi2chidkext-voodooinputkext) | |

#### EFI/OC/Drivers

| Name | Version | Purpose | Comment
| ---- | ------- | ------- | -------
| OpenCanopy.efi | 0.6.7 | OpenCore plugin implementing graphical interface | [Adding The Base OpenCore Files (OpenCorePkg)](#adding-the-base-opencore-files-opencorepkg)
| OpenRuntime.efi | 0.6.7 | OpenCore plugin implementing OC_FIRMWARE_RUNTIME protocol | [Adding The Base OpenCore Files (OpenCorePkg)](#adding-the-base-opencore-files-opencorepkg) | Must have
| HfsPlus.efi | Latest commit 192ed42 on Mar 1, 2020 | Needed for seeing HFS volumes | [Adding HFS driver (HfsPlus.efi)](#adding-hfs-driver-hfsplusefi)

#### EFI/OC/Kexts

| #    | Name | Enable | Version | Purpose | Comment
| :--: | ---- | ------ | ------- | ------- | -------
| 01   | [Lilu](https://github.com/acidanthera/Lilu) | Y | 1.5.1 | [Adding a platform for arbitrary kext, library, and program patching](#adding-a-platform-for-arbitrary-kext-library-and-program-patching-lilukext) | Must have
| 02   | [VirtualSMC](https://github.com/acidanthera/VirtualSMC) | Y | 1.2.1 | [Adding SMC chip emulator](#adding-smc-chip-emulator-virtualsmckext) | Must have
| 03   | [SMCBatteryManager](https://github.com/acidanthera/VirtualSMC) | Y | 1.2.1 | [Adding Hardware Monitoring](#adding-hardware-monitoring-smcbatterymanager-smcprocessorkext-smcsuperiokext) | plugin for VirtualSMC.kext
| 04   | [SMCProcessor](https://github.com/acidanthera/VirtualSMC) | Y | 1.2.1 | [Adding Hardware Monitoring](#adding-hardware-monitoring-smcbatterymanager-smcprocessorkext-smcsuperiokext) | plugin for VirtualSMC.kext
| 05   | [SMCSuperIO](https://github.com/acidanthera/VirtualSMC) | Y | 1.2.1 | [Adding Hardware Monitoring](#adding-hardware-monitoring-smcbatterymanager-smcprocessorkext-smcsuperiokext) | plugin for VirtualSMC.kext
| 06   | [CPUFriendDataProvider](https://github.com/fewtarius/CPUFriendFriend) | Y | Latest commit ae123c0 on Oct 23, 2020 | [Optimizing Power Management](#optimizing-power-management-ssdt-plug-cpufrienddataproviderkext-cpufriendkext) | additional features for CPUFriend.kext
| 07   | [CPUFriend](https://github.com/acidanthera/CPUFriend) | Y | 1.2.3 | [Optimizing Power Management](#optimizing-power-management-ssdt-plug-cpufrienddataproviderkext-cpufriendkext)
| 08   | [USBInjectAll](https://github.com/Sniki/OS-X-USB-Inject-All/releases) | `N` | 0.7.5 | [Fixing USB. System Preparation (SSDT-RHUB-Reset, USBInjectAll.kext)] | **For Tuning ONLY**
| 09   | USBMap | Y | 0.0.1 | [Fixing USB. USB Mapping](#fixing-usb-usb-mapping-usbmapkext)
| 10   | [WhateverGreen](https://github.com/acidanthera/WhateverGreen) | Y | 1.4.6 | [Patching Intel iGPU](#patching-intel-igpu-whatevergreenkext-configplist)
| 11   | [AppleALC](https://github.com/acidanthera/AppleALC) | Y | 1.5.6 | [Patching Audio](#patching-audio-applealckext-configplist)
| 12   | [HibernationFixup](https://github.com/acidanthera/HibernationFixup) | Y | 1.3.9 | [Fixing Sleep](#fixing-sleep-hibernationfixup-configplist)
| 13   | [NVMeFix](https://github.com/acidanthera/NVMeFix) | Y | 1.0.5 | [Fixing NVMe](#fixing-nvme-nvmefixkext)
| 14   | [VoodooI2CServices](https://github.com/VoodooI2C/VoodooI2C) | Y | 2.6.3 | [Fixing Trackpad](#fixing-trackpad-ssdt-tpd0-voodooi2cserviceskext-voodoogpiokext-voodooi2ckext-voodooi2chidkext-voodooinputkext) | (plugin for VoodooI2C)
| 15   | [VoodooGPIO](https://github.com/VoodooI2C/VoodooI2C) | Y | 2.6.3 | [Fixing Trackpad](#fixing-trackpad-ssdt-tpd0-voodooi2cserviceskext-voodoogpiokext-voodooi2ckext-voodooi2chidkext-voodooinputkext) | (plugin for VoodooI2C)
| 16   | [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C) | Y | 2.6.3 | [Fixing Trackpad](#fixing-trackpad-ssdt-tpd0-voodooi2cserviceskext-voodoogpiokext-voodooi2ckext-voodooi2chidkext-voodooinputkext)
| 17   | [VoodooI2CHID](https://github.com/VoodooI2C/VoodooI2C) | Y | 2.6.3 | [Fixing Trackpad](#fixing-trackpad-ssdt-tpd0-voodooi2cserviceskext-voodoogpiokext-voodooi2ckext-voodooi2chidkext-voodooinputkext) | (from VoodooI2C bundle)
| 18   | [VoodooInput](https://github.com/VoodooI2C/VoodooI2C) | Y | 2.6.3 | [Fixing Trackpad](#fixing-trackpad-ssdt-tpd0-voodooi2cserviceskext-voodoogpiokext-voodooi2ckext-voodooi2chidkext-voodooinputkext) | (plugin for VoodooI2C)
| 19   | [VoodooPS2Controller](https://github.com/acidanthera/VoodooPS2) | Y | 2.2.0 | [Fixing Keyboard](#fixing-keyboard-ssdt-lgpa-ssdt-ps2k-voodoops2controllerkext-voodoops2keyboardkext-configplist) | (from VoodooPS2 bundle)
| 20   | [VoodooPS2Keyboard](https://github.com/acidanthera/VoodooPS2) | Y | 2.2.0 | [Fixing Keyboard](#fixing-keyboard-ssdt-lgpa-ssdt-ps2k-voodoops2controllerkext-voodoops2keyboardkext-configplist) | (plugin for VoodooPS2Controller from VoodooPS2 bundle)
| 21   | [AirportItlwm](https://github.com/OpenIntelWireless/itlwm) | Y | 1.2.0 | [Fixing Wifi](#fixing-wifi-airportitlwmkext)
| 22   | [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) | Y | v1.1.2 | [Fixing Bluetooth (IntelBluetoothFirmware.kext, IntelBluetoothInjector.kext)](#fixing-bluetooth-intelbluetoothfirmwarekext-intelbluetoothinjectorkext)
| 23   | [IntelBluetoothInjector](https://github.com/OpenIntelWireless/IntelBluetoothFirmware) | Y | v1.1.2 | [Fixing Bluetooth (IntelBluetoothFirmware.kext, IntelBluetoothInjector.kext)](#fixing-bluetooth-intelbluetoothfirmwarekext-intelbluetoothinjectorkext). (plugin for IntelBluetoothFirmware.kext)

## Step By Step Configuration (From Scratch)

### [Adding The Base OpenCore Files (OpenCorePkg)](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/opencore-efi.html)

To setup OpenCore’s folder structure, you’ll want to grab the EFI folder found in [OpenCorePkg's releases](https://github.com/acidanthera/OpenCorePkg/releases/).

```console
EFI
├── BOOT
│   └── BOOTx64.efi
└── OC
    ├── ACPI
    ├── Drivers
    │   ├── OpenCanopy.efi
    │   └── OpenRuntime.efi
    ├── Kexts
    ├── Resources
    │   ├── Audio
    │   ├── Font
    │   ├── Image
    │   └── Label
    ├── Tools
    │   ├── CleanNvram.efi
    │   └── OpenShell.efi
    ├── OpenCore.efi
    └── config.plist
```

### Creating config.plist

Deps:

- **NONE**

Refs:

- [Creating config.plist](https://dortania.github.io/OpenCore-Install-Guide/config.plist/#creating-your-config-plist)
- [Laptop Coffee Lake Plus and Comet Lake](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html)

Tools:

- [ProperTree](https://github.com/corpnewt/ProperTree) - Universal plist editor

### Customizing config.plist -> DeviceProperties

Deps:

- **NONE**

Refs:

- [DeviceProperties](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html#deviceproperties)

Tools:

- [gfxutil](https://github.com/acidanthera/gfxutil) - A tool to work with Device Properties commonly found in Apple Mac firmwares by [mcmatrix](http://forum.netkas.org/index.php?action=profile;u=4)

1. Run `gfxutil`

    ```zsh
    00:00.0 8086:9b61 /PCI0@0/MCHC@0 = PciRoot(0x0)/Pci(0x0,0x0)
    00:12.0 8086:02f9 /PCI0@0/pci8086,2f9@12 = PciRoot(0x0)/Pci(0x12,0x0)
    00:08.0 8086:1911 /PCI0@0/pci8086,1911@8 = PciRoot(0x0)/Pci(0x8,0x0)
    00:02.0 8086:3ea5 /PCI0@0/IGPU@2 = PciRoot(0x0)/Pci(0x2,0x0)
    00:14.0 8086:02ed /PCI0@0/XHC@14 = PciRoot(0x0)/Pci(0x14,0x0)
    00:14.2 8086:02ef /PCI0@0/pci8086,2ef@14,2 = PciRoot(0x0)/Pci(0x14,0x2)
    00:14.3 8086:02f0 /PCI0@0/CNVW@14,3 = PciRoot(0x0)/Pci(0x14,0x3)
    00:15.0 8086:02e8 /PCI0@0/I2C0@15 = PciRoot(0x0)/Pci(0x15,0x0)
    00:16.0 8086:02e0 /PCI0@0/IMEI@16 = PciRoot(0x0)/Pci(0x16,0x0)
    00:19.0 8086:02c5 /PCI0@0/I2C4@19 = PciRoot(0x0)/Pci(0x19,0x0)
    00:1c.0 8086:02bc /PCI0@0/RP05@1C = PciRoot(0x0)/Pci(0x1C,0x0)
    00:1d.0 8086:02b4 /PCI0@0/RP13@1D = PciRoot(0x0)/Pci(0x1D,0x0)
    00:1f.0 8086:0284 /PCI0@0/LPCB@1F = PciRoot(0x0)/Pci(0x1F,0x0)
    00:1f.3 8086:02c8 /PCI0@0/HDEF@1F,3 = PciRoot(0x0)/Pci(0x1F,0x3)
    00:1f.4 8086:02a3 /PCI0@0/SBUS@1F,4 = PciRoot(0x0)/Pci(0x1F,0x4)
    00:1f.5 8086:02a4 /PCI0@0/pci8086,2a4@1F,5 = PciRoot(0x0)/Pci(0x1F,0x5)
    02:00.0 8086:f1a8 /PCI0@0/RP13@1D/PXSX@0 = PciRoot(0x0)/Pci(0x1D,0x0)/Pci(0x0,0x0)
    ```

2. Edit the [EFI/OC/config.plist -> DeviceProperties -> Add](#efiocconfigplist---deviceproperties---add)

### Customizing config.plist -> PlatformInfo

Deps:

- **NONE**

Refs:

- [PlatformInfo](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html#platforminfo)
- [Choosing the right SMBIOS](https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html)
- [EveryMac.com](https://everymac.com/) - EveryMac.com organizes specs on all Macs -- from the original 128k to the current models -- By Series, Year, Processor & Case Type.
- [macOS SMBIOS MacBook Pro](https://dortania.github.io/OpenCore-Install-Guide/extras/smbios-support.html#macbook-pro)

Tools:

- [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) - For generating the SMBIOS

1. Edit the [EFI/OC/config.plist -> PlatformInfo](#efiocconfigplist---platforminfo)
2. Edit the [EFI/OC/config.plist -> PlatformInfo -> Generic](#efiocconfigplist---platforminfo---generic)

#### [Generating SMBIOS](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html#platforminfo)

data:

| SMBIOS | CPU Family | GPU | board-id | Initial Support | Last Supported Version
| --- | --- | --- | --- | --- | ---
| MacBookPro16,3 | Coffee Lake(U) | Iris Plus 645 (13") | Mac-E7203C0F68AA0004 | 10.15.4 (19E2269)

```zsh
  #######################################################
 #            MacBookPro16,3 SMBIOS Info               #
#######################################################

Type:         <generated value> - to Generic -> SystemProductName
Serial:       <generated value> - to Generic -> SystemSerialNumber
Board Serial: <generated value> - to Generic -> MLB
SmUUID:       <generated value> - to Generic -> SystemUUID
```

Add data to the [EFI/OC/config.plist -> PlatformInfo -> Generic](#efiocconfigplist---platforminfo---generic)

### Adding HFS driver (HfsPlus.efi)

Deps:

- **NONE**

Refs:

- [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi)
- [Firmware Drivers](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#firmware-drivers)

Tools:

- **NONE**

### Fixing System Clocks (SSDT-AWAC)

Deps:

- **NONE**

Refs:

- [Fixing System Clocks](https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac-methods/manual.html)

Tools:

- [MaciASL](https://github.com/acidanthera/MaciASL) - A native AML compiler and IDE for macOS, with syntax coloring, tree navigation, automated patching, online patch file repositories, and iASL binary updates. Written entirely in Cocoa, conforms to macOS guidelines.

Fixing System Clocks. Force enable legacy RTC on Intel 300-series.

macOS does yet not support AWAC, so we have to force enable RTC. Do not use RTC ACPI patch.

The Time and Alarm device provides an alternative to the real time clock (RTC), which is defined as a fixed feature hardware device.

The wake timers allow the system to transition from the S3 (or optionally S4/S5) state to S0 state after a time period elapses.

In comparison with the Real Time Clock (RTC) Alarm, the Time and Alarm device provides a larger scale of flexibility in the operation of the wake timers, and allows the implementation of the time source to be abstracted from the OSPM.

SSDT-AWAC tries to re-enable the old RTC clock that is compatible with macOS, while SSDT-RTC0 will instead create a "fake" RTC clock if there is no legacy one to enable.

### Adding a platform for arbitrary kext, library, and program patching (Lilu.kext)

Deps:

- **NONE**

Refs:

- [Must haves](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#must-haves)
- [Lilu](https://github.com/acidanthera/Lilu)

Tools:

- **NONE**

An open source kernel extension bringing a platform for arbitrary kext, library, and program patching throughout the system for macOS.

Required for AppleALC, WhateverGreen, VirtualSMC and many other kexts. Without Lilu, they will not work.

### Adding SMC chip emulator (VirtualSMC.kext)

Deps:

- **NONE**

Refs:

- [Must haves](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#must-haves)
- [VirtualSMC](https://github.com/acidanthera/VirtualSMC)

Tools:

- **NONE**

Emulates the SMC chip found on real macs, without this macOS will not boot

### Adding Hardware Monitoring (SMCBatteryManager, SMCProcessor.kext, SMCSuperIO.kext)

Deps:

- **NONE**

Refs:

- [VirtualSMC Plugins](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#virtualsmc-plugins)
- [SMCBatteryManager, SMCProcessor.kext, SMCSuperIO.kext](https://github.com/acidanthera/VirtualSMC)

Tools:

- **NONE**

### Fixing Sleep (HibernationFixup, config.plist)

Deps:

- **NONE**

Refs:

- [HibernationFixup](https://github.com/acidanthera/HibernationFixup)
- [Fixing Sleep](https://dortania.github.io/OpenCore-Post-Install/universal/sleep.html)
- [Preparations](https://dortania.github.io/OpenCore-Post-Install/universal/sleep.html#preparations)

Tools:

- **NONE**

`In macOS`

Before we get in too deep, we'll want to first ready our system:

```zsh
sudo pmset autopoweroff 0
sudo pmset powernap 0
sudo pmset standby 0
sudo pmset proximitywake 0
```

This will do 4 things for us:

1. Disables autopoweroff: This is a form of hibernation
2. Disables powernap: Used to periodically wake the machine for network, and updates(but not the display)
3. Disables standby: Used as a time period between sleep and going into hibernation
4. Disables wake from iPhone/Watch: Specifically when your iPhone or Apple Watch come near, the machine will wake

`In config.plist`

- Misc -> Boot -> HibernateMode -> None
  - We're gonna avoid the black magic that is S4 for this guide
- NVRAM -> Add -> 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> boot-args
  - keepsyms=1 - Makes sure that if a kernel panic does happen during sleep, that we get all the important bits from it
  - swd_panic=1 - Avoids issue where going to sleep results in a reboot, this should instead give us a kernel panic log

### Optimizing Power Management (SSDT-PLUG, CPUFriendDataProvider.kext, CPUFriend.kext)

Deps:

- [Generating SMBIOS](#generating-smbios)

Refs:

- [Optimizing Power Management](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html)
- [Fixing CPU Power Management](https://dortania.github.io/OpenCore-Post-Install/universal/sleep.html#fixing-cpu-power-management)

Tools:

- **NONE**

#### [Enabling X86PlatformPlugin (SSDT-PLUG)](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#enabling-x86platformplugin)

[SSDT-PLUG](https://dortania.github.io/Getting-Started-With-ACPI/Universal/plug.html)

The purpose of SSDT-PLUG is to allow the kernel's XCPM(XNU's CPU Power Management) to manage our CPU's power management. It's pretty self explanatory why you'd want this. Injects the plugin-type=1 property into our system.

ACPI path:

```C++
Scope (_SB)
    {
        Processor (PR00, 0x01, 0x00001810, 0x06){}
        Processor (PR01, 0x02, 0x00001810, 0x06){}
        Processor (PR02, 0x03, 0x00001810, 0x06){}
        Processor (PR03, 0x04, 0x00001810, 0x06){}
        Processor (PR04, 0x05, 0x00001810, 0x06){}
        Processor (PR05, 0x06, 0x00001810, 0x06){}
        Processor (PR06, 0x07, 0x00001810, 0x06){}
        Processor (PR07, 0x08, 0x00001810, 0x06){}
        Processor (PR08, 0x09, 0x00001810, 0x06){}
        Processor (PR09, 0x0A, 0x00001810, 0x06){}
        Processor (PR10, 0x0B, 0x00001810, 0x06){}
        Processor (PR11, 0x0C, 0x00001810, 0x06){}
        Processor (PR12, 0x0D, 0x00001810, 0x06){}
        Processor (PR13, 0x0E, 0x00001810, 0x06){}
        Processor (PR14, 0x0F, 0x00001810, 0x06){}
        Processor (PR15, 0x10, 0x00001810, 0x06){}
        Processor (PR16, 0x11, 0x00001810, 0x06){}
        Processor (PR17, 0x12, 0x00001810, 0x06){}
        Processor (PR18, 0x13, 0x00001810, 0x06){}
        Processor (PR19, 0x14, 0x00001810, 0x06){}
    }
```

#### [Using CPU Friend (CPUFriendDataProvider.kext, CPUFriend.kext)](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#using-cpu-friend)

##### [LFM: Low Frequency Mode](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#lfm-low-frequency-mode)

[Intel® Core™ i7-10510U Processor](https://ark.intel.com/content/www/us/en/ark/products/196449/intel-core-i7-10510u-processor-8m-cache-up-to-4-90-ghz.html)

CPU Spec (Thermal Design Power):

| Key | Value |
| --- | ---
| TDP | 15W
| Configurable TDP-up Frequency | 2.30 GHz
| Configurable TDP-up | 25 W
| Configurable TDP-down Frequency | 800 MHz
| Configurable TDP-down | 10 W

```zsh
  #######################################################
 #                  CPUFriendFriend                    #
#######################################################

Current Board:  Mac-E7203C0F68AA0004
Current SMBIOS: MacBookPro16,3

Low Frequency Mode (LFM):

This option defines the lowest operating frequency for your processor. Refer to your CPU specifications on Intel's website, for your CPUs LFM or TDP-Down frequency.

Current Setting:    0x0C (1200 MHz)


Enter the value for your CPU (For 800Mhz enter 08, for 1300Mhz enter 0D):  08
```

LFM Value = **0x08 (Equivalent of 800Mhz)**

##### [EPP: Energy Performance Preference](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#epp-energy-performance-preference)

| EPP |Speed
| --- | ---
| 0x00-0x3F | Max Performance
| 0x40-0x7F | Balance performance
| 0x80-0xBF | Balance power
| 0xC0-0xFF | Max Power Saving

```zsh
  #######################################################
 #                  CPUFriendFriend                    #
#######################################################

Building CPUFriendDataProvider.
Energy Performance Preference (EPP):
HWP EPP adjustment configures the intel p_state preference policy.

EPP Ranges:
  0x00-0x3F    :    Performance
  0x40-0x7F    :    Balanced Performance
  0x80-0xBF    :    Balanced Power Savings
  0xC0-0xFF    :    Power
Settings found in modern Apple computers:
  0x90         :    Modern MacBook Pro
  0x80         :    Modern MacBook Air

Current Setting: 90 (Balanced Power Savings)

Enter the new EPP value in hex:  0xBF
```

EPP: **0xBF**

##### [Performance Bias](https://dortania.github.io/OpenCore-Post-Install/universal/pm.html#performance-bias)

```zsh
  #######################################################
 #                  CPUFriendFriend                    #
#######################################################

Building CPUFriendDataProvider.
Perf Bias:
Perf-Bias is a performance and energy bias hint used to specify power preference.  Expressed as a range, 0 represents preference for performance, 15 represents preference for maximum power saving.

Perf Bias Range:
  0x00-0x15
Settings found in modern Apple computers:
  0x05              :    Modern MacBook Pro
  0x07              :    Modern MacBook Air

Current Setting: 05 

Enter the new PerfBias value in hex:  08
```

Bias: **08**

CPUFriendDataProvider.kext

### Fixing USB (SSDT-RHUB-Reset, USBInjectAll.kext, USBMap.kext)

Deps:

- **NONE**

Refs:

- [Why should you USB map](https://dortania.github.io/OpenCore-Post-Install/usb/#why-should-you-usb-map)
- [macOS and the 15 Port Limit](https://dortania.github.io/OpenCore-Post-Install/usb/#macos-and-the-15-port-limit)
- [Fixing System Clocks](https://dortania.github.io/Getting-Started-With-ACPI/Universal/awac-methods/manual.html)

Tools:

- **NONE**

#### Fixing USB. System Preparation (SSDT-RHUB-Reset, USBInjectAll.kext)

Deps:

- **NONE**

Refs:

- [System Preparation](https://dortania.github.io/OpenCore-Post-Install/usb/system-preparation.html#system-preparation)

Tools:

- **NONE**

1. USBInjectAll.kext
2. config.plist -> Kernel -> Quirks -> XhciPortLimit -> True
3. Run `USBMap.command`, select option `H. Generate ACPI To Reset RHUBs (May Conflict With Existing SSDT-USB-Reset.aml!)` and add OC/ACPI/SSDT-USB-Reset.aml

    ```zsh
      #######################################################
     #                      USBMap                         #
    #######################################################

    Current Controllers:

    - XHC@14 @ _SB.PCI0.XHC
      \-> RHUB @ _SB.PCI0.XHC.RHUB

    D. Discover Ports
    P. Edit & Create USBMap.kext
    R. Reset All Detected Ports
    H. Generate ACPI To Reset RHUBs (May Conflict With Existing SSDT-USB-Reset.aml!)

    Q.  Quit

    Please select an option:  

    ```

#### Fixing USB. USB Mapping (USBMap.kext)

Deps:

- [Fixing USB. System Preparation (SSDT-RHUB-Reset, USBInjectAll.kext)]

Refs:

- [USB Mapping](https://dortania.github.io/OpenCore-Post-Install/usb/intel-mapping/intel.html)
- [USBMap. README](https://github.com/corpnewt/USBMap/blob/master/README.md)

Tools:

- [USBMap](https://github.com/corpnewt/USBMap)

1. Run `USBMap.command`

    ```zsh
      #######################################################
     #                      USBMap                         #
    #######################################################

    Current Controllers:

    - XHC@14 @ _SB.PCI0.XHC
      \-> RHUB @ _SB.PCI0.XHC.RHUB

    D. Discover Ports
    P. Edit & Create USBMap.kext
    R. Reset All Detected Ports
    H. Generate ACPI To Reset RHUBs (May Conflict With Existing SSDT-USB-Reset.aml!)

    Q.  Quit

    Please select an option:  
    ```

2. select  `D. Discover Ports`

    ```zsh
      #######################################################
    #                Discover USB Ports                   #
    #######################################################

        ----- XHC@14 Controller -----
    1. HS01 | 01000000 | 14100000
        HS USB3 near right
    2. HS03 | 03000000 | 14200000
        HS USB3 near left
    3. HS04 | 04000000 | 14300000
        HS USB3 far right
        - USB2.0 Hub             
            - AppleUSB20Hub
                - USB Audio Device
    4. HS06 | 06000000 | 14600000
        Webcam
        - XiaoMi USB 2.0 Webcam
    5. HS09 | 09000000 | 14400000
        HS USB3 far left
    6. HS10 | 0a000000 | 14a00000
        Bluetooth
        - BroadcomBluetoothHostControllerUSBTransport
    7. SS01 | 0d000000 | 14500000
        SS USB3 near right
    8. SS02 | 0e000000 | 14600000
        SS USB3 near left
    9. SS03 | 0f000000 | 14700000
        SS USB3 far left
    10. SS04 | 10000000 | 14800000
        SS USB3 far right
        - USB3.0 Hub             
            - AppleUSB30Hub
                - USB 10/100/1000 LAN

    Populated:
    XHC: 4

    Press Q then [enter] to stop

    Waiting 5 seconds:  
    ```

3. select `Press Q then [enter] to stop` then head to `P. Edit & Create USBMap.kext`

    ```zsh
      #######################################################
    #                  Edit USB Ports                     #
    #######################################################

        ----- XHC@14 Controller -----
    [#] 1. HS01 | 14100000 | Type 3
        HS USB3 near right
        - MI 8 Pro
        - USB2.0 Hub             
            - AppleUSB20Hub
                - USB Audio Device
    [#] 2. HS03 | 14200000 | Type 3
        HS USB3 near left
        - DataTraveler 2.0
    [#] 3. HS04 | 14300000 | Type 3
        HS USB3 far right
        - USB2.0 Hub             
            - AppleUSB20Hub
                - USB Audio Device
                - DataTraveler 2.0
        - MI 8 Pro
    [#] 4. HS06 | 14600000 | Type 255
        Webcam
        - XiaoMi USB 2.0 Webcam
    [#] 5. HS09 | 14400000 | Type 3
        HS USB3 far left
        - DataTraveler 2.0
    [#] 6. HS10 | 14a00000 | Type 255
        Bluetooth
        - BroadcomBluetoothHostControllerUSBTransport
    [#] 7. SS01 | 14500000 | Type 3
        SS USB3 near right
        - USB3.0 Hub             
            - AppleUSB30Hub
                - USB 10/100/1000 LAN
    [#] 8. SS02 | 14600000 | Type 3
        SS USB3 near left
        - Mass Storage Device
    [#] 9. SS03 | 14700000 | Type 3
        SS USB3 far left
        - Mass Storage Device
    [#] 10. SS04 | 14800000 | Type 3
        SS USB3 far right
        - USB3.0 Hub             
            - AppleUSB30Hub
                - USB 10/100/1000 LAN
                - Mass Storage Device

    Populated:
    XHC: 10

    K. Build USBMap.kext
    A. Select All
    N. Select None
    P. Enable All Populated Ports
    D. Disable All Empty Ports
    T. Show Types

    M. Main Menu
    Q. Quit

    - Select ports to toggle with comma-delimited lists (eg. 1,2,3,4,5)
    - Change types using this formula T:1,2,3,4,5:t where t is the type
    - Set custom names using this formula C:1:Name - Name = None to clear
    - Enabled/Disable all controller ports with U:Cont:e where e is On/Off
        and Cont is the controller@address (eg U:XHC@14000000:On)

    Please make your selection:  
    ```

4. Set custom settings and select `K. Build USBMap.kext`

    ```zsh
      #######################################################
     #                 Build USBMap.kext                   #
    #######################################################

    Generating Info.plist...
    Located existing USBMap.kext - removing...
    Creating bundle structure...
    Writing Info.plist...
    Done.

    Press [enter] to return to the menu...
    ```

5. Cleanup

   - Disable **USBInjectAll.kext**
   - config.plist -> Kernel -> Quirks -> XhciPortLimit -> False

6. Add generated USBMap.kext to EFI/OC/Kext/USBMap.kext

Result USB Mapping:

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

#### Fixing USB. USB Power and Embedded Controller (SSDT-EC-USBX)

Deps:

- **NONE**

Refs:

- [Fixing USB Power](https://dortania.github.io/OpenCore-Post-Install/usb/misc/power.html)
- [Fixing Embedded Controller (SSDT-EC/USBX)](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-fix.html)
- [Fixing Embedded Controllers: Manual](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-methods/manual.html)
- [No PNP0C09 show up](https://dortania.github.io/Getting-Started-With-ACPI/Universal/ec-methods/manual.html#no-pnp0c09-show-up)
- [SSDT-EC-USBX](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-EC-USBX.dsl)

Tools:

- **NONE**

Device (LPCB)

#### Fixing USB. Shutdown/Restart (SSDT-USB-FIXSHUTDOWN, config.plist)

Deps:

- **NONE**

Refs:

- [Fixing Shutdown/Restart](https://dortania.github.io/OpenCore-Post-Install/usb/misc/shutdown.html)
- [FixShutdown-USB-SSDT.dsl](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/FixShutdown-USB-SSDT.dsl)
- [FixShutdown-Patch.plist](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/FixShutdown-Patch.plist)

Tools:

- **NONE**

1. Add `SSDT-USB-FIXSHUTDOWN`
2. Edit [EFI/OC/config.plist -> ACPI -> Patch](#efiocconfigplist---acpi---patch)

#### Fixing USB. Instant Wake (SSDT-GPRW, config.plist)

Deps:

- **NONE**

Refs:

- [GPRW/UPRW/LANC Instant Wake Patch](https://dortania.github.io/OpenCore-Post-Install/usb/misc/instant-wake.html)
- [SSDT-GPRW](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/SSDT-GPRW.aml)
- [GPRW to XPRW Patch (Patch-GPRW)](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/GPRW-Patch.plist)

Tools:

- **NONE**

1. Check:

    ```zsh
    In:
    pmset -g log | grep -e "Sleep.*due to" -e "Wake.*due to"
    
    Out:
    2021-01-13 03:07:43 +0300 Sleep               Entering Sleep state due to 'Software Sleep pid=129': Using AC (Charge:0%) 
    
    // NO INSTANT WAKE ISSUES!!!
    ```

2. There is a `Method (GPRW, 2` in ACPI. Use:
   1. Add `SSDT-GPRW`
   2. Edit [EFI/OC/config.plist -> ACPI -> Patch](#efiocconfigplist---acpi---patch)

#### Fixing USB. Keyboard Wake (config.plist)

Deps:

- **NONE**

Refs:

- [Keyboard Wake Issues](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html)
- [Method 1 - Add Wake Type Property (Recommended)](https://dortania.github.io/OpenCore-Post-Install/usb/misc/keyboard.html#method-1-add-wake-type-property-recommended)
- [USB Fix](https://osy.gitbook.io/hac-mini-guide/details/usb-fix)

Tools:

- [gfxutil](https://github.com/acidanthera/gfxutil/releases)

1. Check PCIRoot

    ```zsh
    In:
    gfxutil

    Out:
    00:14.0 8086:02ed /PCI0@0/XHC@14 = PciRoot(0x0)/Pci(0x14,0x0)
    ```

2. Edit: [EFI/OC/config.plist -> DeviceProperties -> Add](#efiocconfigplist---deviceproperties---add)

### Disabling laptop dGPUs (SSDT-DGPU-OPT, SSDT-DGPU-BUM)

Deps:

- **NONE**

Refs:

- [Disabling laptop dGPUs (SSDT-dGPU-Off/NoHybGfx)](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html)

Tools:

- **NONE**

BIOS device name: `_SB.PCI0.RP05.PXSX`

#### Disabling laptop dGPUs. Optimus Method (SSDT-DGPU-OPT.dsl)

Deps:

- **NONE**

Refs:

- [Optimus Method](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html#optimus-method)

Tools:

- **NONE**

How this works is that we call the `.off` method found on Optimus GPUs, this is the expected way to power off a GPU but some may find their dGPU will power back up later on. Mainly seen in Lenovo's, the Optimus method should work for most users

#### Disabling laptop dGPUs. Bumblebee Method (SSDT-DGPU-BUM.dsl)

Deps:

- **NONE**

Refs:

- [Bumblebee Method](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/laptop-disable.html#bumblebee-method)

Tools:

- **NONE**

With some machines, the simple `.off` call won't keep the card off properly, that's where the Bumblebee method comes in. This SSDT will actually send the dGPU into D3 state being the lowest power state a device can support. Credit to Maemo for the original adaptation.

### Patching Intel iGPU (WhateverGreen.kext, config.plist)

Deps:

- **NONE**

Refs:

- [Graphics](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#graphics)
- [DeviceProperties](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html#deviceproperties)
- [Intel iGPU Patching](https://dortania.github.io/OpenCore-Post-Install/gpu-patching/intel-patching)
- [WhateverGreen. Releases](https://github.com/acidanthera/WhateverGreen/releases)
- [WhateverGreen's manual: FAQ.IntelHD.en.md](https://github.com/acidanthera/WhateverGreen/blob/master/Manual/FAQ.IntelHD.en.md)
- [Patching VRAM](https://dortania.github.io/OpenCore-Post-Install/gpu-patching/intel-patching/vram.html)
- [Patching Connector Types](https://dortania.github.io/OpenCore-Post-Install/gpu-patching/intel-patching/connector.html)
- [Patching Bus IDs](https://dortania.github.io/OpenCore-Post-Install/gpu-patching/intel-patching/busid.html)

Tools:

- [IOReg](https://github.com/khronokernel/IORegistryClone) - Rehosting the IORegistry application

1. Add [WhateverGreen.kext](https://github.com/acidanthera/WhateverGreen/releases)
2. Edit [EFI/OC/config.plist -> DeviceProperties -> Add -> PciRoot(0x0)/Pci(0x2,0x0)]((#efiocconfigplist---deviceproperties---add))

### Fixing Backlight (SSDT-PNLFCFL.dsl)

Deps:

- **NONE**

Refs:

- [Fixing Backlight (SSDT-PNLF)](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/backlight.html)
- [Fixing Backlight: Manual](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/backlight-methods/manual.html)
- [Finding the ACPI path](https://dortania.github.io/Getting-Started-With-ACPI/Laptops/backlight-methods/manual.html#finding-the-acpi-path)
- [SSDT-PNLFCFL.dsl](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-PNLFCFL.dsl) - For Coffee Lake and newer

Tools:

- **NONE**

The purpose of this SSDT is to create a PNLF device for macOS to play with, specifically one with a hardware ID of APP0002. Luckily WhateverGreen will handle the rest of the work for us.

ACPI Path: `_SB_.PCI0.GFX0`

### Patching Audio (AppleALC.kext config.plist)

Deps:

- **NONE**

Refs:

- [Fixing audio with AppleALC](https://dortania.github.io/OpenCore-Post-Install/universal/audio.html)
- [Audio](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#audio)
- [AppleALC.kext](https://github.com/acidanthera/AppleALC)
- [DeviceProperties](https://dortania.github.io/OpenCore-Install-Guide/config-laptop.plist/coffee-lake-plus.html#deviceproperties)
- [AppleALC Supported Codec](https://github.com/acidanthera/AppleALC/wiki/Supported-codecs)

Tools:

- **NONE**

`ALC256 layout-id 69 for Xiaomi Pro Enhanced 2019`

1. Add [AppleALC.kext](https://github.com/acidanthera/AppleALC)
2. Edit `config.plist -> DeviceProperties -> Add -> PciRoot(0x0)/Pci(0x1f,0x3)`

### Fixing NVMe (NVMeFix.kext)

Deps:

- **NONE**

Refs:

- [Fixing NVMe](https://dortania.github.io/OpenCore-Post-Install/universal/sleep.html#fixing-nvme)
- [Extras](https://github.com/acidanthera/NVMeFix/releases)

Tools:

- **NONE**

Used for fixing power management and initialization on non-Apple NVMe

### Fixing SMBus support (SSDT-SBUS-MCHC)

Deps:

- **NONE**

Refs:

- [Fixing SMBus support (SSDT-SBUS-MCHC)]((https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus.html))
- [Edits to the sample SSDT](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus-methods/manual.html#edits-to-the-sample-ssdt)
- [Hackintool](https://www.tonymacx86.com/threads/release-hackintool-v3-x-x.254559/)

Tools:

- [Hackintool](https://github.com/headkaze/Hackintool)

Fixing AppleSMBus support in macOS, what is AppleSMBus? Well this mainly handles the System Management Bus, which has many functions like:

- AppleSMBusController
  - Aids with correct temperature, fan, voltage, ICH, etc readings
- AppleSMBusPCI
  - Same idea as AppleSMBusController except for low bandwidth PCI devices
- Memory Reporting
  - Aids in proper memory reporting and can aid in getting better kernel panic details if memory related
- Other things SMBus does: [SMBus wiki](https://en.wikipedia.org/wiki/System_Management_Bus)

For install purposes, this SSDT isn't needed but for post-install it's recommended to put the final touches on your hack

1. Run Hackintool
2. Look for the SMBus device under Subclass, then look beside and you'll see the ACPI path(under IOReg Name). To convert , omit `@...`:
    - `/PCI0@0/AppleACPIPCI/SBUS@1F,4` -> `PCI0.SBUS`
3. [Verify](https://dortania.github.io/Getting-Started-With-ACPI/Universal/smbus-methods/manual.html#verify-it-s-working) .Once you've installed macOS, you can actually check whether your SSDT-SBUS-MCHC is working or not in terminal:

    ```zsh
    In:
    kextstat | grep -E "AppleSMBusController|AppleSMBusPCI"
    
    Out:
    Executing: /usr/bin/kmutil showloaded
    No variant specified, falling back to release
      124    1 0xffffff7fa0682000 0x7000     0x7000     com.apple.driver.AppleSMBusController (1.0.18d1) A626BC6A-F8F3-3873-B814-711C459FB8BA <50 14 13 6 5 3>
      132    0 0xffffff7fa068d000 0x1000     0x1000     com.apple.driver.AppleSMBusPCI (1.0.14d1) 661F610C-B2F9-3894-BEF7-EC6FFEE84386 <14 6 5 3>
    ```

### Fixing Trackpad (SSDT-TPD0, VoodooI2CServices.kext, VoodooGPIO.kext, VoodooI2C.kext, VoodooI2CHID.kext, VoodooInput.kext)

Deps:

- **NONE**

Refs:

- [Laptop Specifics](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#laptop-specifics)
- [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C/releases) - Used for fixing I2C devices, found with some fancier touchpads and touchscreen machines
- [VoodooI2CHID](https://github.com/VoodooI2C/VoodooI2C/releases) - VoodooI2C Plugin. Can be used to support some USB touchscreens as well
- [Enable trackpad GPIO interrupt mode, work with VoodooI2C.kext and VoodooI2CHID.kext (SSDT-TPD0)](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/main/ACPI/CML/SSDT-TPD0.dsl)

Tools:

- **NONE**

1. Add SSDT-TPD0
2. Add VoodooI2CServices.kext
3. Add VoodooGPIO.kext
4. Add VoodooI2C.kext
5. Add VoodooI2CHID.kext
6. Add VoodooInput.kext

### Fixing Keyboard (SSDT-LGPA, SSDT-PS2K, VoodooPS2Controller.kext, VoodooPS2Keyboard.kext, config.plist)

Deps:

- **NONE**

Refs:

- [Laptop Specifics](https://github.com/acidanthera/VoodooPS2/releases)
- [VoodooPS2](https://github.com/acidanthera/VoodooPS2/releases)
- [Patching DSDT/SSDT for LAPTOP backlight control](https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659/)
- [SSDT-LGPA.dsl](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/main/ACPI/CML/SSDT-LGPA.dsl)
- [SSDT-Swap-LeftControlCapsLock.dsl](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/blob/master/SSDT-Swap-LeftControlCapsLock.dsl)

Tools:

- **NONE**

1. Add SSDT-LGPA
2. Edit [EFI/OC/config.plist -> ACPI -> Patch](#efiocconfigplist---acpi---patch)
3. Add VoodooPS2Controller.kext
4. Add VoodooPS2Keyboard.kext
5. Add SSDT-PS2K

Customizing keyboard - [ApplePS2ToADBMap.h](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/blob/master/VoodooPS2Keyboard/ApplePS2ToADBMap.h)

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

### Fixing Wifi (AirportItlwm.kext)

Deps:

- **NONE**

Refs:

- [WiFi and Bluetooth](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth)
- [AirportItlwm](https://github.com/OpenIntelWireless/itlwm/releases)
- [OpenIntelWireless](https://openintelwireless.github.io/)

Tools:

- **NONE**

### Fixing Bluetooth (IntelBluetoothFirmware.kext, IntelBluetoothInjector.kext)

Deps:

- **NONE**

Refs:

- [WiFi and Bluetooth](https://dortania.github.io/OpenCore-Install-Guide/ktext.html#wifi-and-bluetooth)
- [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases)
- [OpenIntelWireless](https://openintelwireless.github.io/)

Tools:

- **NONE**

### [Battery Patching](https://dortania.github.io/OpenCore-Post-Install/laptop-specific/battery.html)

TODO: !!!

- [Battery Patching](https://dortania.github.io/OpenCore-Post-Install/laptop-specific/battery.html)
- [Rehabman's how to patch DSDT for working battery status](https://www.tonymacx86.com/threads/guide-how-to-patch-dsdt-for-working-battery-status.116102/)
- [Rehabman's Guide to Using Clover to "hotpatch" ACPI](https://www.tonymacx86.com/threads/guide-using-clover-to-hotpatch-acpi.200137/)

## Debug

### Useful commands

1. rebuild kext cache

    ```zsh
    sudo kextcache -i /
    ```

## Refs

### Tools

- [gibMacOS](https://github.com/corpnewt/gibMacOS) - macOS dowmloader
- [ProperTree](https://github.com/corpnewt/ProperTree) - Universal plist editor
- [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS) - For generating our SMBIOS data
- [MountEFI](https://github.com/corpnewt/MountEFI) - EFI mounter
- [IORegistryExplorer](https://github.com/khronokernel/IORegistryClone/blob/master/ioreg-302.zip)
- [ACPI 6.3 Manual](https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf) - Spec
- [Current OpenCorePkg Configuration Doc](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/Configuration.pdf)
- [Sanity Checker](https://opencore.slowgeek.com/) - config.plist verifyer

### Dortania

- [Dortania Home Site](https://dortania.github.io/)
- [Dortania's OpenCore Install Guide](https://dortania.github.io/OpenCore-Install-Guide/)
- [Getting started with ACPI](https://dortania.github.io/Getting-Started-With-ACPI)
- [OpenCore Post-Install](https://dortania.github.io/OpenCore-Post-Install/)
- [GPU Buyers Guide](https://dortania.github.io/GPU-Buyers-Guide/)
- [Wireless Buyers Guide](https://dortania.github.io/Wireless-Buyers-Guide/)
- [Anti-Hackintosh Buyers Guide](https://dortania.github.io/Anti-Hackintosh-Buyers-Guide/)

## Credits

- Thanks to [Acidanthera](https://github.com/acidanthera) for providing [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg/), [HfsPlus.efi](https://github.com/acidanthera/OcBinaryData/blob/master/Drivers/HfsPlus.efi), [Lilu](https://github.com/acidanthera/Lilu), [VirtualSMC](https://github.com/acidanthera/VirtualSMC), [CPUFriend](https://github.com/acidanthera/CPUFriend), [WhateverGreen](https://github.com/acidanthera/WhateverGreen), [AppleALC](https://github.com/acidanthera/AppleALC), [HibernationFixup](https://github.com/acidanthera/HibernationFixup), [NVMeFix](https://github.com/acidanthera/NVMeFix), [VoodooPS2](https://github.com/acidanthera/VoodooPS2), [gfxutil](https://github.com/acidanthera/gfxutil), [MaciASL](https://github.com/acidanthera/MaciASL), [SSDT-AWAC.dsl](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-AWAC.dsl), [SSDT-PLUG.dsl](https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-PLUG.dsl), [SSDT-EC-USBX.dsl](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-EC-USBX.dsl), [SSDT-SBUS-MCHC](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-SBUS-MCHC.dsl), [SSDT-PNLFCFL.dsl](https://github.com/acidanthera/OpenCorePkg/tree/master/Docs/AcpiSamples/Source/SSDT-PNLFCFL.dsl)
- Thanks to [Dortania](https://github.com/dortania) for providing [SSDT-DGPU-BUM.dsl (SSDT-NoHybGfx.dsl)](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-NoHybGfx.dsl), [SSDT-DGPU-OPT.dsl (SSDT-dGPU-Off.dsl)](https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-dGPU-Off.dsl), [SSDT-GPRW.aml](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/SSDT-GPRW.aml), [GPRW to XPRW Patch (Patch-GPRW)](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/GPRW-Patch.plist), [SSDT-USB-FIXSHUTDOWN.dsl (FixShutdown-USB-SSDT.dsl)](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/FixShutdown-USB-SSDT.dsl), [FixShutdown-Patch.plist](https://github.com/dortania/OpenCore-Post-Install/blob/master/extra-files/FixShutdown-Patch.plist)
- Thanks to [Headkaze](https://github.com/headkaze) for providing [Hackintool](https://github.com/headkaze/Hackintool)
- Thanks to [CorpNewt](https://github.com/corpnewt) for providing [USBMap](https://github.com/corpnewt/USBMap), [gibMacOS](https://github.com/corpnewt/gibMacOS), [ProperTree](https://github.com/corpnewt/ProperTree), [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS), [MountEFI](https://github.com/corpnewt/MountEFI)
- Thanks to [Fewtarius](https://github.com/fewtarius) for providing [CPUFriendFriend (CPUFriendDataProvider)](https://github.com/fewtarius/CPUFriendFriend) (fork of [CorpNewt's](https://github.com/corpnewt) [CPUFriendFriend](https://github.com/corpnewt/CPUFriendFriend))
- Thanks to [Sniki](https://github.com/Sniki) for  providing [OS-X-USB-Inject-All](https://github.com/Sniki/OS-X-USB-Inject-All) (fork of [RehabMan's](https://github.com/RehabMan) [OS-X-USB-Inject-All](https://github.com/RehabMan/OS-X-USB-Inject-All))
- Thanks to [VoodooI2C](https://github.com/VoodooI2C) for providing [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)
- Thanks to [OpenIntelWireless](https://github.com/OpenIntelWireless) for providing [AirportItlwm](https://github.com/OpenIntelWireless/itlwm), [IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware)
- Thanks to [Daliansky](https://github.com/daliansky) for providing [SSDT-LGPA.dsl](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/main/ACPI/CML/SSDT-LGPA.dsl), [SSDT-TPD0](https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/main/ACPI/CML/SSDT-TPD0.dsl)
- Thanks to [RehabMan](https://github.com/RehabMan) for providing [SSDT-PS2K (SSDT-Swap-LeftControlCapsLock.dsl)](https://github.com/RehabMan/OS-X-Voodoo-PS2-Controller/blob/master/SSDT-Swap-LeftControlCapsLock.dsl)
- Thanks to [Mykola Grymalyuk](https://github.com/khronokernel) for providing [IORegistryExplorer](https://github.com/khronokernel/IORegistryClone)
- Thanks to [tonymacx86.com](https://www.tonymacx86.com/) for providing a huge number of guides, supports snd discussions
- Thanks to [Unified Extensible Firmware Interface Forum](https://uefi.org) for providing [ACPI 6.3 Manual](https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf)
- Thanks to [Rasmus Lerdorf](https://github.com/rlerdorf) for [Sanity Checker](https://opencore.slowgeek.com/) ([Sanity Checker Repo](https://github.com/rlerdorf/OCSanity))
