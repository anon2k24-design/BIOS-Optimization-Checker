# BIOS Optimization Checker

A hardware-aware BIOS/UEFI recommendation tool for gamers and PC builders.

## What it does

- Detects your CPU, RAM, and GPU.
- Suggests BIOS settings that may improve gaming performance.
- Helps you check common performance options before making changes.
- Saves a readable recommendations file for later reference.

## Common recommendations

- Enable XMP/EXPO for rated RAM speed.
- Enable Resizable BAR if your hardware supports it.
- Check Above 4G Decoding.
- Confirm the correct PCIe generation is selected.
- Review fan curves and power settings.
- Disable unused onboard devices if you do not need them.

## How to use

Run PowerShell as Administrator:

```powershell
.\bios-optimizer.ps1
```

Then review the generated recommendations file.

## Important

- BIOS changes can affect stability.
- Test one change at a time.
- Save a backup of your current BIOS settings first.
- Restore defaults if something becomes unstable.

## Support the project

If this tool helps you tune your system, please consider sponsoring the project.

[![Sponsor](https://img.shields.io/badge/Sponsor-GitHub-181717?logo=github)](https://github.com/sponsors/anon2k24-design)

Your support helps me keep improving the tool, testing it on more hardware, and adding better BIOS guidance for the gaming community.
