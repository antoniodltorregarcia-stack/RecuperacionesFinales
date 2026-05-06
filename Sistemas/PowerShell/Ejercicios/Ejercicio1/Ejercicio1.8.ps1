<# Bloque 4: Gestión básica de archivos

8. Crea un script que muestre solo el nombre de los archivos de un directorio indicado 
como parámetro, sin incluir:

• La ruta
• La extensión
 #>

#8

$directorio = $args[0]

foreach($archivo in Get-ChildItem -Path $directorio -File) {

    Write-Output $archivo.Basename
}

# -Path indica la ruta.
# -File hace que Get-ChildItem devuelva SOLO archivos (no carpetas).

# .BaseName devuelve el nombre del archivo SIN extensión.
# Ejemplo: "foto.jpg" → BaseName = "foto"