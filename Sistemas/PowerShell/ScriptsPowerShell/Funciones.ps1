#Creación de funciones

function Saludar {
    param ([String]$Nombre)
    Write-Host "Hola, $Nombre"
}

Saludar -Nombre "Tony"