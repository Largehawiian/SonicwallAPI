function Set-SWGeoIP {
    <#
    .SYNOPSIS
    Retrieve DNS configuration from SonicWall appliance.

    .DESCRIPTION
    This function gets DNS configuration from a SonicWall appliance.

    .EXAMPLE
    Get-SWDns
    Gets the SonicWall appliance DNS configuration.
    #>
    [CmdletBinding()]
    param (

    )
    begin {
    $GeoIPCountries = @(
"United Arab Emirates",
"Afghanistan",
"Albania",
"Armenia",
"Azerbaijan",
"Bosnia and Herzegovina",
"Bangladesh",
"Bulgaria",
"Bahrain",
"Burundi",
"Benin",
"Brunei Darussalam",
"Brazil",
"Bhutan",
"Botswana",
"Belarus",
"Congo, The Democratic Republic of the",
"Central African Republic",
"Congo",
"Cameroon",
"China",
"Colombia",
"Cyprus",
"Djibouti",
"Algeria",
"Egypt",
"Eritrea",
"Ethiopia",
"Gabon",
"Ghana",
"Gambia",
"Hungary",
"Indonesia",
"Iraq",
"Iran, Islamic Republic of",
"Jordan",
"Kenya",
"Kyrgyzstan",
"Korea, Democratic People's Republic of",
"Kuwait",
"Kazakhstan",
"Lao People's Democratic Republic",
"Lebanon",
"Libyan Arab Jamahiriya",
"Morocco",
"Mali",
"Mongolia",
"Mauritius",
"Malawi",
"Malaysia",
"Mozambique",
"Namibia",
"Niger",
"Nigeria",
"Oman",
"Philippines",
"Pakistan",
"Palestinian Territory",
"Qatar",
"Romania",
"Serbia",
"Russian Federation",
"Rwanda",
"Saudi Arabia",
"Sudan",
"Slovenia",
"Slovakia",
"Senegal",
"Somalia",
"Syrian Arab Republic",
"Swaziland",
"Chad",
"Tajikistan",
"Turkmenistan",
"Turkey",
"Taiwan",
"Ukraine",
"Uzbekistan",
"Vietnam",
"Yemen",
"Zambia",
"Zimbabwe"
    )
    }
    process {
      $ExpectedConfig.GeoIP = $GeoIPCountries 
    }
}