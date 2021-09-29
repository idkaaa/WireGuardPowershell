
<#
 # CLH 2021/09/29: Helper for loading types from external files/DLLs
 #>

class TypeLoader {
    [string]$FolderPath
    [System.Collections.ArrayList]$LoadedAssembliesList = [System.Collections.ArrayList]::new()
    
    TypeLoader([string]$folderPath) {
        $this.FolderPath = $folderPath;
    }

    [object] LoadDll([string]$filename) {
        Push-Location -Path $this.FolderPath;

        $t = Add-Type -Path $filename -PassThru; # returns [System.Runtime]

        $this.LoadedAssembliesList.Add($t);

        Pop-Location

        return $t;
    }

}