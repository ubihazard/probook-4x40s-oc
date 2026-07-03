// RehabMan's ProBook patches

DefinitionBlock ("", "SSDT", 2, "DRTNIA", "LANCPRW", 0x00000000)
{
    External(\_SB_.PCI0.LANC, DeviceObj)
    External(\_SB_.PCI0.LANC.XPRW, MethodObj)

    // Original _PRW is renamed to XPRW
    Method (_SB_.PCI0.LANC._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
    {
        //Local0 = \_SB_.PCI0.LANC.XPRW()
        //While (One)
        //{
        //    Local0[One] = Zero
        //}

        // The purpose of this implementation is to avoid "instant wake"
        // by returning 0 in the second position (sleep state supported)
        // of the return package
        Local0 = \_SB_.PCI0.LANC.XPRW()
        Local0[One] = 0

        Return(Local0)
    }
}
