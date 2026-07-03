// Keyboard function keys fix: press Fn to use F1, F2, etc.

DefinitionBlock ("", "SSDT", 2, "HPHACK", "PS2HP", 0)
{
    External (\_SB.PCI0.LPCB.PS2K, DeviceObj)

    // Select specific keyboard map in RehabMan's VoodooPS2Keyboard.kext
    Method(\_SB.PCI0.LPCB.PS2K._DSM, 4)
    {
        If (!Arg2) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            // Note: Function key part seems to not be necessary
            //"AAPL,has-embedded-fn-keys", Buffer() { 0x01, 0x00, 0x00, 0x00 },
            "RM,oem-id", "HPQOEM",
            "RM,oem-table-id", "167C",
        })
    }
}
