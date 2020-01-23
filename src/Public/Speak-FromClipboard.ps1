Function Speak-FromClipboard {
    Param (
        [Parameter()]
        [ValidateSet('English', 'Japanese')]
        [String]$Language = 'English',
        [Parameter()]
        [ValidateRange(0,5)]
        [Int]$Rate = 0
    )

    If($Null -Eq $(Get-Clipboard -Format Image)) {
        $text = Get-Clipboard -Format Text
        Speak-FromText -Text $text -Language $Language -Rate $Rate
    } else {
        $imagePath = ClipboardImageToTempFile
        Speak-FromImage -ImagePath $imagePath -Language $Language -Rate $Rate
    }
}
