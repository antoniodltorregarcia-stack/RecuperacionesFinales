<# Bloque 1: Introducción a scripts y entorno PowerShell

1. Crea un script que muestre:

• El nombre del script

• La ruta completa desde la que se está ejecutando

2. Explica qué restricción de seguridad impide ejecutar scripts por defecto en Windows y 
qué comando permite consultar la política de ejecución activa

#>

#1

Write-Host "Nombre del Script: $($MyInvocation.MyCommand.Name)"

Write-Host "Ruta completa: $PSCommandPath"

#2

# Añadiendo este comando a la terminal azul podemos ejecutar comandos sin problema

# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned


