# Public
Function Set-Story ($story) {
    if($story -eq $null) {
        return Get-Story
    }
    
    setEnvVar "CURRENT_STORY" $story    
}

Function Get-Story () {
    return safeGetEnvVar "CURRENT_STORY" "No story"
}

# Private
Function safeGetEnvVar($varName, $default) {
    if (Test-Path "env:$varName") {
        return getEnvVar $varName
    }
    
    return $default
}

Function getEnvVar($varName) {
    return (Get-Item "env:$varName").value
}

Function setEnvVar($name, $value) {
    setLocalEnvVar $name $value
    [Environment]::SetEnvironmentVariable($name, $value, "User")
}

Function setLocalEnvVar($name, $value) {
    New-Item "env:" -Force -name $name -value $value
}

function reloadVariable($varName, $default) {
    $value = ([Environment]::GetEnvironmentVariable($varName, "User"))

    if ($value -eq $null) {
        $value = $default
    }

    setLocalEnvVar $varName $value
}

Set-Alias story Set-Story

reloadVariable "CURRENT_STORY"

Export-ModuleMember -Function Set-Story, Get-Story
Export-ModuleMember -Alias *