<# Bloque 3: Parámetros y entrada de datos

5. Crea un script que reciba tres números como parámetros y muestre su suma.

6. Crea un script que reciba un número indeterminado de parámetros y calcule la suma 
total.

7. Modifica el script anterior para que los números se soliciten interactivamente al 
usuario, hasta que este indique que desea finalizar la introducción de datos. #>

#7

#creamos el parametro con el valor 0

$suma = 0

#Creamos la accion de continuar escriba s

$continuar = "s"

#Bucle while que se ejecuta mientras se escriba s

while ($continuar -eq "s") {

    $entrada = Read-Host "Introduce un número"
    $num = [int]$entrada

    $suma += $num 

    $continuar = Read-Host "¿Quieres introducir otro número? (s/n)"
}

#Salida de texto llamando al resultado del bucle

Write-Output "La suma total es: $suma"