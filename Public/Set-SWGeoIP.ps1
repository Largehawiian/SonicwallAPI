function Set-SWGeoIP {
    <#
    .SYNOPSIS
    Set Geo-IP configuration On a SonicWall appliance.

    .DESCRIPTION
    This function sets GeoIP configuration on a SonicWall appliance.

    .EXAMPLE
    Set-SwGeoIP -country "Brazil"
    Gets the SonicWall appliance DNS configuration.
    #>
    [CmdletBinding()]
    param (
        [string]$Country
    )
    begin {
        # Declaring used rest method
        $Method = 'put'

        # Declaring the base resource
        $BaseResource = 'geo-ip'

        # Declaring the content type
        $ContentType = 'application/json'

        # Getting the base URL of our connection
        $SWBaseUrl = $env:SWConnection

        #Json Body
        $json = @{
          geo_ip = @{
              block = @{
                  country = @{
                      name = $Country
                  }
              }
          }
        } | ConvertTo-Json -Depth 4
    }
    process {
        $Result = Invoke-RestMethod -Uri "$SWBaseUrl$BaseResource" -Method $Method -ContentType $ContentType -Body $Json 

        # Return the result
        return $Result
    }
}