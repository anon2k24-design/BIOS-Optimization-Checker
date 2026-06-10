# bios-optimizer.ps1
# BIOS/UEFI Optimization Checker & Recommender
# Analyzes your hardware and suggests optimal BIOS settings

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  🔧 BIOS Optimization Checker v1.0" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Detecting your hardware..." -ForegroundColor Yellow

# Get CPU info
$cpu = Get-WmiObject -Class Win32_Processor
$cpuName = $cpu.Name
$cpuThreads = $cpu.NumberOfLogicalUsers
$cpuCores = $cpu.NumberOfPhysicalPackages

Write-Host ""
Write-Host "CPU: $cpuName" -ForegroundColor White
Write-Host "Threads: $cpuThreads | Cores: $cpuCores" -ForegroundColor Gray

# Get RAM info
$ram = Get-WmiObject -Class Win32_PhysicalMemory
$ramTotal = $ram.Capacity / 1GB / 1GB
$ramSpeed = $ram.Speed

Write-Host ""
Write-Host "RAM: $ramTotal GB @ $ramSpeed MHz" -ForegroundColor White

# Get GPU info
$gpu = Get-WmiObject -Class Win32_VideoController
$gpuName = $gpu.Name

Write-Host "GPU: $gpuName" -ForegroundColor White

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  OPTIMIZATION RECOMMENDATIONS" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# CPU recommendations
Write-Host "[CPU Settings]" -ForegroundColor Yellow
Write-Host "  • Enable XMP/DOCP (RAM overclocking)" -ForegroundColor White
Write-Host "  • Set Power Limit to Maximum (PPT/TDC/ECT)" -ForegroundColor White
Write-Host "  • Enable Precision Boost Overdrive (AMD) or Performance Boost (Intel)" -ForegroundColor White
Write-Host "  • Disable C-States (reduces latency)" -ForegroundColor White
Write-Host "  • Set CPU Core Ratio to Auto or Maximum" -ForegroundColor White

if ($cpuCores -ge 8) {
    Write-Host "  • ✅ Your CPU ($cpuCores cores) supports aggressive overclocking" -ForegroundColor Green
} else {
    Write-Host "  • ⚠️  Conservative overclocking recommended for your CPU" -ForegroundColor Yellow
}

Write-Host ""

# RAM recommendations
Write-Host "[RAM Settings]" -ForegroundColor Yellow
Write-Host "  • Enable XMP/DOCP Profile (check your RAM specs)" -ForegroundColor White
Write-Host "  • Set Memory Clock to Maximum Supported" -ForegroundColor White
Write-Host "  • Enable Memory Context Restore (faster boot)" -ForegroundColor White
Write-Host "  • Set ProcODT to Auto or 43.67Ω (AMD)" -ForegroundColor White

if ($ramSpeed -ge 3200) {
    Write-Host "  • ✅ Your RAM ($ramSpeed MHz) is high-speed" -ForegroundColor Green
} else {
    Write-Host "  • ⚠️  Consider upgrading to 3200MHz+ RAM" -ForegroundColor Yellow
}

Write-Host ""

# GPU recommendations
Write-Host "[GPU Settings]" -ForegroundColor Yellow
Write-Host "  • Enable Above 4G Decoding" -ForegroundColor White
Write-Host "  • Set PCIe Slot to Gen4 (if supported)" -ForegroundColor White
Write-Host "  • Enable Resizable BAR (if supported)" -ForegroundColor White
Write-Host "  • Disable iGPU (if using dedicated GPU)" -ForegroundColor White

Write-Host ""

# Power settings
Write-Host "[Power Settings]" -ForegroundColor Yellow
Write-Host "  • Set Power Mode to Performance" -ForegroundColor White
Write-Host "  • Disable ErP/EuP (better performance)" -ForegroundColor White
Write-Host "  • Set USB Power Delivery to Maximum" -ForegroundColor White
Write-Host "  • Enable ASPM (Auto Power Management)" -ForegroundColor White

Write-Host ""

# Fan settings
Write-Host "[Fan Settings]" -ForegroundColor Yellow
Write-Host "  • Set CPU Fan to Performance Mode" -ForegroundColor White
Write-Host "  • Enable Fan Curve Optimization" -ForegroundColor White
Write-Host "  • Set Minimum Fan Speed to 30% (quiet but cool)" -ForegroundColor White

Write-Host ""

# Networking
Write-Host "[Networking Settings]" -ForegroundColor Yellow
Write-Host "  • Enable PCIe Network Adapter (if using WiFi card)" -ForegroundColor White
Write-Host "  • Set LAN Priority to High" -ForegroundColor White
Write-Host "  • Disable CSM (Compatibility Support Module)" -ForegroundColor White

Write-Host ""

# Export recommendations to file
$recommendations = @"
BIOS Optimization Recommendations
================================
CPU: $cpuName ($cpuCores cores, $cpuThreads threads)
RAM: $ramTotal GB @ $ramSpeed MHz
GPU: $gpuName

RECOMMENDED SETTINGS:

[CPU]
- Enable XMP/DOCP
- Max Power Limit (PPT/TDC/ECT)
- Enable Performance Boost
- Disable C-States
- CPU Core Ratio: Auto/Max

[RAM]
- Enable XMP Profile
- Max Memory Clock
- Memory Context Restore: On
- ProcODT: Auto/43.67Ω

[GPU]
- Above 4G Decoding: On
- PCIe Slot: Gen4
- Resizable BAR: On
- iGPU: Disabled

[Power]
- Power Mode: Performance
- ErP/EuP: Disabled
- USB Power: Maximum
- ASPM: Enabled

[Fans]
- CPU Fan: Performance
- Fan Curve: Optimized
- Min Fan Speed: 30%

[Network]
- PCIe Network: Enabled
- LAN Priority: High
- CSM: Disabled
"@

Set-Content -Path "bios-recommendations.txt" -Value $recommendations
Write-Host ""
Write-Host "✅ Recommendations saved to: bios-recommendations.txt" -ForegroundColor Green

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  HOW TO APPLY THESE SETTINGS" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Restart your computer" -ForegroundColor White
Write-Host "2. Press DEL/F2 during boot to enter BIOS" -ForegroundColor White
Write-Host "3. Navigate to Each Section and apply settings:" -ForegroundColor White
Write-HT   Host "   - Ai Tweaker / OC (CPU/RAM)" -ForegroundColor Gray
Write-Host "   - Advanced > CPU Configuration" -ForegroundColor Gray
Write-Host "   - Advanced > Power Management" -ForegroundColor Gray
Write-Host "   - Advanced > Fan Control" -ForegroundColor Gray
Write-Host "   - Advanced > PCIe/Network" -ForegroundColor Gray
Write-Host "4. Save & Exit (F10)" -ForegroundColor White
Write-Host ""
Write-Host "⚠️  WARNING: Overclocking can damage hardware!" -ForegroundColor Yellow
Write-Host "⚠️  Always test stability after changes!" -ForegroundColor Yellow
Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")