<# 13. Modifica el script anterior para que cuente únicamente los archivos con extensión
.txt #>

$ruta = $args[0]

# Comprobar si el directorio existe

if (-not (Test-Path -Path $ruta -PathType Container)) {
    Write-Error "El directorio '$ruta' no existe."
    exit 1
}

# Sacamos subdirec y num archiv



$archivostxt = Get-ChildItem -Path $ruta -File -Filter "*.txt" #El * significa: “cualquier cosa”

Write-Host "Directorio encontrado: $ruta"

Write-Host " - Número de archivos: $($archivostxt.Count)"