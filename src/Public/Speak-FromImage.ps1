Function Speak-FromImage {
    Param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName=$True, Position=0)]
        [String]$ImagePath,
        [Parameter()]
        [ValidateSet('English', 'Japanese')]
        [String]$Language = 'English',
        [Parameter()]
        [ValidateRange(0,5)]
        [Int]$Rate = 0
    )
    Process {
        $text = ImageToText -ImagePath $ImagePath -Language $Language
        Speak-FromText $text -Language $Language -Rate $Rate
    }
}
