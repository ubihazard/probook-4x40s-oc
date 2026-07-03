// Add "_STA" method to RTC (expected by Big Sur and higher?)

DefinitionBlock ("", "SSDT", 2, "HPHACK", "RTC", 0x00000000)
{
    External (\_SB.PCI0.LPCB, DeviceObj)
    External (\_SB.PCI0.LPCB.RTC, DeviceObj)

    Scope (\_SB.PCI0.LPCB)
    {
        // Hide original RTC device from macOS
        Scope (RTC)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }
        }
        // Create new RTC device for macOS to play with
        Device (RTC0)
        {
            Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0070,  // Range Minimum
                    0x0070,  // Range Maximum
                    0x01,    // Alignment
                    0x02,    // Length (was 0x08)
                    )
                IRQNoFlags ()
                    {}       // IRQ conflict patch (was 8)
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}
