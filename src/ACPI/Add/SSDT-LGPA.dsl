// Reference: https://github.com/daliansky/XiaoMi-Pro-Hackintosh/blob/main/ACPI/CML/SSDT-LGPA.dsl by Daliansky

// Necessary hotpatch for CometLake with MX250, pair with `Rename Method(LGPA,1,S) to XGPA` rename patch and SSDT-PS2K
// Maintained by: stevezhengshiqi
// Reference: https://www.tonymacx86.com/threads/guide-patching-dsdt-ssdt-for-laptop-backlight-control.152659 by Rehabman
// Let brightness key and screenshot key work with VoodooPS2Controller.kext, pair with LGPA rename and SSDT-PS2K

DefinitionBlock ("", "SSDT", 2, "hack", "_LGPA", 0x00000000)
{
    External (_SB_.CPPC, IntObj)
    External (_SB_.PCI0.GFX0.DD1F, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.ACTL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.CCI0, IntObj)
    External (_SB_.PCI0.LPCB.CCI1, IntObj)
    External (_SB_.PCI0.LPCB.CCI2, IntObj)
    External (_SB_.PCI0.LPCB.CCI3, IntObj)
    External (_SB_.PCI0.LPCB.DCTL, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC92, FieldUnitObj)
    External (_SB_.PCI0.LPCB.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB.MGI0, IntObj)
    External (_SB_.PCI0.LPCB.MGI1, IntObj)
    External (_SB_.PCI0.LPCB.MGI2, IntObj)
    External (_SB_.PCI0.LPCB.MGI3, IntObj)
    External (_SB_.PCI0.LPCB.MGI4, IntObj)
    External (_SB_.PCI0.LPCB.MGI5, IntObj)
    External (_SB_.PCI0.LPCB.MGI6, IntObj)
    External (_SB_.PCI0.LPCB.MGI7, IntObj)
    External (_SB_.PCI0.LPCB.MGI8, IntObj)
    External (_SB_.PCI0.LPCB.MGI9, IntObj)
    External (_SB_.PCI0.LPCB.MGIA, IntObj)
    External (_SB_.PCI0.LPCB.MGIB, IntObj)
    External (_SB_.PCI0.LPCB.MGIC, IntObj)
    External (_SB_.PCI0.LPCB.MGID, IntObj)
    External (_SB_.PCI0.LPCB.MGIE, IntObj)
    External (_SB_.PCI0.LPCB.MGIF, IntObj)
    External (_SB_.PCI0.LPCB.OCPF, FieldUnitObj)
    External (_SB_.PCI0.LPCB.OSMI, MethodObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.LPCB.PWCG, MethodObj)
    External (_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (_SB_.PCI0.RP05.PXSX.NLIM, IntObj)
    External (_SB_.PCI0.WMIE, DeviceObj)
    External (_SB_.PCI0.WMIE.EVT5, IntObj)
    External (_SB_.PCI0.WMIE.EVT6, IntObj)
    External (_SB_.PCI0.WMIE.EVT7, IntObj)
    External (_SB_.PCI0.WMIE.EVT8, IntObj)
    External (_SB_.PCI0.WMIE.EVT9, IntObj)
    External (_SB_.PCI0.WMIE.EVTA, IntObj)
    External (_SB_.PCI0.WMIE.EVTB, IntObj)
    External (_SB_.PCI0.WMIE.EVTC, IntObj)
    External (_SB_.PCI0.WMIE.EVTD, IntObj)
    External (_SB_.PCI0.WMIX, DeviceObj)
    External (_SB_.PCI0.WMIX.EV01, IntObj)
    External (_SB_.PCI0.WMIX.EV02, IntObj)
    External (_SB_.PCI0.WMIX.EV03, IntObj)
    External (_SB_.PCI0.WMIX.EV04, IntObj)
    External (_SB_.PCI0.WMIX.EV05, IntObj)
    External (_SB_.PCI0.WMIX.EV06, IntObj)
    External (_SB_.PCI0.WMIX.EV07, IntObj)
    External (_SB_.PCI0.WMIX.EV08, IntObj)
    External (_SB_.PCI0.WMIX.EV09, IntObj)
    External (_SB_.PCI0.WMIX.EV10, IntObj)
    External (_SB_.PCI0.WMIX.EV11, IntObj)
    External (_SB_.PCI0.WMIX.EV12, IntObj)
    External (_SB_.PCI0.WMIX.EV13, IntObj)
    External (_SB_.PCI0.WMIX.EV14, IntObj)
    External (_SB_.PCI0.WMIX.EV15, IntObj)
    External (_SB_.PCI0.WMIX.EV16, IntObj)
    External (_SB_.PCI0.WMIX.EV17, IntObj)
    External (_SB_.PCI0.WMIX.EV18, IntObj)
    External (_SB_.PCI0.WMIX.EV5A, IntObj)
    External (_SB_.PCI0.WMIX.EVX5, IntObj)
    External (_SB_.PCI0.WMIX.EVX6, IntObj)
    External (_SB_.UBTC, DeviceObj)
    External (_SB_.UBTC.CCI0, IntObj)
    External (_SB_.UBTC.CCI1, IntObj)
    External (_SB_.UBTC.CCI2, IntObj)
    External (_SB_.UBTC.CCI3, IntObj)
    External (_SB_.UBTC.MGI0, IntObj)
    External (_SB_.UBTC.MGI1, IntObj)
    External (_SB_.UBTC.MGI2, IntObj)
    External (_SB_.UBTC.MGI3, IntObj)
    External (_SB_.UBTC.MGI4, IntObj)
    External (_SB_.UBTC.MGI5, IntObj)
    External (_SB_.UBTC.MGI6, IntObj)
    External (_SB_.UBTC.MGI7, IntObj)
    External (_SB_.UBTC.MGI8, IntObj)
    External (_SB_.UBTC.MGI9, IntObj)
    External (_SB_.UBTC.MGIA, IntObj)
    External (_SB_.UBTC.MGIB, IntObj)
    External (_SB_.UBTC.MGIC, IntObj)
    External (_SB_.UBTC.MGID, IntObj)
    External (_SB_.UBTC.MGIE, IntObj)
    External (_SB_.UBTC.MGIF, IntObj)
    External (OG00, FieldUnitObj)
    External (PNOT, MethodObj)
    External (SEN1, DeviceObj)

    Scope (_SB.PCI0.LPCB)
    {
        Method (LGPA, 1, Serialized)
        {
            Switch (ToInteger (Arg0))
            {
                Case (Zero)
                {
                    Notify (LID0, 0x80) // Status Change
                }
                Case (One)
                {
                    OSMI (0xF8)
                    Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                    CPPC = Zero
                    If ((OG00 > Zero))
                    {
                        Divide (OG00, 0x0A, Local0, Local1)
                        If ((Local0 > 0x05))
                        {
                            Local1++
                        }

                        While (Local1)
                        {
                            Local1--
                            Notify (^^GFX0.DD1F, 0x86) // Device-Specific
                            Sleep (0x32)
                        }

                        OG00 = Zero
                    }

                    PWCG ()
                    PNOT ()
                }
                Case (0x02)
                {
                    PWCG ()
                    PNOT ()
                }
                Case (0x03)
                {
                    // Brightness Down
                    If (_OSI ("Darwin"))
                    {
                        Notify (PS2K, 0x0405)
                    }
                    Else
                    {
                        Notify (^^GFX0.DD1F, 0x87) // Device-Specific
                    }

                    OG00 = Zero
                }
                Case (0x04)
                {
                    // Brightness Up
                    If (_OSI ("Darwin"))
                    {
                        Notify (PS2K, 0x0406)
                    }
                    Else
                    {
                        Notify (^^GFX0.DD1F, 0x86) // Device-Specific
                    }

                    OG00 = Zero
                }
                Case (0x05)
                {
                    If ((^^WMIX.EV04 != Zero))
                    {
                        Notify (WMIX, 0x88) // Device-Specific
                    }
                }
                Case (0x06)
                {
                }
                Case (0x07)
                {
                    Notify (SEN1, 0x90) // Device-Specific
                }
                Case (0x08)
                {
                    Local0 = ((EC92 >> 0x03) & One)
                    If (Local0)
                    {
                        Switch (ToInteger (ACTL))
                        {
                            Case (Zero)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (One)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (0x02)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (0x03)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = 0x02
                                PNOT ()
                            }
                            Case (0x04)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = 0x06
                                PNOT ()
                            }
                            Case (0x05)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = 0x08
                                PNOT ()
                            }
                            Case (0x06)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = 0x0E
                                PNOT ()
                            }
                            Case (0x07)
                            {
                                Notify (^^RP05.PXSX, 0xD2) // Hardware-Specific
                                CPPC = 0x0E
                                PNOT ()
                            }
                            Case (0x08)
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = 0x0E
                                PNOT ()
                                If ((OG00 > Zero))
                                {
                                    Divide (OG00, 0x0A, Local0, Local1)
                                    If ((Local0 > 0x05))
                                    {
                                        Local1++
                                    }

                                    While (Local1)
                                    {
                                        Local1--
                                        Notify (^^GFX0.DD1F, 0x86) // Device-Specific
                                        Sleep (0x32)
                                    }

                                    OG00 = Zero
                                }
                            }
                            Default
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = 0x0E
                                PNOT ()
                            }

                        }
                    }
                    Else
                    {
                        Switch (ToInteger (DCTL))
                        {
                            Case (Zero)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (One)
                            {
                                Notify (^^RP05.PXSX, 0xD1) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (0x02)
                            {
                                Notify (^^RP05.PXSX, 0xD2) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (0x03)
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (0x04)
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = Zero
                                PNOT ()
                            }
                            Case (0x05)
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = 0x02
                                PNOT ()
                            }
                            Case (0x06)
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = 0x06
                                PNOT ()
                            }
                            Case (0x07)
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = 0x08
                                PNOT ()
                            }
                            Case (0x08)
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = 0x0E
                                PNOT ()
                            }
                            Default
                            {
                                Notify (^^RP05.PXSX, 0xD5) // Hardware-Specific
                                CPPC = 0x0E
                                PNOT ()
                            }

                        }
                    }
                }
                Case (0x09)
                {
                }
                Case (0x0A)
                {
                    If ((^^WMIX.EV09 != Zero))
                    {
                        Notify (WMIX, 0x8E) // Device-Specific
                    }

                    If ((^^WMIE.EVT8 != Zero))
                    {
                        Notify (WMIE, 0x88) // Device-Specific
                    }
                }
                Case (0x0B)
                {
                    If ((^^WMIX.EV08 != Zero))
                    {
                        Notify (WMIX, 0x8D) // Device-Specific
                    }

                    If ((^^WMIE.EVT7 != Zero))
                    {
                        Notify (WMIE, 0x87) // Device-Specific
                    }
                }
                Case (0x0C)
                {
                    If ((^^WMIX.EV06 != Zero))
                    {
                        Notify (WMIX, 0x8B) // Device-Specific
                    }

                    If ((^^WMIE.EVT5 != Zero))
                    {
                        Notify (WMIE, 0x85) // Device-Specific
                    }
                }
                Case (0x0D)
                {
                    If ((^^WMIX.EV07 != Zero))
                    {
                        Notify (WMIX, 0x8C) // Device-Specific
                    }

                    If ((^^WMIE.EVT6 != Zero))
                    {
                        Notify (WMIE, 0x86) // Device-Specific
                    }
                }
                Case (0x0E)
                {
                    If ((^^WMIX.EV10 != Zero)){}
                    If ((^^WMIE.EVT9 != Zero)){}
                }
                Case (0x0F)
                {
                    If ((^^WMIX.EV11 != Zero))
                    {
                        Notify (WMIX, 0x90) // Device-Specific
                    }

                    If ((^^WMIE.EVTA != Zero))
                    {
                        Notify (WMIE, 0x8A) // Device-Specific
                    }
                }
                Case (0x10)
                {
                    // Screenshot
                    If (_OSI ("Darwin"))
                    {
                        Notify (PS2K, 0x0223) // Press Down e023
                        Notify (PS2K, 0x0225) // Press Down e025
                        Notify (PS2K, 0x0226) // Press Down e026
                        Notify (PS2K, 0x02A6) // Press Up e026
                        Notify (PS2K, 0x02A5) // Press Up e025
                        Notify (PS2K, 0x02A3) // Press Up e023
                        OG00 = Zero
                    }

                    If ((^^WMIX.EV02 != Zero))
                    {
                        Notify (WMIX, 0x86) // Device-Specific
                    }

                    If ((^^WMIE.EVTB != Zero))
                    {
                        Notify (WMIE, 0x8B) // Device-Specific
                    }
                }
                Case (0x11)
                {
                    ^^RP05.PXSX.NLIM = One
                    Notify (^^RP05.PXSX, 0xC0) // Hardware-Specific
                }
                Case (0x12)
                {
                    ^^^UBTC.MGI0 = \_SB_.PCI0.LPCB.MGI0 /* External reference */
                    ^^^UBTC.MGI1 = \_SB_.PCI0.LPCB.MGI1 /* External reference */
                    ^^^UBTC.MGI2 = \_SB_.PCI0.LPCB.MGI2 /* External reference */
                    ^^^UBTC.MGI3 = \_SB_.PCI0.LPCB.MGI3 /* External reference */
                    ^^^UBTC.MGI4 = \_SB_.PCI0.LPCB.MGI4 /* External reference */
                    ^^^UBTC.MGI5 = \_SB_.PCI0.LPCB.MGI5 /* External reference */
                    ^^^UBTC.MGI6 = \_SB_.PCI0.LPCB.MGI6 /* External reference */
                    ^^^UBTC.MGI7 = \_SB_.PCI0.LPCB.MGI7 /* External reference */
                    ^^^UBTC.MGI8 = \_SB_.PCI0.LPCB.MGI8 /* External reference */
                    ^^^UBTC.MGI9 = \_SB_.PCI0.LPCB.MGI9 /* External reference */
                    ^^^UBTC.MGIA = \_SB_.PCI0.LPCB.MGIA /* External reference */
                    ^^^UBTC.MGIB = \_SB_.PCI0.LPCB.MGIB /* External reference */
                    ^^^UBTC.MGIC = \_SB_.PCI0.LPCB.MGIC /* External reference */
                    ^^^UBTC.MGID = \_SB_.PCI0.LPCB.MGID /* External reference */
                    ^^^UBTC.MGIE = \_SB_.PCI0.LPCB.MGIE /* External reference */
                    ^^^UBTC.MGIF = \_SB_.PCI0.LPCB.MGIF /* External reference */
                    ^^^UBTC.CCI0 = \_SB_.PCI0.LPCB.CCI0 /* External reference */
                    ^^^UBTC.CCI1 = \_SB_.PCI0.LPCB.CCI1 /* External reference */
                    ^^^UBTC.CCI2 = \_SB_.PCI0.LPCB.CCI2 /* External reference */
                    ^^^UBTC.CCI3 = \_SB_.PCI0.LPCB.CCI3 /* External reference */
                    Notify (UBTC, 0x80) // Status Change
                }
                Case (0x13)
                {
                    If ((^^WMIX.EVX5 != Zero))
                    {
                        Notify (WMIX, 0x91) // Device-Specific
                    }

                    If ((^^WMIE.EVTC != Zero))
                    {
                        Notify (WMIE, 0x8C) // Device-Specific
                    }
                }
                Case (0x14)
                {
                    OCPF = Zero
                    Notify (UBTC, One) // Device Check
                }
                Case (0x15)
                {
                    // Video Mirror
                    If (_OSI ("Darwin"))
                    {
                        Notify (PS2K, 0x0225) // Press Down e025
                        Notify (PS2K, 0x022B) // Press Down e02b
                        Notify (PS2K, 0x02AB) // Press Up e02b
                        Notify (PS2K, 0x02A5) // Press Up e025
                        OG00 = Zero
                    }
                    ElseIf ((^^WMIX.EV01 != Zero))
                    {
                        Notify (WMIX, 0x85) // Device-Specific
                    }
                }
                Case (0x16)
                {
                    // Mission Control
                    If (_OSI ("Darwin"))
                    {
                        Notify (PS2K, 0x022C) // Press Down e02c
                        Notify (PS2K, 0x022D) // Press Down e02d
                        Notify (PS2K, 0x02AD) // Press Up e02d
                        Notify (PS2K, 0x02AC) // Press Up e02c
                        OG00 = Zero
                    }
                    ElseIf ((^^WMIX.EV03 != Zero))
                    {
                        Notify (WMIX, 0x87) // Device-Specific
                    }
                }
                Case (0x17)
                {
                    If ((^^WMIX.EV05 != Zero))
                    {
                        Notify (WMIX, 0x89) // Device-Specific
                    }
                }
                Case (0x18)
                {
                    If ((^^WMIX.EV5A != Zero))
                    {
                        Notify (WMIX, 0x8A) // Device-Specific
                    }
                }
                Case (0x19)
                {
                    If ((^^WMIX.EV12 != Zero))
                    {
                        Notify (WMIX, 0x93) // Device-Specific
                    }
                }
                Case (0x1A)
                {
                    If ((^^WMIX.EV13 != Zero))
                    {
                        Notify (WMIX, 0x94) // Device-Specific
                    }
                }
                Case (0x1B)
                {
                    If ((^^WMIX.EV14 != Zero))
                    {
                        Notify (WMIX, 0x95) // Device-Specific
                    }
                }
                Case (0x1C)
                {
                    If ((^^WMIX.EV15 != Zero))
                    {
                        Notify (WMIX, 0x96) // Device-Specific
                    }
                }
                Case (0x1D)
                {
                    If ((^^WMIX.EV16 != Zero))
                    {
                        Notify (WMIX, 0x97) // Device-Specific
                    }
                }
                Case (0x1E)
                {
                    If ((^^WMIX.EV17 != Zero))
                    {
                        Notify (WMIX, 0x98) // Device-Specific
                    }
                }
                Case (0x1F)
                {
                    If ((^^WMIX.EV18 != Zero))
                    {
                        Notify (WMIX, 0x99) // Device-Specific
                    }
                }
                Case (0x20)
                {
                    If ((^^WMIX.EVX6 != Zero)){}
                    If ((^^WMIE.EVTD != Zero)){}
                }
                Case (0x21)
                {
                    OSMI (0xF8)
                }
                Case (0x0100)
                {
                }
                Default
                {
                }

            }
        }
    }
}