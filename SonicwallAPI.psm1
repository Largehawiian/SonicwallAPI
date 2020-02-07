# Importing public and private functions
$Bob ="C:\Program Files\WindowsPowerShell\Modules\PSSonicWall\1.0"
$PublicFunc = @(Get-ChildItem -Path $Bob\Public\*.ps1 -ErrorAction SilentlyContinue)
$PrivateFunc = @(Get-ChildItem -Path $Bob\Private\*.ps1 -ErrorAction SilentlyContinue)

# Dotsourcing files
ForEach ($import in @($PublicFunc + $PrivateFunc)) {
    Try {
        . $import.fullname
    }
    Catch {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Exporting just the Public functions
Export-ModuleMember -Function $PublicFunc.BaseName