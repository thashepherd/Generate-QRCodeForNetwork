Import-Module QRCodeGenerator

function Main
{
    $networkSSID = Get-CurrentSSID
    $useCurrentNetwork = Read-Host -Prompt "Generate QR code for current network (y/n)?"

    if ($useCurrentNetwork -ieq 'y')
    {
        $networkSSID = Get-CurrentSSID
        New-QRCodeWifiAccess -SSID $networkSSID -Password (Get-NetworkPassword $networkSSID) -Width 10 -Show
    } else {
        $networkSSID = Read-Host -Prompt "Enter the network SSID you'd like to generate a QR code for"
        $networkPassword = Read-Host -Prompt "Enter the network password"
        New-QRCodeWifiAccess -SSID $networkSSID -Password $networkPassword -Width 10 -Show
    }
}

function Get-CurrentSSID
{
    [OutputType([String])]
    param ()
    (netsh wlan show interfaces | select-string SSID -Raw | Select-Object -First 1).split(':')[1].trim()
}

function Get-NetworkPassword
{
    [OutputType([String])]
    param (
        [Parameter(Mandatory=$true)]
        [string] $NetworkSSID
    )
    $networkProfile = netsh wlan show profile $NetworkSSID key=clear | Select-String 'Key Content' -Raw | Select-Object -First 1
    if (-Not $networkProfile)
    {
        throw "$NetworkSSID not found"
    }
    $networkProfile.Split(':')[1].trim()
}

Main