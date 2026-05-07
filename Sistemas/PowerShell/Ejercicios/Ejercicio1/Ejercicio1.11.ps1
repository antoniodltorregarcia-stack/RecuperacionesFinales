<# 11. Crea un script que compruebe si el archivo recibido como parámetro existe y 
muestre su tamaño y fecha de modificación si existe. #>

$ruta = $args[0]

#Comprobamos si existe

if (-not (Test-Path -Path $ruta -PathType Leaf) ) { #Test-Path -PathType Leaf → comprueba que existe y es un archivo, no un directorio.
    Write-Error "El archivo `$ruta` no existe "
    exit 1
}

# Obtener información del archivo
$info = Get-Item $ruta #Get-Item → obtiene toda la información del archivo.

Write-Host "Archivo encontrado:"
Write-Host " - Tamaño: $($info.Length) bytes" 
Write-Host " - Última modificación: $($info.LastWriteTime)" #fecha de última modificación.