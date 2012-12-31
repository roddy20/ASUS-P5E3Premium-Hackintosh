# ASUS-P5E3Premium-Hackintosh

Hackintosh for [P5E3 Premium/WiFi-AP @n](http://www.asus.com/Motherboards/Intel_Socket_775/P5E3_PremiumWiFiAP_n/) motherboard.

Intel X48 chipset.

Intel Core 2 Extreme / Core 2 Quad / Core 2 Duo / Pentium Extreme / Pentium D / Pentium 4 Processors (LGA775 socket).

Onboard devices:

- Ralink RT2770F wireless USB adapter
- JMicron JMB363 ATA-133/SATA-3.0GB/s PCI-E controller
- LSI (Formerly Agere) L-FW3227 PCI IEEE-1394 FireWire controller
- Realtek RTL-8110SC PCI to Gigabit Ethernet controller
- Marvell 88E8056-NNC1 PCI-Express to Gigabit Ethernet controller
- Analog Devices AD1988B HD audio chipset

## BIOS settings

Latest BIOS: version [0803 (2009/06/22 update)](http://www.asus.com/Motherboards/Intel_Socket_775/P5E3_PremiumWiFiAP_n/#download)

- Main / SATA Configuration / Configure SATA as - **AHCI**
- Advanced / J-Micron eSATA/PATA Controller / Controller Mode - **AHCI** (needed only if you use legacy IDE drives)
- Power / Suspend Mode - **S3 only**
- Power / ACPI 2.0 Support - **Enabled**
- Power / ACPI APIC Support - **Enabled**

Sources:

- [Asus P5E DSDT fixes](http://www.insanelymac.com/forum/index.php?showtopic=199816)
- [Asus P5E3 "Vanilla" Mac OS X version 10.6](http://www.insanelymac.com/forum/index.php?showtopic=182580)
- [Optimal BIOS Configuration](http://lnx2mac.blogspot.com/2010/07/optimal-bios-configuration.html)
- [Hackintosh with motherboard ASUS P7P55D](http://flying-dog.blogspot.com/2011/04/hackintosh-part-2-build-and-install.html)

## DSDT

The DSDT patches should also work for most of ASUS P5E* motherboards.

Inside a Terminal:

```
curl -OL https://github.com/tkrotoff/ASUS-P5E3Premium-Hackintosh/archive/master.zip
unzip master.zip
cd ASUS-P5E3Premium-Hackintosh-master
./concat_dsdt_patches.rb
```

This generates file `all_dsdt_patches.txt`.

Install [DSDT Editor](http://www.insanelymac.com/forum/topic/223205-dsdt-editor-and-patcher/) then:

- Extract DSDT
- Apply `all_dsdt_patches.txt` patch
- IASL Compile + fix errors
- Save AML as *.aml on the desktop for MultiBeast or directly to `/Extra/DSDT.aml`

Under Snow Leopard, sleep and wake should work.
Not tested under Lion.
Under Mountain Lion, wake is slow: [I need some help on this](https://github.com/tkrotoff/ASUS-P5E3Premium-Hackintosh/issues/1).

Sources:

- [Asus P5E DSDT fixes](http://www.insanelymac.com/forum/index.php?showtopic=199816)
- [DSDT editor and patcher](http://www.insanelymac.com/forum/topic/223205-dsdt-editor-and-patcher/)
- [DSDT patching 101](http://olarila.com/forum/viewtopic.php?f=19&t=634)
- [DSDT patches by motherboard](http://olarila.com/forum/packs.php)
- [Asus P5E3 "Vanilla" Mac OS X version 10.6](http://www.insanelymac.com/forum/topic/182580-asus-p5e3-vanilla-mac-os-x-version-106/)

## MultiBeast

Check:

- UserDSDT or DSDT-Free Installation
- VoodooHDA 0.2.7.3
- Realtek - AppleRTL8169Ethernet
- TRIM Enabler (if you own a SSD disk)
- GraphicsEnabler=No (if you own a natively supported GPU like the Nvidia GeForce GT 640)
