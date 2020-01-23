Function Speak-FromText {
    Param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName=$True, Position=0)]
        [String]$Text,
        [Parameter(Position=1)]
        [ValidateSet('English', 'Japanese')]
        [String]$Language = 'English',
        [Parameter()]
        [ValidateRange(0,5)]
        [Int]$Rate = 0
    )
    Process {
        Add-Type -AssemblyName System.speech

        $voice = 'Microsoft David Desktop'
        If ($Language -eq 'Japanese') { $voice = 'Microsoft Haruka Desktop' }

        $s = New-Object System.Speech.Synthesis.SpeechSynthesizer
        $s.Rate = $Rate
        $s.SelectVoice($voice)
        Write-Host $Text
        $s.Speak($Text)
    }
}
