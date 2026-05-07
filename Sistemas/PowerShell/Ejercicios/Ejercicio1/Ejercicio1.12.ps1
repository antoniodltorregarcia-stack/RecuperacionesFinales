<# 12. Crea un script que compruebe si el directorio recibido como parámetro existe y, si 
existe:
• Cuente el número de subdirectorios
• Cuente el número de archivos#>

$ruta = $args[0]

# Comprobar si el directorio existe

if (-not (Test-Path -Path $ruta -PathType Container)) {
    Write-Error "El directorio '$ruta' no existe."
    exit 1
}

# Sacamos subdirec y num archiv

$subdirs = Get-ChildItem -Path $ruta -Directory

$archivos = Get-ChildItem -Path $ruta -File

Write-Host "Directorio encontrado: $ruta"

Write-Host " - Número de subdirectorios: $($subdirs.Count)"

Write-Host " - Número de archivos: $($archivos.Count)"