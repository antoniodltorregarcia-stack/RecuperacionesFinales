<#9. Crea un script que compruebe que recibe exactamente dos parámetros y muestre un 
mensaje de error en caso contrario. #>

#Lo hacemos con if

if ($args.Count -ne 2) { # -ne → “not equal”, igual que en Bash.
    
    Write-Error "Error: el script requiere exactamente 2 parametros"
    exit 1  #El 1 es para indicar que es un error
}

Write-Host "Parametros correctos: $($args[0]) y $($args[1])"