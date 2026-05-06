<# Bloque 3: Parámetros y entrada de datos

5. Crea un script que reciba tres números como parámetros y muestre su suma.

6. Crea un script que reciba un número indeterminado de parámetros y calcule la suma 
total.

7. Modifica el script anterior para que los números se soliciten interactivamente al 
usuario, hasta que este indique que desea finalizar la introducción de datos. #>

#6

#Creamos el parametro

$suma = 0

#Bucle foreach para los numeros que nos pida

foreach ($num in $args) {
    $suma += $num
}

#Realizamos el output

Write-Output "Resultado: $suma"