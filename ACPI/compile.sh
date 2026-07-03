#!/bin/bash

iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-EC.aml SSDT-EC.dsl
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-RTC.aml SSDT-RTC.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-XOSI.aml SSDT-XOSI.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-HPET.aml SSDT-HPET.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-PNLF.aml SSDT-PNLF.dsl
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-GPRW.aml SSDT-GPRW.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-UPRW.aml SSDT-UPRW.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-LANC.aml SSDT-LANC.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-dGPU-OFF.aml SSDT-dGPU-OFF.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-dGPU-OFF2.aml SSDT-dGPU-OFF2.dsl
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-USB-APPLE.aml SSDT-USB-APPLE.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-PM.aml SSDT-PM.dsl

cd RehabMan

# RehabMan's battery and fan patches
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-BATT.aml SSDT-BATT.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-KBFN.aml SSDT-KBFN.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-FANREAD.aml SSDT-FANREAD.dsl
iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-FANORIG.aml SSDT-FANORIG.dsl
iasl -D QUIET -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-FANQ.aml SSDT-FANQ.dsl
iasl -D REHABMAN -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-FANRM.aml SSDT-FANQ.dsl
iasl -D GRAPPLER -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-FANGRAP.aml SSDT-FANQ.dsl
iasl -D UBIHAZARD -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-FANUBI.aml SSDT-FANQ.dsl

# RDSS method patches (RDSS is not found in ProBook 4x30s/4x40s BIOS)
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-RP01_PEGP_RDSS.aml SSDT-RP01_PEGP_RDSS.dsl
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-RP01_PXSX_RDSS.aml SSDT-RP01_PXSX_RDSS.dsl
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-RP05_DGFX_RDSS.aml SSDT-RP05_DGFX_RDSS.dsl
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-RP05_PEGP_RDSS.aml SSDT-RP05_PEGP_RDSS.dsl
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-RP05_PXSX_RDSS.aml SSDT-RP05_PXSX_RDSS.dsl

cd ..

# toleda's non-native Broadcom BCM94352HMB AirPort support
#iasl -vw 2095 -vw 2146 -vw 2089 -vw 4089 -vi -vr -p SSDT-ARPT-4352.aml SSDT-ARPT-4352.dsl
