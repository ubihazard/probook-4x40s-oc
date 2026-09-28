// Disable discrete AMD Radeon 7650M GPU, part 2

DefinitionBlock ("", "SSDT", 2, "HPHACK", "GpuOf2", 0x00001000)
{
    External(\_SB.PCI0, DeviceObj)
    External(\_SB.PCI0.GFX0, DeviceObj)
    External(\_SB.PCI0.GFX0.ZX02, MethodObj)
    External(\_SB.PCI0.PEGP.DGFX, DeviceObj)

    Scope(\_SB.PCI0.GFX0)
    {
        // Original PX02 is renamed to ZX02
        Method (PX02, 1, Serialized)
        {
            // Prevent Radeon 7650M from turning on
            ZX02 (Zero)
        }
    }

    Scope(\_SB.PCI0.PEGP.DGFX)
    {
        // Original _INI is renamed to ZINI
        Method (_INI, 0, NotSerialized)
        {
            External(\_SB.PCI0.PEGP.DGFX.ZINI, MethodObj)
            External(\_SB.PCI0.PEGP.DGFX._OFF, MethodObj)

            // Turn Radeon 7650M off
            if (LAnd(CondRefOf(\_SB.PCI0.PEGP.DGFX.ZINI),
                CondRefOf(\_SB.PCI0.PEGP.DGFX._OFF)))
            {
                ZINI()
                _OFF()
            }
        }
    }
}
