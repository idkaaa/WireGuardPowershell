using module .\IniFile.ps1
using module .\TypeLoader.ps1


$loader = [TypeLoader]::new("./libs/TunnelDll");

$KeyPairType = $loader.LoadDll(".\Keypair.cs");

$KeyPairType | Get-Member






$server_conf = [ConfigFile]::New

$server_conf | Get-Member