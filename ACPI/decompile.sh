#!/bin/bash

mkdir -p Original

# DSDT and accompanying SSDTs must be disassembled together (do not attempt
# to disassemble other ACPI files with the `-da` option):
iasl -da -dl Dump/dsdt.aml Dump/ssdt*.aml

# Skylake and later might not need `-da`
# as they have embedded external opcodes
#iasl -dl Dump/dsdt.aml Dump/ssdt*.aml

mv Dump/*.dsl Original
