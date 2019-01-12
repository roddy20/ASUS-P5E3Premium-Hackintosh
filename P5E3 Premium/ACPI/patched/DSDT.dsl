/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20181031 (64-bit version)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASL4YrbeU.aml, Sun Nov 11 04:46:33 2018
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00000DCD (3533)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x4E
 *     OEM ID           "A0932"
 *     OEM Table ID     "A0932073"
 *     OEM Revision     0x00000073 (115)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20181031 (538447921)
 */
DefinitionBlock ("", "DSDT", 1, "A0932", "A0932073", 0x00000073)
{
    Scope (_PR)
    {
        Processor (CPU1, 0x01, 0x00000810, 0x06){}
        Processor (CPU2, 0x02, 0x00000810, 0x06){}
        Processor (CPU3, 0x03, 0x00000810, 0x06){}
        Processor (CPU4, 0x04, 0x00000810, 0x06){}
    }

    Name (SMIP, 0xB2)
    Name (PMBS, 0x0800)
    Name (PM30, 0x0830)
    OperationRegion (BIOS, SystemMemory, 0xBFF8E064, 0xFF)
    Field (BIOS, ByteAcc, NoLock, Preserve)
    {
        SS1,    1, 
        SS2,    1, 
        SS3,    1, 
        SS4,    1, 
        Offset (0x01), 
        IOST,   16, 
        TOPM,   32, 
        ROMS,   32, 
        MG1B,   32, 
        MG1L,   32, 
        MG2B,   32, 
        MG2L,   32, 
        Offset (0x1C), 
        CPB0,   32, 
        CPB1,   32, 
        CPB2,   32, 
        CPB3,   32, 
        ASSB,   8, 
        AOTB,   8, 
        AAXB,   32, 
        SMIF,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        MPEN,   8, 
        TPMF,   8, 
        MSC1,   32, 
        MSC2,   32, 
        MSC3,   32, 
        MSC4,   32, 
        MSC5,   32, 
        MSC6,   32, 
        MSC7,   32, 
        MSC8,   32, 
        DMAX,   8, 
        HPTA,   32
    }

    Name (PICM, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        PICM = Arg0
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Scope (_SB)
    {
        Name (AR00, Package (0x1B)
        {
            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0006FFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                One, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x001FFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                Zero, 
                Zero, 
                0x17
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001BFFFF, 
                Zero, 
                Zero, 
                0x16
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001CFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                Zero, 
                Zero, 
                0x14
            }, 

            Package (0x04)
            {
                0x0019FFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x001DFFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x001AFFFF, 
                One, 
                Zero, 
                0x15
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x11
            }
        })
        Name (AR02, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (AR03, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (AR04, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (AR06, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x11
            }
        })
        Name (AR07, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x12
            }
        })
        Name (AR08, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }
        })
        Name (AR09, Package (0x04)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x10
            }
        })
        Name (AR01, Package (0x0E)
        {
            Package (0x04)
            {
                0xFFFF, 
                Zero, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0xFFFF, 
                One, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x02, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0xFFFF, 
                0x03, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                Zero, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                One, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x02, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0001FFFF, 
                0x03, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                Zero, 
                Zero, 
                0x12
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                One, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x02, 
                Zero, 
                0x10
            }, 

            Package (0x04)
            {
                0x0002FFFF, 
                0x03, 
                Zero, 
                0x11
            }, 

            Package (0x04)
            {
                0x0003FFFF, 
                Zero, 
                Zero, 
                0x13
            }, 

            Package (0x04)
            {
                0x0004FFFF, 
                Zero, 
                Zero, 
                0x10
            }
        })
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_ADR, Zero)  // _ADR: Address
            Method (^BN00, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (_BBN, 0, NotSerialized)  // _BBN: BIOS Bus Number
            {
                Return (BN00 ())
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                Return (AR00) /* \_SB_.AR00 */
            }

            Name (_S3D, 0x03)  // _S3D: S3 Device State
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Device (P0P2)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR02) /* \_SB_.AR02 */
                }

                Device (GFX0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, One)  // _SUN: Slot User Number
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (P0P3)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR03) /* \_SB_.AR03 */
                }

                Device (ARPT)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x04)  // _SUN: Slot User Number
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0B, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR01) /* \_SB_.AR01 */
                }

                Device (LAN1)
                {
                    Name (_ADR, 0x00040000)  // _ADR: Address
                }

                Device (FRWR)
                {
                    Name (_ADR, 0x00030000)  // _ADR: Address
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x00,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0C01") /* System Board */)  // _CID: Compatible ID
                    Name (_STA, 0x0F)  // _STA: Status
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQNoFlags ()
                            {0,8,11}
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
            }

            Device (EUSB)
            {
                Name (_ADR, 0x001D0007)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x04
                })
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0007)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
            }

            Device (P0P4)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR04) /* \_SB_.AR04 */
                }

                Device (XHCI)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, 0x06)  // _SUN: Slot User Number
                }
            }

            Device (P0P5)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
            }

            Device (P0P6)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR06) /* \_SB_.AR06 */
                }
            }

            Device (P0P7)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR07) /* \_SB_.AR07 */
                }
            }

            Device (P0P8)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR08) /* \_SB_.AR08 */
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR09) /* \_SB_.AR09 */
                }

                Device (LAN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GBEC)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x04
                })
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
            }

            Device (USB4)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
            }

            Device (USB5)
            {
                Name (_ADR, 0x001A0001)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
            }

            Device (USB6)
            {
                Name (_ADR, 0x001A0002)  // _ADR: Address
                Name (_S3D, 0x03)  // _S3D: S3 Device State
            }

            Device (MCHC)
            {
                Name (_ADR, Zero)  // _ADR: Address
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
            }
        }

        Scope (\_GPE)
        {
            Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0P2, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P3, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P4, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P5, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P6, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P7, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P8, 0x02) // Device Wake
                Notify (\_SB.PCI0.P0P9, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.P0P1, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L1E, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Sleep (0x03E8)
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.EUSB, 0x02) // Device Wake
                Notify (\_SB.PCI0.USBE, 0x02) // Device Wake
                Notify (\_SB.PCI0.GBEC, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L03, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB0, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L04, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB1, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0C, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB2, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L0E, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB4, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L05, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB5, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }

            Method (_L20, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.USB6, 0x02) // Device Wake
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    Scope (_SB)
    {
        Scope (PCI0)
        {
            Name (CRS, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, )
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    ,, , TypeStatic, DenseTranslation)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic, DenseTranslation)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y00._MIN, MIN5)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y00._MAX, MAX5)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y00._LEN, LEN5)  // _LEN: Length
            CreateDWordField (CRS, \_SB.PCI0._Y01._MIN, MIN6)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y01._MAX, MAX6)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y01._LEN, LEN6)  // _LEN: Length
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Local0 = MG1L /* \MG1L */
                If (Local0)
                {
                    MIN5 = MG1B /* \MG1B */
                    LEN5 = MG1L /* \MG1L */
                    MAX5 = (MIN5 + Local0--)
                }

                MIN6 = MG2B /* \MG2B */
                LEN6 = MG2L /* \MG2L */
                Local0 = MG2L /* \MG2L */
                MAX6 = (MIN6 + Local0--)
                Return (CRS) /* \_SB_.PCI0.CRS_ */
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Name (SLPS, Zero)
    OperationRegion (APMP, SystemIO, SMIP, 0x02)
    Field (APMP, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMS,   8
    }

    Field (APMP, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   1, 
        BRTC,   1
    }

    OperationRegion (PMS0, SystemIO, PMBS, 0x04)
    Field (PMS0, ByteAcc, NoLock, Preserve)
    {
            ,   10, 
        RTCS,   1, 
            ,   4, 
        WAKS,   1, 
        Offset (0x03), 
        PWBT,   1, 
        Offset (0x04)
    }

    OperationRegion (SMIE, SystemIO, PM30, 0x08)
    Field (SMIE, ByteAcc, NoLock, Preserve)
    {
            ,   4, 
        PS1E,   1, 
            ,   31, 
        PS1S,   1, 
        Offset (0x08)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If ((Arg0 == 0x05)){}
        Else
        {
            If (Arg0)
            {
                PS1S = One
                PS1E = One
                SLPS = One
            }

            WAKP [Zero] = Zero
            WAKP [One] = Zero
            WSSB = ASSB /* \ASSB */
            WOTB = AOTB /* \AOTB */
            WAXB = AAXB /* \AAXB */
            ASSB = Arg0
            AOTB = Zero
            AAXB = Zero
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        SLPS = Zero
        PS1E = Zero
        If (((Arg0 == One) && RTCS)){}
        ElseIf (((Arg0 == 0x03) && BRTC)){}
        Else
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        If (IOWK){}
        Else
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        If (ASSB)
        {
            ASSB = WSSB /* \WSSB */
            AOTB = WOTB /* \WOTB */
            AAXB = WAXB /* \WAXB */
        }

        If (DerefOf (WAKP [Zero]))
        {
            WAKP [One] = Zero
        }
        Else
        {
            WAKP [One] = Arg0
        }

        Return (WAKP) /* \WAKP */
    }

    OperationRegion (IORK, SystemIO, 0xB3, One)
    Field (IORK, ByteAcc, NoLock, Preserve)
    {
        IOWK,   8
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S3, Package (0x04)  // _S3_: S3 System State
    {
        0x05, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x06, 
        Zero, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
}

