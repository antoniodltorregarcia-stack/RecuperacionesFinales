<#14. Crea un script que cuente el número de archivos .txt existentes en el directorio 
de trabajo del usuario. #>

# Obtener el directorio de trabajo del usuario
$directorio = $HOME

# Obtener solo los archivos .txt
$txtFiles = Get-ChildItem -Path $directorio -File -Filter "*.txt"

Write-Host "Directorio del usuario: $directorio"
Write-Host "Número de archivos .txt: $($txtFiles.Count)"
