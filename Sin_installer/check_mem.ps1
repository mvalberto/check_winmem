# Pasar argumentos
Param(
    [Parameter(Mandatory=$false)][string]$ok,
    [Parameter(Mandatory=$false)][string]$war
    )

# Definir codigos de salida

$STATE_OK = 0
$STATE_WARNING = 1
$STATE_CRITICAL = 2
$STATE_UNKNOWN = 3



$SysMem = Get-CIMInstance Win32_OperatingSystem
$pctFree = [math]::Round(($SysMem.FreePhysicalMemory/$SysMem.TotalVisibleMemorySize)*100,2)

if ($pctFree -ge $ok) {
$SysMem = Get-CIMInstance Win32_OperatingSystem
"Memoria libre {0:N2} GB de un total de {1:N2} GB " -f   
($SysMem.FreePhysicalMemory/1MB),    
($SysMem.TotalVisibleMemorySize/1MB) | Write-Host
exit $STATE_OK
}
elseif ($pctFree -ge $war ) {
$SysMem = Get-CIMInstance Win32_OperatingSystem
"Memoria libre {0:N2} GB de un total de {1:N2} GB " -f   
($SysMem.FreePhysicalMemory/1MB),    
($SysMem.TotalVisibleMemorySize/1MB) | Write-Host
exit $STATE_WARNING
}
else {
$SysMem = Get-CIMInstance Win32_OperatingSystem
"Memoria libre {0:N2} GB de un total de {1:N2} GB, Optimizando memoria con RAMRush..." -f   
($SysMem.FreePhysicalMemory/1MB),    
($SysMem.TotalVisibleMemorySize/1MB) | Write-Host
start-process "C:\Program Files\NSClient++\scripts\ramrush.bat"
exit $STATE_CRITICAL
}
