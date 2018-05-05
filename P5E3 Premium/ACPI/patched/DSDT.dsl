/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140926-64 [Oct 24 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of iASLzLtGWJ.aml, Wed May  2 03:21:35 2018
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00002235 (8757)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0x2B
 *     OEM ID           "APPLE "
 *     OEM Table ID     "Apple00"
 *     OEM Revision     0x00010001 (65537)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20140926 (538183974)
 */
DefinitionBlock ("iASLzLtGWJ.aml", "DSDT", 1, "APPLE ", "Apple00", 0x00010001)
{
    Scope (_PR)
    {
        Processor (CPU1, 0x01, 0x00000810, 0x06) {}
        Processor (CPU2, 0x02, 0x00000810, 0x06) {}
        Processor (CPU3, 0x03, 0x00000810, 0x06) {}
        Processor (CPU4, 0x04, 0x00000810, 0x06) {}
    }

    Name (DP80, 0x80)
    Name (DP90, 0x90)
    Name (SPIO, 0x2E)
    Name (IOHW, 0x0290)
    Name (APIC, One)
    Name (SMIP, 0xB2)
    Name (PMBS, 0x0800)
    Name (PMLN, 0x80)
    Name (GPBS, 0x0480)
    Name (GPLN, 0x40)
    Name (SMBL, Zero)
    Name (PM30, 0x0830)
    Name (SUSW, 0xFF)
    Name (EAQF, One)
    Name (CFTE, One)
    Name (PCIB, 0xE0000000)
    Name (PCIL, 0x10000000)
    Name (SMBS, 0x0400)
    Name (CPUC, 0x04)
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
        Store (0xAA, DBG8) /* \DBG8 */
        Store (Arg0, PICM) /* \PICM */
    }

    Name (OSVR, Ones)
    Method (OSFL, 0, NotSerialized)
    {
        Store (Zero, OSVR) /* \OSVR */
        Return (OSVR) /* \OSVR */
    }

    Method (MCTH, 2, NotSerialized)
    {
        If (LLess (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Add (SizeOf (Arg0), One, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0) /* \MCTH.BUF0 */
        Store (Arg1, BUF1) /* \MCTH.BUF1 */
        While (Local0)
        {
            Decrement (Local0)
            If (LNotEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (
                BUF1, Local0))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        ShiftLeft (SS1, One, Local0)
        Or (Local0, ShiftLeft (SS2, 0x02), Local0)
        Or (Local0, ShiftLeft (SS3, 0x03), Local0)
        Or (Local0, ShiftLeft (SS4, 0x04), Local0)
        If (And (ShiftLeft (One, Arg1), Local0))
        {
            Store (Arg1, Index (PRWP, One))
        }
        Else
        {
            ShiftRight (Local0, One, Local0)
            If (LOr (LEqual (OSFL (), One), LEqual (OSFL (), 0x02)))
            {
                FindSetLeftBit (Local0, Index (PRWP, One))
            }
            Else
            {
                FindSetRightBit (Local0, Index (PRWP, One))
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Name (WAKP, Package (0x02)
    {
        Zero, 
        Zero
    })
    OperationRegion (DEB0, SystemIO, DP80, 0x02)
    Field (DEB0, WordAcc, NoLock, Preserve)
    {
        DBG8,   16
    }

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
        Name (PRSA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,4,5,6,7,10,11,12,14,15}
        })
        Alias (PRSA, PRSB)
        Alias (PRSA, PRSC)
        Alias (PRSA, PRSD)
        Alias (PRSA, PRSE)
        Alias (PRSA, PRSF)
        Alias (PRSA, PRSG)
        Alias (PRSA, PRSH)
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

            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                Return (0x03)
            }

            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Device (P0P2)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR02) /* \_SB_.AR02 */
                }

                Device (GFX0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_SUN, One)  // _SUN: Slot User Number
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (LEqual (Arg2, Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             /* . */
                            })
                        }

                        Return (Package (0x0A)
                        {
                            "@0,connector-type", 
                            Buffer (0x04)
                            {
                                 0x00, 0x08, 0x00, 0x00                           /* .... */
                            }, 

                            "@1,connector-type", 
                            Buffer (0x04)
                            {
                                 0x00, 0x08, 0x00, 0x00                           /* .... */
                            }, 

                            "@2,connector-type", 
                            Buffer (0x04)
                            {
                                 0x00, 0x08, 0x00, 0x00                           /* .... */
                            }, 

                            "@3,connector-type", 
                            Buffer (0x04)
                            {
                                 0x00, 0x08, 0x00, 0x00                           /* .... */
                            }, 

                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-1"
                            }
                        })
                    }
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (LEqual (Arg2, Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             /* . */
                            })
                        }

                        Return (Package (0x02)
                        {
                            "hda-gfx", 
                            Buffer (0x0A)
                            {
                                "onboard-1"
                            }
                        })
                    }
                }
            }

            Device (P0P3)
            {
                Name (_ADR, 0x00060000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR03) /* \_SB_.AR03 */
                }

                Device (ARPT)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (P0P1)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0B, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR01) /* \_SB_.AR01 */
                }

                Device (FRWR)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                }

                Device (LAN1)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (LEqual (Arg2, Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             /* . */
                            })
                        }

                        Return (Package (0x04)
                        {
                            "built-in", 
                            Buffer (One)
                            {
                                 0x01                                             /* . */
                            }, 

                            "location", 
                            Buffer (0x02)
                            {
                                "2"
                            }
                        })
                    }
                }
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Method (SPTS, 1, NotSerialized)
                {
                    Store (One, PS1S) /* \_SB_.PCI0.LPCB.PS1S */
                    Store (One, PS1E) /* \_SB_.PCI0.LPCB.PS1E */
                    Store (One, SLPS) /* \_SB_.SLPS */
                }

                Method (SWAK, 1, NotSerialized)
                {
                    Store (Zero, SLPS) /* \_SB_.SLPS */
                    Store (Zero, PS1E) /* \_SB_.PCI0.LPCB.PS1E */
                    If (LAnd (LEqual (Arg0, One), RTCS)) {}
                    Else
                    {
                        If (LAnd (LEqual (Arg0, 0x03), BRTC)) {}
                        Else
                        {
                            Notify (PWRB, 0x02) // Device Wake
                        }
                    }
                }

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

                Scope (\_SB)
                {
                    Name (SLPS, Zero)
                }

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

                Name (DCAT, Package (0x15)
                {
                    0x02, 
                    0x03, 
                    One, 
                    Zero, 
                    0xFF, 
                    0x07, 
                    0xFF, 
                    0xFF, 
                    0x07, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0xFF, 
                    0x07, 
                    0x08, 
                    0x09, 
                    0xFF, 
                    0xFF
                })
                Mutex (IOCF, 0x00)
                Method (ENFG, 1, NotSerialized)
                {
                    Acquire (IOCF, 0xFFFF)
                    Store (0x87, INDX) /* \_SB_.PCI0.LPCB.INDX */
                    Store (0x87, INDX) /* \_SB_.PCI0.LPCB.INDX */
                    Store (Arg0, LDN) /* \_SB_.PCI0.LPCB.LDN_ */
                }

                Method (EXFG, 0, NotSerialized)
                {
                    Store (0xAA, INDX) /* \_SB_.PCI0.LPCB.INDX */
                    Release (IOCF)
                }

                Method (LPTM, 1, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    And (OPT0, 0x02, Local0)
                    EXFG ()
                    Return (Local0)
                }

                Method (UHID, 1, NotSerialized)
                {
                    If (LEqual (Arg0, One))
                    {
                        ENFG (CGLD (Arg0))
                        And (OPT1, 0x38, Local0)
                        EXFG ()
                        If (Local0)
                        {
                            Return (0x1005D041)
                        }
                    }

                    Return (0x0105D041)
                }

                Method (SIOK, 1, NotSerialized)
                {
                    ENFG (0x0A)
                    If (LGreater (Arg0, One))
                    {
                        Or (CRE4, 0x10, CRE4) /* \_SB_.PCI0.LPCB.CRE4 */
                    }

                    EXFG ()
                }

                Method (SIOS, 1, NotSerialized)
                {
                    SIOK (Arg0)
                }

                Method (SIOW, 1, NotSerialized)
                {
                    SIOK (Zero)
                }

                Method (SIOH, 0, NotSerialized)
                {
                    ENFG (0x0A)
                    If (And (OPT3, 0x10)) {}
                    EXFG ()
                    SIOK (Zero)
                }

                OperationRegion (IOID, SystemIO, SPIO, 0x02)
                Field (IOID, ByteAcc, NoLock, Preserve)
                {
                    INDX,   8, 
                    DATA,   8
                }

                IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x07), 
                    LDN,    8, 
                    Offset (0x22), 
                    FDCP,   1, 
                        ,   2, 
                    LPTP,   1, 
                    URAP,   1, 
                    URBP,   1, 
                    Offset (0x30), 
                    ACTR,   8, 
                    Offset (0x60), 
                    IOAH,   8, 
                    IOAL,   8, 
                    IOH2,   8, 
                    IOL2,   8, 
                    Offset (0x70), 
                    INTR,   4, 
                    Offset (0x74), 
                    DMCH,   3, 
                    Offset (0xE0), 
                    CRE0,   8, 
                    CRE1,   8, 
                    CRE2,   8, 
                    CRE3,   8, 
                    CRE4,   8, 
                    CRE5,   8, 
                    CRE6,   8, 
                    Offset (0xF0), 
                    OPT0,   8, 
                    OPT1,   8, 
                    OPT2,   8, 
                    OPT3,   8, 
                    Offset (0xF5), 
                    OPT5,   8, 
                    OPT6,   8, 
                    Offset (0xF9), 
                    OPT9,   8
                }

                Method (CGLD, 1, NotSerialized)
                {
                    Return (DerefOf (Index (DCAT, Arg0)))
                }

                Method (DSTA, 1, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    Store (ACTR, Local0)
                    EXFG ()
                    If (LEqual (Local0, 0xFF))
                    {
                        Return (Zero)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        ShiftRight (Local0, 0x02, Local0)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        ShiftRight (Local0, One, Local0)
                    }

                    And (Local0, One, Local0)
                    Or (IOST, ShiftLeft (Local0, Arg0), IOST) /* \IOST */
                    If (Local0)
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        If (And (ShiftLeft (One, Arg0), IOST))
                        {
                            Return (0x0D)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Method (DCNT, 2, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    If (LEqual (Arg0, 0x05))
                    {
                        ShiftLeft (IOH2, 0x08, Local1)
                        Or (Local1, IOL2, Local1)
                    }
                    Else
                    {
                        ShiftLeft (IOAH, 0x08, Local1)
                        Or (Local1, IOAL, Local1)
                    }

                    RRIO (Arg0, Arg1, Local1, 0x08)
                    If (LAnd (LLess (DMCH, 0x04), LNotEqual (And (DMCH, 0x03, 
                        Local1), Zero)))
                    {
                        RDMA (Arg0, Arg1, Increment (Local1))
                    }

                    Store (Arg1, Local1)
                    Store (One, Local2)
                    If (LEqual (Arg0, 0x05))
                    {
                        ShiftLeft (Arg1, 0x02, Local1)
                        ShiftLeft (Local2, 0x02, Local2)
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        ShiftLeft (Arg1, One, Local1)
                        ShiftLeft (Local2, One, Local2)
                    }

                    Store (ACTR, Local0)
                    Not (Local2, Local3)
                    And (Local0, Local3, Local0)
                    Or (Local0, Local1, Local0)
                    Store (Local0, ACTR) /* \_SB_.PCI0.LPCB.ACTR */
                    EXFG ()
                }

                Name (CRS1, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {}
                    DMA (Compatibility, NotBusMaster, Transfer8, _Y00)
                        {}
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y01)
                })
                CreateWordField (CRS1, One, IRQM)
                CreateByteField (CRS1, \_SB.PCI0.LPCB._Y00._DMA, DMAM)  // _DMA: Direct Memory Access
                CreateWordField (CRS1, \_SB.PCI0.LPCB._Y01._MIN, IO11)  // _MIN: Minimum Base Address
                CreateWordField (CRS1, \_SB.PCI0.LPCB._Y01._MAX, IO12)  // _MAX: Maximum Base Address
                CreateByteField (CRS1, \_SB.PCI0.LPCB._Y01._LEN, LEN1)  // _LEN: Length
                Name (CRS2, ResourceTemplate ()
                {
                    IRQNoFlags ()
                        {6}
                    DMA (Compatibility, NotBusMaster, Transfer8, _Y02)
                        {2}
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y03)
                    IO (Decode16,
                        0x0000,             // Range Minimum
                        0x0000,             // Range Maximum
                        0x01,               // Alignment
                        0x00,               // Length
                        _Y04)
                })
                CreateWordField (CRS2, One, IRQE)
                CreateByteField (CRS2, \_SB.PCI0.LPCB._Y02._DMA, DMAE)  // _DMA: Direct Memory Access
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y03._MIN, IO21)  // _MIN: Minimum Base Address
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y03._MAX, IO22)  // _MAX: Maximum Base Address
                CreateByteField (CRS2, \_SB.PCI0.LPCB._Y03._LEN, LEN2)  // _LEN: Length
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y04._MIN, IO31)  // _MIN: Minimum Base Address
                CreateWordField (CRS2, \_SB.PCI0.LPCB._Y04._MAX, IO32)  // _MAX: Maximum Base Address
                CreateByteField (CRS2, \_SB.PCI0.LPCB._Y04._LEN, LEN3)  // _LEN: Length
                Method (DCRS, 2, NotSerialized)
                {
                    ENFG (CGLD (Arg0))
                    ShiftLeft (IOAH, 0x08, IO11) /* \_SB_.PCI0.LPCB.IO11 */
                    Or (IO11, IOAL, IO11) /* \_SB_.PCI0.LPCB.IO11 */
                    Store (IO11, IO12) /* \_SB_.PCI0.LPCB.IO12 */
                    Subtract (FindSetRightBit (IO11), One, Local0)
                    ShiftLeft (One, Local0, LEN1) /* \_SB_.PCI0.LPCB.LEN1 */
                    If (INTR)
                    {
                        ShiftLeft (One, INTR, IRQM) /* \_SB_.PCI0.LPCB.IRQM */
                    }
                    Else
                    {
                        Store (Zero, IRQM) /* \_SB_.PCI0.LPCB.IRQM */
                    }

                    If (LOr (LGreater (DMCH, 0x03), LEqual (Arg1, Zero)))
                    {
                        Store (Zero, DMAM) /* \_SB_.PCI0.LPCB.DMAM */
                    }
                    Else
                    {
                        And (DMCH, 0x03, Local1)
                        ShiftLeft (One, Local1, DMAM) /* \_SB_.PCI0.LPCB.DMAM */
                    }

                    EXFG ()
                    Return (CRS1) /* \_SB_.PCI0.LPCB.CRS1 */
                }

                Method (DSRS, 2, NotSerialized)
                {
                    CreateWordField (Arg0, One, IRQM)
                    CreateByteField (Arg0, 0x04, DMAM)
                    CreateWordField (Arg0, 0x08, IO11)
                    ENFG (CGLD (Arg1))
                    And (IO11, 0xFF, IOAL) /* \_SB_.PCI0.LPCB.IOAL */
                    ShiftRight (IO11, 0x08, IOAH) /* \_SB_.PCI0.LPCB.IOAH */
                    If (IRQM)
                    {
                        FindSetRightBit (IRQM, Local0)
                        Subtract (Local0, One, INTR) /* \_SB_.PCI0.LPCB.INTR */
                    }
                    Else
                    {
                        Store (Zero, INTR) /* \_SB_.PCI0.LPCB.INTR */
                    }

                    If (DMAM)
                    {
                        FindSetRightBit (DMAM, Local0)
                        Subtract (Local0, One, DMCH) /* \_SB_.PCI0.LPCB.DMCH */
                    }
                    Else
                    {
                        Store (0x07, DMCH) /* \_SB_.PCI0.LPCB.DMCH */
                    }

                    EXFG ()
                    DCNT (Arg1, One)
                }

                Scope (\)
                {
                    OperationRegion (RAMW, SystemMemory, 0xBFFF0000, 0x00010000)
                    Field (RAMW, ByteAcc, NoLock, Preserve)
                    {
                        PAR0,   32, 
                        PAR1,   32, 
                        PAR2,   32
                    }

                    OperationRegion (IOB2, SystemIO, 0xB2, 0x02)
                    Field (IOB2, ByteAcc, NoLock, Preserve)
                    {
                        SMIC,   8, 
                        SMIS,   8
                    }

                    Method (ISMI, 1, Serialized)
                    {
                        Store (Arg0, SMIC) /* \SMIC */
                    }

                    Method (GNVS, 1, Serialized)
                    {
                        Store (Arg0, PAR0) /* \PAR0 */
                        ISMI (0x70)
                        Return (PAR1) /* \PAR1 */
                    }

                    Method (SNVS, 2, Serialized)
                    {
                        Store (Arg0, PAR0) /* \PAR0 */
                        Store (Arg1, PAR1) /* \PAR1 */
                        ISMI (0x71)
                    }

                    Method (GMAX, 1, Serialized)
                    {
                        Store (Arg0, PAR0) /* \PAR0 */
                        ISMI (0x74)
                        Return (PAR1) /* \PAR1 */
                    }

                    Method (GMDX, 1, Serialized)
                    {
                        Store (Arg0, PAR0) /* \PAR0 */
                        ISMI (0x75)
                        Return (PAR1) /* \PAR1 */
                    }

                    Method (GCAX, 1, Serialized)
                    {
                        Store (Arg0, PAR0) /* \PAR0 */
                        ISMI (0x76)
                        Return (PAR1) /* \PAR1 */
                    }

                    Method (GCDX, 1, Serialized)
                    {
                        Store (Arg0, PAR0) /* \PAR0 */
                        ISMI (0x77)
                        Return (PAR1) /* \PAR1 */
                    }
                }

                Scope (\_SB.PCI0.LPCB)
                {
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                    Name (CRS, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0,8,11}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            )
                    })
                    OperationRegion (^LPCR, SystemMemory, 0xFED1F404, 0x04)
                    Field (LPCR, AnyAcc, NoLock, Preserve)
                    {
                        HPTS,   2, 
                            ,   5, 
                        HPTE,   1, 
                        Offset (0x04)
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (CRS) /* \_SB_.PCI0.LPCB.HPET.CRS_ */
                    }
                }

                OperationRegion (RX80, PCI_Config, Zero, 0xFF)
                Field (RX80, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x80), 
                    LPCD,   16, 
                    LPCE,   16
                }

                Name (DBPT, Package (0x04)
                {
                    Package (0x08)
                    {
                        0x03F8, 
                        0x02F8, 
                        0x0220, 
                        0x0228, 
                        0x0238, 
                        0x02E8, 
                        0x0338, 
                        0x03E8
                    }, 

                    Package (0x08)
                    {
                        0x03F8, 
                        0x02F8, 
                        0x0220, 
                        0x0228, 
                        0x0238, 
                        0x02E8, 
                        0x0338, 
                        0x03E8
                    }, 

                    Package (0x03)
                    {
                        0x0378, 
                        0x0278, 
                        0x03BC
                    }, 

                    Package (0x02)
                    {
                        0x03F0, 
                        0x0370
                    }
                })
                Name (DDLT, Package (0x04)
                {
                    Package (0x02)
                    {
                        Zero, 
                        0xFFF8
                    }, 

                    Package (0x02)
                    {
                        0x04, 
                        0xFF8F
                    }, 

                    Package (0x02)
                    {
                        0x08, 
                        0xFCFF
                    }, 

                    Package (0x02)
                    {
                        0x0C, 
                        0xEFFF
                    }
                })
                Method (RRIO, 4, NotSerialized)
                {
                    If (LAnd (LLessEqual (Arg0, 0x03), LGreaterEqual (Arg0, Zero)))
                    {
                        Store (Match (DerefOf (Index (DBPT, Arg0)), MEQ, Arg2, MTR, 
                            Zero, Zero), Local0)
                        If (LNotEqual (Local0, Ones))
                        {
                            Store (DerefOf (Index (DerefOf (Index (DDLT, Arg0)), Zero)), 
                                Local1)
                            Store (DerefOf (Index (DerefOf (Index (DDLT, Arg0)), One)), 
                                Local2)
                            ShiftLeft (Local0, Local1, Local0)
                            And (LPCD, Local2, LPCD) /* \_SB_.PCI0.LPCB.LPCD */
                            Or (LPCD, Local0, LPCD) /* \_SB_.PCI0.LPCB.LPCD */
                            WX82 (Arg0, Arg1)
                        }
                    }

                    If (LEqual (Arg0, 0x08))
                    {
                        If (LEqual (Arg2, 0x0200))
                        {
                            WX82 (0x08, Arg0)
                        }
                        Else
                        {
                            If (LEqual (Arg2, 0x0208))
                            {
                                WX82 (0x09, Arg0)
                            }
                        }
                    }

                    If (LAnd (LLessEqual (Arg0, 0x0D), LGreaterEqual (Arg0, 0x0A)))
                    {
                        WX82 (Arg0, Arg1)
                    }
                }

                Method (WX82, 2, NotSerialized)
                {
                    ShiftLeft (One, Arg0, Local0)
                    If (Arg1)
                    {
                        Or (LPCE, Local0, LPCE) /* \_SB_.PCI0.LPCB.LPCE */
                    }
                    Else
                    {
                        Not (Local0, Local0)
                        And (LPCE, Local0, LPCE) /* \_SB_.PCI0.LPCB.LPCE */
                    }
                }

                Method (RDMA, 3, NotSerialized)
                {
                }

                OperationRegion (FHR0, PCI_Config, 0xD8, 0x02)
                Field (FHR0, ByteAcc, NoLock, Preserve)
                {
                    FHD1,   4, 
                    Offset (0x01), 
                    FHD0,   8
                }

                Scope (\_SB)
                {
                    Method (CKOS, 0, NotSerialized)
                    {
                        If (_OSI ("Windows 2006"))
                        {
                            If (GNVS (0x177E))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (\_SB)
                {
                    Method (CHHS, 0, NotSerialized)
                    {
                        Return (GNVS (0x87D0))
                    }

                    Method (CLHS, 0, NotSerialized)
                    {
                        SNVS (0x87D0, Zero)
                    }
                }

                Device (UAR1)
                {
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_HID, EisaId ("PNP0501") /* 16550A-compatible COM Serial Port */)  // _HID: Hardware ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (DSTA (Zero))
                    }

                    Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                    {
                        DCNT (Zero, Zero)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Return (DCRS (Zero, Zero))
                    }

                    Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                    {
                        DSRS (Arg0, Zero)
                    }

                    Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                    {
                        Return (CMPR) /* \_SB_.PCI0.LPCB.UAR1.CMPR */
                    }

                    Name (CMPR, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {4}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02F8,             // Range Minimum
                                0x02F8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x03E8,             // Range Minimum
                                0x03E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        StartDependentFnNoPri ()
                        {
                            IO (Decode16,
                                0x02E8,             // Range Minimum
                                0x02E8,             // Range Maximum
                                0x01,               // Alignment
                                0x08,               // Length
                                )
                            IRQNoFlags ()
                                {3,4,5,6,7,10,11,12}
                            DMA (Compatibility, NotBusMaster, Transfer8, )
                                {}
                        }
                        EndDependentFn ()
                    })
                }

                Method (UAR1._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x08, 0x04))
                }

                Method (PS2K._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x1D, 0x04))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x16, 0x29, 0x00, 0x00                           /* .).. */
                        }
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
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (USBE)
            {
                Name (_ADR, 0x001A0007)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0D, 0x04))
                }
            }

            Device (P0P4)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR04) /* \_SB_.AR04 */
                }

                Device (XHCI)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (P0P5)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }
            }

            Device (P0P6)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR06) /* \_SB_.AR06 */
                }
            }

            Device (P0P7)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR07) /* \_SB_.AR07 */
                }
            }

            Device (P0P8)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR08) /* \_SB_.AR08 */
                }
            }

            Device (P0P9)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x09, 0x04))
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (AR09) /* \_SB_.AR09 */
                }

                Device (LAN0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If (LEqual (Arg2, Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             /* . */
                            })
                        }

                        Return (Package (0x04)
                        {
                            "built-in", 
                            Buffer (One)
                            {
                                 0x01                                             /* . */
                            }, 

                            "location", 
                            Buffer (0x02)
                            {
                                "1"
                            }
                        })
                    }
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW) /* \_SB_.PCI0.USB0.USBW */
                    }
                    Else
                    {
                        Store (Zero, USBW) /* \_SB_.PCI0.USB0.USBW */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x03, 0x04))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x34, 0x3A, 0x00, 0x00                           /* 4:.. */
                        }
                    })
                }
            }

            Device (USB1)
            {
                Name (_ADR, 0x001D0001)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW) /* \_SB_.PCI0.USB1.USBW */
                    }
                    Else
                    {
                        Store (Zero, USBW) /* \_SB_.PCI0.USB1.USBW */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x04, 0x04))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x35, 0x3A, 0x00, 0x00                           /* 5:.. */
                        }
                    })
                }
            }

            Device (USB2)
            {
                Name (_ADR, 0x001D0002)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW) /* \_SB_.PCI0.USB2.USBW */
                    }
                    Else
                    {
                        Store (Zero, USBW) /* \_SB_.PCI0.USB2.USBW */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0C, 0x04))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x36, 0x3A, 0x00, 0x00                           /* 6:.. */
                        }
                    })
                }
            }

            Device (USB4)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW) /* \_SB_.PCI0.USB4.USBW */
                    }
                    Else
                    {
                        Store (Zero, USBW) /* \_SB_.PCI0.USB4.USBW */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x0E, 0x04))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x37, 0x3A, 0x00, 0x00                           /* 7:.. */
                        }
                    })
                }
            }

            Device (USB5)
            {
                Name (_ADR, 0x001A0001)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW) /* \_SB_.PCI0.USB5.USBW */
                    }
                    Else
                    {
                        Store (Zero, USBW) /* \_SB_.PCI0.USB5.USBW */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x05, 0x04))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x38, 0x3A, 0x00, 0x00                           /* 8:.. */
                        }
                    })
                }
            }

            Device (USB6)
            {
                Name (_ADR, 0x001A0002)  // _ADR: Address
                OperationRegion (BAR0, PCI_Config, 0xC4, One)
                Field (BAR0, ByteAcc, NoLock, Preserve)
                {
                    USBW,   2, 
                    Offset (0x01)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
                {
                    If (Arg0)
                    {
                        Store (0x03, USBW) /* \_SB_.PCI0.USB6.USBW */
                    }
                    Else
                    {
                        Store (Zero, USBW) /* \_SB_.PCI0.USB6.USBW */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (GPRW (0x20, 0x04))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x39, 0x3A, 0x00, 0x00                           /* 9:.. */
                        }
                    })
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "layout-id", 
                        Buffer (0x04)
                        {
                             0x0C, 0x00, 0x00, 0x00                           /* .... */
                        }
                    })
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, Zero)  // _ADR: Address
//                    Device (DVL0)
//                    {
//                        Name (_ADR, 0x57)  // _ADR: Address
//                        Name (_CID, "diagsvault")  // _CID: Compatible ID
//                    }
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             /* . */
                        })
                    }

                    Return (Package (0x02)
                    {
                        "device-id", 
                        Buffer (0x04)
                        {
                             0x30, 0x3A, 0x00, 0x00                           /* 0:.. */
                        }
                    })
                }
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

            Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                \_SB.PCI0.LPCB.SIOH ()
            }

            Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                \_SB.PCI0.LPCB.SIOH ()
            }

            Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
            {
                Notify (\_SB.PCI0.EUSB, 0x02) // Device Wake
                Notify (\_SB.PCI0.USBE, 0x02) // Device Wake
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

    OperationRegion (GPS0, SystemIO, GPBS, 0x40)
    Field (GPS0, ByteAcc, NoLock, Preserve)
    {
        Offset (0x0C), 
        GPL0,   1, 
        Offset (0x38), 
            ,   4, 
        GPL1,   1
    }

    OperationRegion (_SB.PCI0.LPCB.PIX0, PCI_Config, 0x60, 0x0C)
    Field (\_SB.PCI0.LPCB.PIX0, ByteAcc, NoLock, Preserve)
    {
        PIRA,   8, 
        PIRB,   8, 
        PIRC,   8, 
        PIRD,   8, 
        Offset (0x08), 
        PIRE,   8, 
        PIRF,   8, 
        PIRG,   8, 
        PIRH,   8
    }

    Scope (_SB)
    {
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        CreateWordField (BUFA, One, IRA0)
    }

    Scope (_SB)
    {
        Name (XCPD, Zero)
        Name (XNPT, One)
        Name (XCAP, 0x02)
        Name (XDCP, 0x04)
        Name (XDCT, 0x08)
        Name (XDST, 0x0A)
        Name (XLCP, 0x0C)
        Name (XLCT, 0x10)
        Name (XLST, 0x12)
        Name (XSCP, 0x14)
        Name (XSCT, 0x18)
        Name (XSST, 0x1A)
        Name (XRCT, 0x1C)
        Mutex (MUTE, 0x00)
        Method (RBPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Release (MUTE)
            Return (XCFG) /* \_SB_.RBPE.XCFG */
        }

        Method (RWPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Release (MUTE)
            Return (XCFG) /* \_SB_.RWPE.XCFG */
        }

        Method (RDPE, 1, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Release (MUTE)
            Return (XCFG) /* \_SB_.RDPE.XCFG */
        }

        Method (WBPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, One)
            Field (PCFG, ByteAcc, NoLock, Preserve)
            {
                XCFG,   8
            }

            Store (Arg1, XCFG) /* \_SB_.WBPE.XCFG */
            Release (MUTE)
        }

        Method (WWPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFE, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x02)
            Field (PCFG, WordAcc, NoLock, Preserve)
            {
                XCFG,   16
            }

            Store (Arg1, XCFG) /* \_SB_.WWPE.XCFG */
            Release (MUTE)
        }

        Method (WDPE, 2, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            Store (Arg1, XCFG) /* \_SB_.WDPE.XCFG */
            Release (MUTE)
        }

        Method (RWDP, 3, NotSerialized)
        {
            Acquire (MUTE, 0xFFFF)
            And (Arg0, 0xFFFFFFFC, Arg0)
            Add (Arg0, PCIB, Local0)
            OperationRegion (PCFG, SystemMemory, Local0, 0x04)
            Field (PCFG, DWordAcc, NoLock, Preserve)
            {
                XCFG,   32
            }

            And (XCFG, Arg2, Local1)
            Or (Local1, Arg1, XCFG) /* \_SB_.RWDP.XCFG */
            Release (MUTE)
        }

        Method (RPME, 1, NotSerialized)
        {
            Add (Arg0, 0x84, Local0)
            Store (RDPE (Local0), Local1)
            If (LEqual (Local1, Ones))
            {
                Return (Zero)
            }
            Else
            {
                If (LAnd (Local1, 0x00010000))
                {
                    WDPE (Local0, And (Local1, 0x00010000))
                    Return (One)
                }

                Return (Zero)
            }
        }
    }

    OperationRegion (SMRG, SystemIO, 0x0400, 0x10)
    Field (SMRG, ByteAcc, NoLock, Preserve)
    {
        HSTS,   8, 
        SSTS,   8, 
        HSTC,   8, 
        HCMD,   8, 
        HADR,   8, 
        HDT0,   8, 
        HDT1,   8, 
        BLKD,   8
    }

    Field (SMRG, ByteAcc, NoLock, Preserve)
    {
        Offset (0x05), 
        HDTW,   16
    }

    Method (SCMD, 4, Serialized)
    {
        Store (0x05, Local0)
        While (Decrement (Local0))
        {
            Store (0xFFFF, Local1)
            While (LAnd (HSTS, Decrement (Local1)))
            {
                Store (0xFE, HSTS) /* \HSTS */
                Stall (0x0A)
            }

            Store (Arg0, HADR) /* \HADR */
            Store (Arg1, HCMD) /* \HCMD */
            Store (Arg2, HDTW) /* \HDTW */
            Store (Arg3, HSTC) /* \HSTC */
            Store (0xFFFF, Local1)
            While (Decrement (Local1))
            {
                If (And (HSTS, 0x0C))
                {
                    Store (One, Local1)
                }

                If (LEqual (And (HSTS, 0x03), 0x02))
                {
                    Return (HDTW) /* \HDTW */
                }

                Stall (0x0A)
            }

            Store (0x42, HSTC) /* \HSTC */
            Store (0xFFFF, Local1)
            While (Decrement (Local1))
            {
                If (And (HSTS, 0x10))
                {
                    Store (One, Local1)
                }

                Stall (0x0A)
            }

            Store (Zero, HSTC) /* \HSTC */
        }

        Return (Ones)
    }

    Method (SBYT, 2, NotSerialized)
    {
        SCMD (Arg0, Arg1, Zero, 0x44)
    }

    Method (WBYT, 3, NotSerialized)
    {
        SCMD (Arg0, Arg1, Arg2, 0x48)
    }

    Method (WWRD, 3, NotSerialized)
    {
        SCMD (Arg0, Arg1, Arg2, 0x4C)
    }

    Method (RSBT, 2, NotSerialized)
    {
        Or (Arg0, One, Arg0)
        Return (And (SCMD (Arg0, Arg1, Zero, 0x44), 0xFF))
    }

    Method (RBYT, 2, NotSerialized)
    {
        Or (Arg0, One, Arg0)
        Return (And (SCMD (Arg0, Arg1, Zero, 0x48), 0xFF))
    }

    Method (RWRD, 2, NotSerialized)
    {
        Or (Arg0, One, Arg0)
        Return (SCMD (Arg0, Arg1, Zero, 0x4C))
    }

    Method (RBLK, 3, NotSerialized)
    {
        Or (Arg0, One, Local0)
        SCMD (Local0, Arg1, Arg2, 0x54)
        Store (HSTC, Local0)
        Store (HDT0, Local0)
        Add (Local0, One, Local7)
        Name (RBUF, Buffer (Local7) {})
        Store (Zero, Local1)
        While (Local0)
        {
            Store (BLKD, Index (RBUF, Local1))
            Decrement (Local0)
            Increment (Local1)
        }

        Return (RBUF) /* \RBLK.RBUF */
    }

    Method (WBLK, 4, NotSerialized)
    {
        Store (HSTC, Local0)
        Store (Zero, Local0)
        While (LLessEqual (Local0, Arg2))
        {
            Store (DerefOf (Index (Arg3, Local0)), BLKD) /* \BLKD */
            Increment (Local0)
        }

        And (Arg0, 0xFE, Local0)
        SCMD (Local0, Arg1, Arg2, 0x54)
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
                    ,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
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
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
            })
            CreateDWordField (CRS, \_SB.PCI0._Y05._MIN, MIN5)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y05._MAX, MAX5)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y05._LEN, LEN5)  // _LEN: Length
            CreateDWordField (CRS, \_SB.PCI0._Y06._MIN, MIN6)  // _MIN: Minimum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y06._MAX, MAX6)  // _MAX: Maximum Base Address
            CreateDWordField (CRS, \_SB.PCI0._Y06._LEN, LEN6)  // _LEN: Length
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Store (MG1L, Local0)
                If (Local0)
                {
                    Store (MG1B, MIN5) /* \_SB_.PCI0.MIN5 */
                    Store (MG1L, LEN5) /* \_SB_.PCI0.LEN5 */
                    Add (MIN5, Decrement (Local0), MAX5) /* \_SB_.PCI0.MAX5 */
                }

                Store (MG2B, MIN6) /* \_SB_.PCI0.MIN6 */
                Store (MG2L, LEN6) /* \_SB_.PCI0.LEN6 */
                Store (MG2L, Local0)
                Add (MIN6, Decrement (Local0), MAX6) /* \_SB_.PCI0.MAX6 */
                Return (CRS) /* \_SB_.PCI0.CRS_ */
            }
        }
    }

    Name (WOTB, Zero)
    Name (WSSB, Zero)
    Name (WAXB, Zero)
    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (LEqual (Arg0, 0x05)) {}
        Else
        {
            Store (Arg0, DBG8) /* \DBG8 */
            PTS (Arg0)
            Store (Zero, Index (WAKP, Zero))
            Store (Zero, Index (WAKP, One))
            If (LAnd (LEqual (Arg0, 0x04), LEqual (OSFL (), 0x02)))
            {
                Sleep (0x0BB8)
            }

            Store (ASSB, WSSB) /* \WSSB */
            Store (AOTB, WOTB) /* \WOTB */
            Store (AAXB, WAXB) /* \WAXB */
            Store (Arg0, ASSB) /* \ASSB */
            Store (OSFL (), AOTB) /* \AOTB */
            Store (Zero, AAXB) /* \AAXB */
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        ShiftLeft (Arg0, 0x04, DBG8) /* \DBG8 */
        WAK (Arg0)
        If (IOWK) {}
        Else
        {
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        If (ASSB)
        {
            Store (WSSB, ASSB) /* \ASSB */
            Store (WOTB, AOTB) /* \AOTB */
            Store (WAXB, AAXB) /* \AAXB */
        }

        If (DerefOf (Index (WAKP, Zero)))
        {
            Store (Zero, Index (WAKP, One))
        }
        Else
        {
            Store (Arg0, Index (WAKP, One))
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
    If (SS1)
    {
        Name (_S1, Package (0x04)  // _S1_: S1 System State
        {
            One, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS3)
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x05, 
            Zero, 
            Zero, 
            Zero
        })
    }

    If (SS4)
    {
        Name (_S4, Package (0x04)  // _S4_: S4 System State
        {
            0x06, 
            Zero, 
            Zero, 
            Zero
        })
    }

    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x07, 
        Zero, 
        Zero, 
        Zero
    })
    Method (PTS, 1, NotSerialized)
    {
        If (Arg0)
        {
            \_SB.PCI0.LPCB.SIOS (Arg0)
            \_SB.PCI0.LPCB.SPTS (Arg0)
        }
    }

    Method (WAK, 1, NotSerialized)
    {
        \_SB.PCI0.LPCB.SIOW (Arg0)
        \_SB.PCI0.LPCB.SWAK (Arg0)
    }
}

