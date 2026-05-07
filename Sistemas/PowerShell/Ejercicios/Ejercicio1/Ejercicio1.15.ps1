<#15. Crea un script que muestre:
• Las extensiones de archivo existentes en un directorio
• El número de archivos correspondientes a cada extensión #>


$ruta = $args[0]

# Comprobar si el directorio existe

if (-not (Test-Path -Path $ruta -PathType Container)) {
    Write-Error "El directorio '$ruta' no existe."
    exit 1
}

#obtener solo archivos

$archivos = Get-ChildItem -Path $ruta -File

# agrupamos

$grupos = $archivos | Group-Object Extension | Sort-Object Name

Write-Host "Extension`tCount"
foreach ($g in $grupos) {
    Write-Host "$($g.Name)`t$($g.Count)"
}