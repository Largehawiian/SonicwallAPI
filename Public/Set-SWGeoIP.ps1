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
        # Testing if a connection to SonicWall exists
       # Test-SWConnection

        # Declaring used rest method
        $Method = 'put'

        # Declaring the base resource
        $BaseResource = 'geo-ip/countries'

        # Declaring the content type
        $ContentType = 'application/json'

        # Getting the base URL of our connection
        $SWBaseUrl = $env:SWConnection

        #Json Body
        $json = @"
          {
            "geo_ip": {
              "block": {
                "country": [
                  {
                    "name": "$($Country)"
                  }
                ]
              }
            }
          }
"@
    }
    process {
        
        $Resource = $BaseResource
        $Result = (Invoke-RestMethod -Uri "$SWBaseUrl$Resource" -Method $Method -ContentType $ContentType -Body $Json)

        # Return the result
        return $Result
    }
}