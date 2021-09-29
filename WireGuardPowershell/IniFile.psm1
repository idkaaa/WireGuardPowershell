<#
# CLH 2021/09/29: Serialize/Deserialze to/from an INI file format
 # https://github.com/lipkau/PsIni
 #>

# Import the PsIni module.
# If necessary, install it first, for the current user.
$ErrorActionPreference = 'Stop' # Abort, if something unexpectedly goes wrong.
try {
    Import-Module PsIni
}
catch {
    Install-Module -Scope CurrentUser PsIni
    Import-Module PsIni
}

class IniKey {
    [string] $comments
    [string] $name
}

class IniSection {
    [string] $comments
    [string] $name
    [IniKey[]] $Keys = [IniKey[]]::new
}

class IniFile {
    [string] $FileName
    [string] $FolderPath
    [IniSection[]] $Sections = [IniSection[]]::new
}
