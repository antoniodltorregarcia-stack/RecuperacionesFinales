function Crear-Usuario {
    Clear-Host
    Write-Host "=== CREAR USUARIO LOCAL (universal) ==="

    $nombre = Read-Host "Introduce el nombre del usuario"

    if ([string]::IsNullOrWhiteSpace($nombre)) {
        Write-Host "El nombre no puede estar vacío."
        return
    }

    # Comprobar si el usuario existe
    $resultado = Start-Process -FilePath "net" -ArgumentList "user $nombre" -NoNewWindow -PassThru -Wait -RedirectStandardOutput "$env:TEMP\salida.txt" -RedirectStandardError "$env:TEMP\error.txt"

    if ($resultado.ExitCode -eq 0) {
        Write-Host "El usuario ya existe."
    } else {
        # Crear usuario
        Start-Process -FilePath "net" -ArgumentList "user $nombre /add" -NoNewWindow -Wait
        Write-Host "Usuario creado correctamente."
    }

    # Preguntar si habilitar o deshabilitar
    $accion = Read-Host "¿Quieres habilitarlo o deshabilitarlo? (h/d)"

    switch ($accion) {
        "h" {
            Start-Process -FilePath "net" -ArgumentList "user $nombre /active:yes" -NoNewWindow -Wait
            Write-Host "Usuario habilitado."
        }
        "d" {
            Start-Process -FilePath "net" -ArgumentList "user $nombre /active:no" -NoNewWindow -Wait
            Write-Host "Usuario deshabilitado."
        }
        default {
            Write-Host "Opción no válida."
        }
    }
}




while ($true) {

    Clear-Host
    Write-Host "===== MENÚ PRINCIPAL ====="
    Write-Host "1) Crear un usuario local"
    Write-Host "2) Crear un grupo local"
    Write-Host "3) Mostrar permisos de una ruta"
    Write-Host "4) Buscar procesos por nombre"
    Write-Host "5) Controlar Servicio"
    Write-Host "6) Salir"
    Write-Host "=========================="

    $opcion = Read-Host "Eligen una opción" 

    switch ($opcion) {

        "1" { Crear-Usuario }
        "2" { Crear-Grupo }
        "3" { Mostrar-Permisos }
        "4" { Buscar-Proceso }
        "5" { Controlador-Servicio }
        "6" { break }
        default {
            Write-Host "Opción no valida"
            Start-Sleep 1
        }
    }
}