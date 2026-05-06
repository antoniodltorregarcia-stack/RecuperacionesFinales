<# Bloque 3: Parámetros y entrada de datos

5. Crea un script que reciba tres números como parámetros y muestre su suma.

6. Crea un script que reciba un número indeterminado de parámetros y calcule la suma 
total.

7. Modifica el script anterior para que los números se soliciten interactivamente al 
usuario, hasta que este indique que desea finalizar la introducción de datos. #>

#5

#Guardamos los parametros en variables

$num1 = 1
$num2 = 2
$num3 = 3

#Calculamos la suma

$suma = $num1 + $num2 + $num3

#Mostramos el resultado

Write-Output "Resultado: $suma"
