# Muestra un mensaje de Bienvenida

Write-Host "Bienvenido a PowerShell"

# Mostramos Fecha y Hora

Write-Host "Fecha y Hora actual:" (Get-Date)

# Mostramos información del sistema operativo

Write-Host "Sistema operativo:" (Get-WmiObject Win32_OperatingSystem).Caption