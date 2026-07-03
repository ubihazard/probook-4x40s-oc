// AirPort fix works with vanilla IO80211 kext.
//
// From toleda Broadcom BCM94352HMB GitHub repo: add
// AirPort device property for spoofing non-native cards.
//
// Edit SSDT based on your WNIC device path
// in IORegistryExplorer (e.g. RP04 -> RP0X).

DefinitionBlock ("", "SSDT", 1, "toleda", "ami8arpt", 0x00003000)
{
    External (\_SB.PCI0.RP04, DeviceObj)  // Ubihazard: edit path here
    External (\_SB.PCI0.RP04.PXSX, DeviceObj)  // Ubihazard: edit path here
    External (PXSX, DeviceObj)

    Scope (\_SB.PCI0.RP04)  // Ubihazard: edit path here
    {
        Scope (PXSX)
        {
            Name (_STA, Zero)  // _STA: Status
        }

        Device (ARPT)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x09,
                0x04
            })
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg2 == Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03
                    })
                }
                //Return (Package (0x02)
                //{
                //    "compatible",
                //    "pci14e4,43a0"
                //})
                Return (Package()
                {
                    "device-id", Buffer() { 0xa0, 0x43, 0x00, 0x00 },
                    "compatible", Buffer() { "pci14e4,43b1" },
                    "name", "AirPort Extreme",
                    "model", Buffer() { "Broadcom BCM4352 802.11ac Dual Band Wireless Network Adapter" },
                    "AAPL,slot-name", Buffer() { "AirPort" },
                    "device_type", Buffer() { "AirPort" },
                    "built-in", Buffer () {0x00},
                    //"subsystem-id", Buffer() { 0x8F, 0x00, 0x00, 0x00 },
                    //"subsystem-vendor-id", Buffer() { 0x6B, 0x10, 0x00, 0x00 },
                })
            }
        }
    }
}
