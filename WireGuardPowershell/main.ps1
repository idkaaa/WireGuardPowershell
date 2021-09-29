using module .\IniFile.psm1
using module .\TypeLoader.psm1


$loader = [TypeLoader]::new("./TunnelDll");

$KeyPairType = $loader.LoadDll(".\Keypair.cs");

$KeyPairType | Get-Member






$server_conf = [ConfigFile]::New

$server_conf | Get-Member