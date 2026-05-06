# APUNTES POWERSHELL 

# Añadiendo este comando a la terminal azul podemos ejecutar comandos sin problema

# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned


#COMANDOS UTILES


# Comandos Write { 


    # Write-Host: Muestra texto en la consola.

    <# Write-Output: General una salida de texto

        # 1> output-script.txt : Esto crea un archivo txt con la información del output

            # Ejemplo: Write-Output "Esto es un mensaje informativo" 1> output-script.txt

    #>

    <# Write-Error: Muestra un texto acompañado de un error
    
        2> error-script.txt
    
            Ejemplo: Write-Error "Esto es un mensaje de error" 2> error-script.txt
    #>


# Get-Date: Obtiene la fecha y hora actual.

# Get-WmiObject: Muestra información de la versión del sistema operativo.

<# $MyInvocation: Objeto que describe cómo se está ejecutando el script

    # .MyCommand.Name : Dentro de el devuelve el nombre del archivo.ps1

        # Ejemplo: Write-Host "Nombre del script: $($MyInvocation.MyCommand.Name)" 
#>

<# $PSCommandPath: Devuelve la ruta completa, incluyendo el nombre del script.

    #Ejemplo: Write-Host "Ruta completa: $PSCommandPath"
#>



#FUNCIONES


# Al crear funciones seguimos el estilo clasico

# Creamos con (function) y su respectivo nombre
# Abrimos {
# Le asignamos unos parametros (param)
# En este caso el parametro es un tipo (String) que se recoge como ($Nombre)
# Escribimos lo que realizara la función (Write-Host) --> Escribir
# Añadimos el texto y el parametro $Nombre
# Cerramos }

# En nuestra hoja de Scripts hacemos la llamada a la funcion (Saludar)
# Dandole un valor al paramentro con (-Nombre) (En la funcion usamos "$" en el script "-")
# En este caso "Tony" (Debe ir entre comillas ya que es un String)
# Ejecutamos, mostrandose en la terminal el resultado de la función



<#

function Saludar {
    param ([String]$Nombre)
    Write-Host "Hola, $Nombre"
}


Saludar -Nombre "Tony"
#>

