/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180629 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLOqaTaX.aml, Wed Jul 18 04:02:44 2018
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000ED (237)
 *     Revision         0x01
 *     Checksum         0x5B
 *     OEM ID           "HDMI"
 *     OEM Table ID     "NVIDIA"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180629 (538445353)
 */
DefinitionBlock ("", "SSDT", 1, "HDMI", "NVIDIA", 0x00003000)
{
    External (_SB_.PCI0.P0P2.GFX0, DeviceObj)

    Scope (\_SB.PCI0.P0P2.GFX0)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If ((Arg2 == Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x0A)
            {
                "@0,connector-type", 
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           // ....
                }, 

                "@1,connector-type", 
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           // ....
                }, 

                "@2,connector-type", 
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           // ....
                }, 

                "@3,connector-type", 
                Buffer (0x04)
                {
                     0x00, 0x08, 0x00, 0x00                           // ....
                }, 

                "hda-gfx", 
                Buffer (0x0A)
                {
                    "onboard-1"
                }
            })
        }
    }
}

