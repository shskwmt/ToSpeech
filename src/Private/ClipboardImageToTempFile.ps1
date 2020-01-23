Function ClipboardImageToTempFile {
    Add-Type -AssemblyName System.Drawing

    $image = Get-Clipboard -Format Image

    If($Null -eq $image) {
        Return ''
    }

    $path = "${env:TEMP}\ClipboardToImage.png"
    $image.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)

    Return $path
}
