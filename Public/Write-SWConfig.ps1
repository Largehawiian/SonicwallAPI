function Write-SWConfig {
    param (
        
    )
    <#
    .SYNOPSIS
    Save Pending configuration on a Sonicwall appliance.

    .DESCRIPTION
    Save Pending configuration on a Sonicwall appliance.

    .EXAMPLE
    Write-SWConfig
    Checks whether there is pending config changes to write, then saves if any are found.
    #>
     begin {
        # Declaring used rest method
        $Method = 'POST'

        # Declaring the base resource
        $BaseResource = 'config/pending'

        # Declaring the content type
        $ContentType = 'application/json'

        # Getting the base URL of our connection
        $SWBaseUrl = $env:SWConnection
    }
    process {
            $PendingCheck = Invoke-RestMethod -Uri "$SWBaseUrl$BaseResource" -Method 'get' -ContentType $ContentType
        if ($NULL -ne $PendingCheck) {
            $Result = Invoke-RestMethod -Uri "$SWBaseUrl$BaseResource" -Method $Method -ContentType $ContentType
        }
        else {
            Write-host -ForegroundColor Green "No Pending Writes Found."
        }
        # Return the result
        return $Result
    }
}