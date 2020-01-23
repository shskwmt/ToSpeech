#Dot source the files
ForEach($FolderItem In 'Private','Public') {
    $ImportItemList = Get-ChildItem -Path $PSScriptRoot\$FolderItem\*.ps1 -ErrorAction SilentlyContinue
    ForEach($ImportItem In $ImportItemList) {
        Try {
            . $ImportItem
        }
        Catch {
            Throw "Failed to import function $($ImportItem.fullname): $_"
        }
    }
    If ($FolderItem -Eq 'Public') {
        #Export the public functions. This requires them to match the standard Noun-Verb powershell cmdlet format as a safety mechanism
        $Functions = $ImportItemList.basename | Where-Object { $_ -Match '^\w+-\w+$' }
        Export-ModuleMember -Function $Functions
    }
}
