<# 10. Crea un script que reciba dos números como parámetros e indique cuál de ellos es 
mayor. #>

$num1 = [double]$args[0]
$num2 = [double]$args[1]

if ($num1 -gt $num2) { # -gt → greater than (mayor que).

    Write-Host "El numero mayor es: $num1"

} 

elseif ($num2 -gt $num1) {

    Write-Host "El numero mayor es: $num2"

}

else {
    
    Write-Host "Los numeros son iguales"

}