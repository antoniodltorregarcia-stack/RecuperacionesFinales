<# Bloque 2: Salida, errores y redirecciones

3. Crea un script que muestre:

• Un mensaje informativo por salida estándar

• Un mensaje de error utilizando los mecanismos propios de PowerShell

4. Modifica el script anterior para que:

• La salida estándar se almacene en un fichero output-script.txt

• Los errores se almacenen en un fichero error-script.txt #>

#3

Write-Output "Esto es un mensaje informativo"

Write-Error "Esto es un mensaje de error"

#4

Write-Output "Esto es un mensaje informativo" 1> output-script.txt

Write-Error "Esto es un mensaje de error" 2> error-script.txt