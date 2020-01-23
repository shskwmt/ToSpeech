using namespace Windows.Storage
using namespace Windows.Graphics.Imaging

Function ImageToText {
    Param (
        [Parameter(Mandatory, ValueFromPipelineByPropertyName=$True, Position=0)]
        [String]$ImagePath,
        [Parameter(Position=1)]
        [ValidateSet('English', 'Japanese')]
        [String]$Language = 'English'
    )


    Add-Type -AssemblyName System.Runtime.WindowsRuntime

    $null = [Windows.Storage.StorageFile,                Windows.Storage,         ContentType = WindowsRuntime]
    $null = [Windows.Media.Ocr.OcrEngine,                Windows.Foundation,      ContentType = WindowsRuntime]
    $null = [Windows.Foundation.IAsyncOperation`1,       Windows.Foundation,      ContentType = WindowsRuntime]
    $null = [Windows.Graphics.Imaging.SoftwareBitmap,    Windows.Foundation,      ContentType = WindowsRuntime]
    $null = [Windows.Storage.Streams.RandomAccessStream, Windows.Storage.Streams, ContentType = WindowsRuntime]
    $null = [Windows.Globalization.Language,             Windows.Globalization,   ContentType = WindowsRuntime]

    $langName = 'en'
    If ('Japanese' -eq $Language) { $langName = 'ja' }
    $lanObject = New-Object Windows.Globalization.Language($langName)
    $ocrEngine = [Windows.Media.Ocr.OcrEngine]::TryCreateFromLanguage($lanObject)

    $getAwaiterBaseMethod = [WindowsRuntimeSystemExtensions].GetMember('GetAwaiter').
                        Where({
                                $PSItem.GetParameters()[0].ParameterType.Name -eq 'IAsyncOperation`1'
                            }, 'First')[0]

    $path = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($ImagePath)

    $params = @{
        AsyncTask  = [StorageFile]::GetFileFromPathAsync($path)
        ResultType = [StorageFile]
    }
    $storageFile = Await @params

    $params = @{
        AsyncTask  = $storageFile.OpenAsync([FileAccessMode]::Read)
        ResultType = [Streams.IRandomAccessStream]
    }
    $fileStream = Await @params

    $params = @{
        AsyncTask  = [BitmapDecoder]::CreateAsync($fileStream)
        ResultType = [BitmapDecoder]
    }
    $bitmapDecoder = Await @params

    $params = @{
        AsyncTask = $bitmapDecoder.GetSoftwareBitmapAsync()
        ResultType = [SoftwareBitmap]
    }
    $softwareBitmap = Await @params

    # Run the OCR
    $result = Await $ocrEngine.RecognizeAsync($softwareBitmap) ([Windows.Media.Ocr.OcrResult])
    If($Null -eq $result.text) { Return '' }
    Return $result.text
}
