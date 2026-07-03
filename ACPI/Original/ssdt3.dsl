/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000B50 (2896)
 *     Revision         0x01
 *     Checksum         0xB8
 *     OEM ID           "SgRef"
 *     OEM Table ID     "SgTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20110112 (537985298)
 */
DefinitionBlock ("", "SSDT", 1, "SgRef", "SgTabl", 0x00001000)
{
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.GFX0._DOD, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD01._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD02._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD02._BCL, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.GFX0.DD02._BQC, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD03._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD04._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD05._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD06._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD07._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DD08._ADR, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.GFX0.DDL2, FieldUnitObj)
    External (_SB_.PCI0.GFX0.DDL3, FieldUnitObj)
    External (_SB_.PCI0.GFX0.DDL4, FieldUnitObj)
    External (_SB_.PCI0.GFX0.DDL5, FieldUnitObj)
    External (_SB_.PCI0.GFX0.DDL6, FieldUnitObj)
    External (_SB_.PCI0.GFX0.DDL7, FieldUnitObj)
    External (_SB_.PCI0.GFX0.DDL8, FieldUnitObj)
    External (_SB_.PCI0.GFX0.DIDL, FieldUnitObj)
    External (_SB_.PCI0.GFX0.SDDL, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.PEGP, DeviceObj)
    External (_SB_.PCI0.PEGP.DGFX, DeviceObj)
    External (_SB_.PCI0.PEGP.DGFX._ADR, IntObj)
    External (DID1, FieldUnitObj)
    External (DID2, FieldUnitObj)
    External (DID3, FieldUnitObj)
    External (DID4, FieldUnitObj)
    External (DID5, FieldUnitObj)
    External (DID6, FieldUnitObj)
    External (DID7, FieldUnitObj)
    External (DID8, FieldUnitObj)
    External (EECP, FieldUnitObj)
    External (GBAS, FieldUnitObj)
    External (HLRS, FieldUnitObj)
    External (NDID, FieldUnitObj)
    External (PWEN, FieldUnitObj)
    External (SGFL, FieldUnitObj)
    External (SGMD, FieldUnitObj)
    External (VRMB, FieldUnitObj)
    External (VRMS, FieldUnitObj)
    External (XBAS, FieldUnitObj)

    Scope (\_SB.PCI0.GFX0)
    {
        Method (ATPX, 2, Serialized)
        {
            Switch (Arg0)
            {
                Case (0x00)
                {
                    Store (PX00 (), Local0)
                }
                Case (0x01)
                {
                    Store (PX01 (), Local0)
                }
                Case (0x02)
                {
                    PX02 (Arg1)
                }
                Default
                {
                    Store (Buffer (0x0100)
                        {
                             0x00, 0x00                                     
                        }, Local0)
                }

            }

            Return (Local0)
        }

        Method (PX00, 0, Serialized)
        {
            Store (Buffer (0x0100){}, Local0)
            CreateWordField (Local0, 0x00, SIZE)
            CreateWordField (Local0, 0x02, IVER)
            CreateDWordField (Local0, 0x04, SFBV)
            Store (0x08, SIZE)
            Store (0x01, IVER)
            If (And (SGMD, 0x0F))
            {
                Store (0x03, SFBV)
            }
            Else
            {
                Store (0x33, SFBV)
            }

            Return (Local0)
        }

        Method (PX01, 0, Serialized)
        {
            Store (Buffer (0x0100){}, Local0)
            CreateWordField (Local0, 0x00, SIZE)
            CreateDWordField (Local0, 0x02, VFMK)
            CreateDWordField (Local0, 0x06, FLAG)
            Store (0x0A, SIZE)
            Store (0x06FF, VFMK)
            Store (0x0680, FLAG)
            Return (Local0)
        }

        Method (PX02, 1, Serialized)
        {
            CreateWordField (Arg0, 0x00, SIZI)
            CreateByteField (Arg0, 0x02, PWST)
            And (PWST, 0x01, PWST)
            If (PWST)
            {
                \_SB.PCI0.PEGP.DGFX._ON ()
            }
            Else
            {
                \_SB.PCI0.PEGP.DGFX._OFF ()
            }
        }

        OperationRegion (REVD, SystemMemory, VRMB, VRMS)
        Field (REVD, AnyAcc, NoLock, Preserve)
        {
            SROM,   32, 
            VROM,   512000
        }

        Name (TVGA, Buffer (0xFA00)
        {
             0x00                                           
        })
        Method (ATRM, 2, Serialized)
        {
            Add (Arg0, Arg1, Local0)
            If (LLessEqual (Local0, SROM))
            {
                Multiply (Arg1, 0x08, Local1)
                Multiply (Arg0, 0x08, Local2)
                Store (VROM, TVGA)
                CreateField (TVGA, Local2, Local1, TEMP)
                Name (RETB, Buffer (Arg1){})
                Store (TEMP, RETB)
                Return (RETB)
            }
            ElseIf (LLess (Arg0, SROM))
            {
                Subtract (SROM, Arg0, Local3)
                Multiply (Local3, 0x08, Local1)
                Multiply (Arg0, 0x08, Local2)
                Store (VROM, TVGA)
                CreateField (TVGA, Local2, Local1, TEM)
                Name (RETC, Buffer (Local3){})
                Store (TEM, RETC)
                Return (RETC)
            }
            Else
            {
                Name (RETD, Buffer (0x01){})
                Return (RETD)
            }
        }

        Method (IDAB, 0, Serialized)
        {
            If (LEqual (And (SGMD, 0x0F), 0x01))
            {
                If (LEqual (SGFL, 0x01))
                {
                    WIID ()
                }
            }
            Else
            {
                Store (0x00, NDID)
                If (LNotEqual (DIDL, Zero))
                {
                    Store (SDDL (DIDL), DID1)
                }

                If (LNotEqual (DDL2, Zero))
                {
                    Store (SDDL (DDL2), DID2)
                }

                If (LNotEqual (DDL3, Zero))
                {
                    Store (SDDL (DDL3), DID3)
                }

                If (LNotEqual (DDL4, Zero))
                {
                    Store (SDDL (DDL4), DID4)
                }

                If (LNotEqual (DDL5, Zero))
                {
                    Store (SDDL (DDL5), DID5)
                }

                If (LNotEqual (DDL6, Zero))
                {
                    Store (SDDL (DDL6), DID6)
                }

                If (LNotEqual (DDL7, Zero))
                {
                    Store (SDDL (DDL7), DID7)
                }

                If (LNotEqual (DDL8, Zero))
                {
                    Store (SDDL (DDL8), DID8)
                }
            }

            Return (Zero)
        }

        Method (HWID, 0, Serialized)
        {
            Name (TMP9, Package (0x09)
            {
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Store (Or (0x00010000, DID1), Index (TMP9, 0x00))
            Store (Or (0x00010000, DID2), Index (TMP9, 0x01))
            Store (Or (0x00010000, DID3), Index (TMP9, 0x02))
            Store (Or (0x00010000, DID4), Index (TMP9, 0x03))
            Store (Or (0x00010000, DID5), Index (TMP9, 0x04))
            Store (Or (0x00010000, DID6), Index (TMP9, 0x05))
            Store (Or (0x00010000, DID7), Index (TMP9, 0x06))
            Store (Or (0x00010000, DID8), Index (TMP9, 0x07))
            Store (0x00, Index (TMP9, 0x08))
            If (And (SGFL, 0x01))
            {
                Store (0x80010306, Index (TMP9, 0x08))
            }

            Return (TMP9)
        }

        Method (WIID, 0, Serialized)
        {
            If (LEqual (And (DIDL, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID2, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID3, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID4, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID5, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID6, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID7, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            If (LEqual (And (DID8, 0x0F0F), 0x0306))
            {
                Return (Zero)
            }

            Switch (ToInteger (NDID))
            {
                Case (0x01)
                {
                    Store (0x80010306, DID2)
                    Store (0x02, NDID)
                }
                Case (0x02)
                {
                    Store (0x80010306, DID3)
                    Store (0x03, NDID)
                }
                Case (0x03)
                {
                    Store (0x80010306, DID4)
                    Store (0x04, NDID)
                }
                Case (0x04)
                {
                    Store (0x80010306, DID5)
                    Store (0x05, NDID)
                }
                Case (0x05)
                {
                    Store (0x80010306, DID6)
                    Store (0x06, NDID)
                }
                Case (0x06)
                {
                    Store (0x80010306, DID7)
                    Store (0x07, NDID)
                }
                Case (0x07)
                {
                    Store (0x80010306, DID8)
                    Store (0x08, NDID)
                }
                Case (0x08)
                {
                    Store (0x09, NDID)
                }

            }

            Return (Zero)
        }
    }

    Scope (\_SB.PCI0.PEGP)
    {
        OperationRegion (RPCI, PCI_Config, 0x00, 0xF0)
        Field (RPCI, DWordAcc, Lock, Preserve)
        {
            Offset (0xB0), 
            ASPM,   2, 
                ,   2, 
            LNKD,   1
        }

        OperationRegion (RPCX, SystemMemory, \XBAS, 0x9000)
        Field (RPCX, DWordAcc, NoLock, Preserve)
        {
            Offset (0x8214), 
            Offset (0x8216), 
            LNKS,   4, 
            Offset (0x8C20), 
                ,   4, 
            AFE4,   1, 
            AFE5,   1
        }
    }

    Scope (\_SB.PCI0.PEGP.DGFX)
    {
        Name (ELCT, 0x00)
        Name (HVID, 0x00)
        Name (HDID, 0x00)
        OperationRegion (PCIS, PCI_Config, 0x00, 0xF0)
        Field (PCIS, DWordAcc, Lock, Preserve)
        {
            DVID,   16, 
            Offset (0x2C), 
            SVID,   16, 
            SDID,   16, 
            Offset (0x4C), 
            WVID,   16, 
            WDID,   16
        }

        OperationRegion (GPIO, SystemIO, \GBAS, 0x60)
        Field (GPIO, ByteAcc, Lock, Preserve)
        {
            Offset (0x0C), 
            LVL0,   32, 
            Offset (0x38), 
            LVL1,   32, 
            Offset (0x48), 
            LVL2,   32
        }

        OperationRegion (PCAP, PCI_Config, \EECP, 0x14)
        Field (PCAP, DWordAcc, NoLock, Preserve)
        {
            Offset (0x10), 
            LCTL,   16
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (0x00, \_SB.PCI0.PEGP.DGFX._ADR)
        }

        Method (_ON, 0, Serialized)  // _ON_: Power On
        {
            SGPO (HLRS, 0x00)
            SGPO (PWEN, 0x01)
            Sleep (0xC8)
            SGPO (HLRS, 0x01)
            Sleep (0xC8)
            Store (0x00, AFE4)
            Store (0x00, AFE5)
            Store (0x00, LNKD)
            While (LLess (LNKS, 0x07))
            {
                Sleep (0x01)
            }

            If (HVID)
            {
                Store (HVID, WVID)
                Store (HDID, WDID)
            }
            Else
            {
                Store (0x103C, WVID)
                Store (0x17F1, WDID)
            }

            Or (And (ELCT, 0x43), And (LCTL, 0xFFBC), LCTL)
            Notify (\_SB.PCI0.PEGP, 0x00)
            Return (0x01)
        }

        Method (_OFF, 0, Serialized)  // _OFF: Power Off
        {
            Store (LCTL, ELCT)
            Store (SVID, HVID)
            Store (SDID, HDID)
            Store (0x01, LNKD)
            Store (0x00, AFE4)
            Store (0x01, AFE5)
            While (LNotEqual (LNKS, 0x00))
            {
                Sleep (0x01)
            }

            SGPO (HLRS, 0x00)
            SGPO (PWEN, 0x00)
            Notify (\_SB.PCI0.PEGP, 0x00)
            Return (0x00)
        }

        Method (_STA, 0, Serialized)  // _STA: Status
        {
            If (And (SGMD, 0x0F))
            {
                If (LEqual (SGPI (PWEN), 0x01))
                {
                    Return (0x0F)
                }

                Return (0x00)
            }

            If (LNotEqual (DVID, 0xFFFF))
            {
                Return (0x0F)
            }

            Return (0x00)
        }

        Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
        {
            Return (\_SB.PCI0.GFX0._DOD ())
        }

        Device (DD01)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD01._ADR ())
            }
        }

        Device (DD02)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD02._ADR ())
            }

            Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
            {
                Return (\_SB.PCI0.GFX0.DD02._BCL ())
            }

            Method (_BQC, 0, NotSerialized)  // _BQC: Brightness Query Current
            {
                Return (\_SB.PCI0.GFX0.DD02._BQC ())
            }

            Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
            {
                Return (\_SB.PCI0.GFX0.DD02._BCM (Arg0))
            }
        }

        Device (DD03)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD03._ADR ())
            }
        }

        Device (DD04)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD04._ADR ())
            }
        }

        Device (DD05)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD05._ADR ())
            }
        }

        Device (DD06)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD06._ADR ())
            }
        }

        Device (DD07)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD07._ADR ())
            }
        }

        Device (DD08)
        {
            Method (_ADR, 0, Serialized)  // _ADR: Address
            {
                Return (\_SB.PCI0.GFX0.DD08._ADR ())
            }
        }

        Method (SGPI, 1, Serialized)
        {
            And (Arg0, 0x7F, Arg0)
            If (LLess (Arg0, 0x20))
            {
                Store (\_SB.PCI0.PEGP.DGFX.LVL0, Local0)
                ShiftRight (Local0, Arg0, Local0)
            }
            ElseIf (LLess (Arg0, 0x40))
            {
                Store (\_SB.PCI0.PEGP.DGFX.LVL1, Local0)
                ShiftRight (Local0, Subtract (Arg0, 0x20), Local0)
            }
            Else
            {
                Store (\_SB.PCI0.PEGP.DGFX.LVL2, Local0)
                ShiftRight (Local0, Subtract (Arg0, 0x40), Local0)
            }

            Return (And (Local0, 0x01))
        }

        Method (SGPO, 2, Serialized)
        {
            And (Arg0, 0x7F, Arg0)
            If (LEqual (Arg1, 0x00))
            {
                Store (0x00, Local3)
            }
            Else
            {
                Store (0x01, Local3)
            }

            If (LLess (Arg0, 0x20))
            {
                ShiftLeft (Local3, Arg0, Local0)
                ShiftLeft (0x01, Arg0, Local1)
                And (\_SB.PCI0.PEGP.DGFX.LVL0, Not (Local1), Local2)
                Or (Local2, Local0, \_SB.PCI0.PEGP.DGFX.LVL0)
            }
            ElseIf (LLess (Arg0, 0x40))
            {
                ShiftLeft (Local3, Subtract (Arg0, 0x20), Local0)
                ShiftLeft (0x01, Subtract (Arg0, 0x20), Local1)
                And (\_SB.PCI0.PEGP.DGFX.LVL1, Not (Local1), Local2)
                Or (Local2, Local0, \_SB.PCI0.PEGP.DGFX.LVL1)
            }
            Else
            {
                ShiftLeft (Local3, Subtract (Arg0, 0x40), Local0)
                ShiftLeft (0x01, Subtract (Arg0, 0x40), Local1)
                And (\_SB.PCI0.PEGP.DGFX.LVL2, Not (Local1), Local2)
                Or (Local2, Local0, \_SB.PCI0.PEGP.DGFX.LVL2)
            }

            Return (0x01)
        }
    }
}

