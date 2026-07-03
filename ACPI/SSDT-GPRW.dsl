// RehabMan's ProBook patches

DefinitionBlock ("", "SSDT", 2, "DRTNIA", "GPRW", 0x00000000)
{
    External(\XPRW, MethodObj)

    // Original GPRW is renamed to XPRW
    Method (GPRW, 2, NotSerialized)
    {
        If (_OSI ("Darwin"))
        {
            If (0x6D == Arg0)
            {
                Return (Package (0x02)
                {
                    0x6D, 
                    Zero
                })
            }

            If (0x0D == Arg0)
            {
                Return (Package (0x02)
                {
                    0x0D, 
                    Zero
                })
            }
        }

        Return (XPRW (Arg0, Arg1))
    }
}
