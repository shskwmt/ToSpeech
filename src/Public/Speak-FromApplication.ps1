Function Speak-FromApplication {
    Param (
        [Parameter(Mandatory, Position=0)]
        [String]$ProcessName,
        [Parameter()]
        [ValidateSet('English', 'Japanese')]
        [String]$Language = 'English',
        [ValidateRange(0,5)]
        [Int]$Rate = 0
    )

    Add-Type -AssemblyName Microsoft.VisualBasic, System.Windows.Forms

    $targetProcess = Get-Process -Name $ProcessName
    If ($Null -Eq $targetProcess) { Exit }

    While ($True) {
        [Microsoft.VisualBasic.Interaction]::AppActivate($targetProcess.ID)
        Start-Sleep -s 1
        [System.Windows.Forms.SendKeys]::SendWait("%{PRTSC}")
        Start-Sleep -s 1

        Clear-Host
        Speak-FromClipboard -Language $Language -Rate $Rate
        [System.Windows.Forms.Clipboard]::Clear()
        Clear-Host

        $startTime = Get-Date
        $timeOutSeconds = New-TimeSpan -Seconds 5
        $timeOut = $false

        Write-Host 'Hit some keys if you stop this program!'

        While (-Not $host.ui.RawUI.KeyAvailable) {
            $currentTime = Get-Date
            If ($currentTime -Gt $startTime + $timeOutSeconds) {
                $timeOut = $True
                break
            }
        }

        If (-Not $timeOut) { Exit }

        [Microsoft.VisualBasic.Interaction]::AppActivate($targetProcess.ID)
        [System.Windows.Forms.SendKeys]::SendWait("{RIGHT}")
    }
}
