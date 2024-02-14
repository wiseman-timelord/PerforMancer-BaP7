# display.ps1

function PrintProgramTitle {
    Write-Host "`n=========================( PerfEventMon )=========================`n"
}

function PrintProgramSeparator {
    Write-Host "---------------------------------------------------------------"
}

# Sets the window title and size, adjusting the console properties
function Set-ConfigureDisplay {
    Write-Host "`nDisplay Configuration.."
	[Console]::ForegroundColor = [ConsoleColor]::White
    [Console]::BackgroundColor = [ConsoleColor]::DarkGray
    Write-Host "..Restarting Display..`n"
	[Console]::Clear()
}

function Show-MainMenu {
    PrintProgramTitle
    Write-Host ""
    Write-Host "                    1. Performance Monitor"
    Write-Host ""
    Write-Host "                    2. Device Information"
    Write-Host ""
    Write-Host "                    3. Recent Events Report"
    Write-Host ""
    PrintProgramSeparator
    $choice = Read-Host "Select, Options = 1-3, Exit = X: "

    switch ($choice) {
        "1" { Show-PerformanceMonitorMenu }
        "2" { Show-DeviceInfoMenu }
        "3" { Show-RecentEventsMenu }
        "X", "x" { script-FinalizationCode; exit }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-MainMenu
        }
    }
}


function Show-PerformanceMonitorMenu {
    Clear-Host
    PrintProgramTitle
    Write-Host "1. Processor Statistics"
    Write-Host "2. Network Statistics"
    PrintProgramSeparator
    $choice = Read-Host "Select, Options = 1-2, Back = B: "

    switch ($choice) {
        "1" { Invoke-CPUStats }
        "2" { Invoke-NETStats }
        "b" { Show-MainMenu }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-PerformanceMonitorMenu
        }
    }
}

function Show-DeviceInfoMenu {
    Clear-Host
    PrintProgramTitle
    Write-Host "Device Information currently under development..."
    PrintProgramSeparator
    Write-Host "B. Back"
    $choice = Read-Host "Select, Option = B: "

    switch ($choice) {
        "B", "b" { Show-MainMenu }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-DeviceInfoMenu
        }
    }
}

function Show-RecentEventsMenu {
    Clear-Host
    PrintProgramTitle
    Write-Host "1. Program Events"
    Write-Host "2. System Events"
    PrintProgramSeparator
    $choice = Read-Host "Select, Options = 1-2, Back = B: "

    switch ($choice) {
        "1" { .\utility.ps1; Get-ApplicationEvents }
        "2" { .\utility.ps1; Get-SystemEvents }
        "b" { Show-MainMenu }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-RecentEventsMenu
        }
    }
}

function Show-RecentEventsMenu {
    Clear-Host
    PrintProgramTitle
    Write-Host "1. Application Events"
    Write-Host "2. System Events"
    PrintProgramSeparator
	Write-Host "Select, Options = 1-2, Back = B:"
    $choice = Read-Host

    switch ($choice) {
        "1" { Get-ApplicationEvents }
        "2" { Get-SystemEvents }
        "x" { Show-MainMenu }
        default {
            Write-Host "Invalid choice. Please try again."
            Start-Sleep -Seconds 2
            Show-RecentEventsMenu
        }
    }
}
