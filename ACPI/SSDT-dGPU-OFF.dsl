// Disable discrete AMD Radeon 7650M GPU

DefinitionBlock ("", "SSDT", 2, "HPHACK", "GpuOf", 0x00001000)
{
    External(\_SB.PCI0, DeviceObj)
    External(\_SB.PCI0.LPCB.EC0, DeviceObj)
    External(\_SB.PCI0.LPCB.EC0.XREG, MethodObj)

    // Original _PTS is renamed to ZPTS
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        // Enable Radeon 7650M dGPU before sleeping
        External(\_SB.PCI0.PEGP.DGFX._ON, MethodObj)
        if (CondRefOf(\_SB.PCI0.PEGP.DGFX._ON))
        {
            \_SB.PCI0.PEGP.DGFX._ON()
        }

        External(\ZPTS, MethodObj)
        ZPTS(Arg0)
    }

    // Original _WAK is renamed to ZWAK
    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (Arg0 < 1 || Arg0 > 5) { Arg0 = 3 }
        External(\ZWAK, MethodObj)
        Local0 = ZWAK(Arg0)

        // Disable Radeon 7650M dGPU on wake
        External(\_SB.PCI0.PEGP.DGFX._OFF, MethodObj)
        if (CondRefOf(\_SB.PCI0.PEGP.DGFX._OFF))
        {
            \_SB.PCI0.PEGP.DGFX._OFF()
        }

        Return(Local0)
    }

    Scope(\_SB.PCI0.LPCB.EC0)
    {
        // Original _REG is renamed to XREG
        Method (_REG, 2, NotSerialized)  // _REG: Region Availability
        {
            XREG(Arg0, Arg1)

            // Disable Radeon 7650M dGPU
            if (LAnd (LEqual (Arg0,3), LEqual (Arg1,1)))
            {
                External(\_SB.PCI0.PEGP.DGFX._OFF, MethodObj)
                if (CondRefOf(\_SB.PCI0.PEGP.DGFX._OFF))
                {
                    \_SB.PCI0.PEGP.DGFX._OFF()
                }
            }
        }
    }
}
