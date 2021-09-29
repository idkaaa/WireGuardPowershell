<#
 # CLH 2021/09/29: This data structure stores the configuration
 # information for a WireGuard VPN Server and/or Clients
 #>

 using module .\IniFile.ps1

<#
 # Public or Private key for a WireGuard Interface 
 # ie. A Server Peer or Client Peer
 #>
class Key 
{
    [string] $Value

    [IniKey] ToIniKey()
    {
        $ini = [IniKey]::new

        #TODO

        return $ini;
    }
}

class AllowedIP 
{
    [System.Net.IPAddress] $Address
    [int] $PrefixLength

    [IniKey] ToIniKey()
    {
        $ini = [IniKey]::new

        #TODO

        return $ini
    }
}

class Peer
{
    [Key] $PublicKey
    [Key] $PresharedKey
    [int] $PersistentKeepalive
    [System.Net.IPEndPoint] $Endpoint
    [AllowedIP[]] $AllowedIPs = [AllowedIP[]]::new()

    [IniSection] ToIniSection()
    {
        $ini = [IniSection]::new

        #TODO

        return $ini;
    }
}

class Interface 
{
    [int] $ListenPort = 11337
    [Key] $PrivateKey
    [Key] $PublicKey
    [Boolean] $SaveConfig = $true
    [System.Net.IPAddress[]] $DNSAddresses = [System.Net.IPAddress[]]::new()
    [Peer[]] $Peers = [Peer[]]::new()

    [IniSection] ToIniSection()
    {
        $ini = [IniSection]::new

        #TODO

        return $ini;
    }
}

class ConfigFile 
{
    [string] $Name
    [Interface] $Interface
    [Peer[]] $Peers = [Peer[]]::new()
    
    ConfigFile([string] $name)
    {
        $this.Name = $name;
    }

    [string] GetIniFilePath([string] $destinationFolder)
    {
        return Join-Path $destinationFolder, $this.Name, ".conf";
    }

    [IniFile] ToIniFile()
    {
        $ini = [IniFile]::new
    
        #TODO

        return $ini;
    }
}

