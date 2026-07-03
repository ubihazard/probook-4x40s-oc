// Inject Apple USB properties into USB controller devices

DefinitionBlock ("", "SSDT", 2, "HPHACK", "HPUSBP", 0)
{
    External (\_SB.PCI0.XHC, DeviceObj)
    External (\_SB.PCI0.EH01, DeviceObj)
    External (\_SB.PCI0.EH02, DeviceObj)

    Method(\_SB.PCI0.XHC._DSM, 4, NotSerialized)
    {
        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "subsystem-id", Buffer() { 0x70, 0x72, 0x00, 0x00 },
            "subsystem-vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "AAPL,current-available", 2100,
            "AAPL,current-extra", 2200,
            "AAPL,current-extra-in-sleep", 1600,
            "AAPL,device-internal", 0x02,
            "AAPL,max-port-current-in-sleep", 2100,
        })
    }

    Method(\_SB.PCI0.EH01._DSM, 4, NotSerialized)
    {
        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "AAPL,clock-id", Buffer() { 0x01 },
            "subsystem-id", Buffer() { 0x70, 0x72, 0x00, 0x00 },
            "subsystem-vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "AAPL,current-available", 2100,
            "AAPL,current-extra", 2200,
            "AAPL,current-extra-in-sleep", 1600,
            "AAPL,device-internal", 0x02,
            "AAPL,max-port-current-in-sleep", 2100,
        })
    }

    Method(\_SB.PCI0.EH02._DSM, 4, NotSerialized)
    {
        If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
        Return (Package()
        {
            "AAPL,clock-id", Buffer() { 0x01 },
            "subsystem-id", Buffer() { 0x70, 0x72, 0x00, 0x00 },
            "subsystem-vendor-id", Buffer() { 0x86, 0x80, 0x00, 0x00 },
            "AAPL,current-available", 2100,
            "AAPL,current-extra", 2200,
            "AAPL,current-extra-in-sleep", 1600,
            "AAPL,device-internal", 0x02,
            "AAPL,max-port-current-in-sleep", 2100,
        })
    }
}
