package vista;

import java.util.Scanner;
import controlador.Controlador;
import modelo.*;

public class Vista {

    private Scanner sc;
    private Controlador controlador;

    public Vista() {
        sc = new Scanner(System.in);
        controlador = Controlador.getInstancia();
    }

    public void iniciar() {
        int opcion = 0;

        do {
            mostrarMenu();
            opcion = Integer.parseInt(sc.nextLine());

            switch (opcion) {
                case 1: addCliente();
                break;
                case 2: addMecanico();
                break;
                case 3: addVehiculo();
                break;
                case 4: crearTrabajo();
                break;
                case 5: listarClientes();
                break;
                case 6: listarTrabajosTerminados();
                break;
                case 7: listarTrabajosNoTerminados();
                break;
                case 8: marcarTerminado();
                break;
                case 9: marcarCobrado();
                break;
                case 0: System.out.println("Saliendo..."); break;
                default: System.out.println("Opción no válida");
            }

        } while (opcion != 0);
    }

    private void mostrarMenu() {
        System.out.println("\n===== MENÚ TALLER =====");
        System.out.println("1. Añadir cliente");
        System.out.println("2. Añadir mecánico");
        System.out.println("3. Añadir vehículo");
        System.out.println("4. Crear trabajo");
        System.out.println("5. Listar clientes ordenados");
        System.out.println("6. Listar trabajos terminados");
        System.out.println("7. Listar trabajos no terminados");
        System.out.println("8. Marcar trabajo como terminado");
        System.out.println("9. Marcar trabajo como cobrado");
        System.out.println("0. Salir");
        System.out.print("Elige una opción: ");
    }
    
    private void addCliente() {
        System.out.print("DNI: ");
        String dni = sc.nextLine();
    
        System.out.print("Nombre: ");
        String nombre = sc.nextLine();
    
        System.out.print("Apellidos: ");
        String apellidos = sc.nextLine();
    
        System.out.print("Dirección: ");
        String direccion = sc.nextLine();
    
        System.out.print("Teléfono: ");
        String telefono = sc.nextLine();
    
        controlador.addCliente(dni, nombre, apellidos, direccion, telefono);
        System.out.println("Cliente añadido correctamente.");
    }
    
    private void addMecanico() {
        System.out.print("DNI del mecánico: ");
        String dni = sc.nextLine();
    
        System.out.print("Nombre: ");
        String nombre = sc.nextLine();
    
        System.out.print("Apellidos: ");
        String apellidos = sc.nextLine();
    
        System.out.print("Email: ");
        String email = sc.nextLine();
    
        System.out.print("Teléfono: ");
        String telefono = sc.nextLine();
    
        System.out.print("Año de llegada: ");
        int anioLlegada = Integer.parseInt(sc.nextLine());
    
        controlador.addMecanico(dni, nombre, apellidos, email, telefono, anioLlegada);
    
        System.out.println("Mecánico añadido.");
    }


    private void addVehiculo() {
        System.out.println("Tipo de vehículo:");
        System.out.println("1. Motocicleta");
        System.out.println("2. Turismo");
        System.out.println("3. Furgón");
        int tipo = Integer.parseInt(sc.nextLine());
    
        System.out.print("Matrícula: ");
        String matricula = sc.nextLine();
    
        System.out.print("Año de fabricación: ");
        int anio = Integer.parseInt(sc.nextLine());
    
        System.out.print("Descripción del modelo: ");
        String desc = sc.nextLine();
    
        Vehiculo v = null;
    
        switch (tipo) {
            case 1: v = new Motocicleta(matricula, anio, desc); break;
            case 2: v = new Turismo(matricula, anio, desc); break;
            case 3: v = new Furgon(matricula, anio, desc); break;
            default: System.out.println("Tipo no válido"); return;
        }
    
        controlador.addVehiculo(v);
        System.out.println("Vehículo añadido.");
    }

    private void crearTrabajo() {
        System.out.print("Descripción del trabajo: ");
        String descripcion = sc.nextLine();
    
        System.out.print("Coste de piezas: ");
        double piezas = Double.parseDouble(sc.nextLine());
    
        System.out.print("Horas de trabajo: ");
        int horas = Integer.parseInt(sc.nextLine());
    
        System.out.print("DNI del mecánico: ");
        String dni = sc.nextLine();
    
        System.out.print("Matrícula del vehículo: ");
        String matricula = sc.nextLine();
    
        controlador.crearTrabajo(descripcion, piezas, horas, dni, matricula);
        System.out.println("Trabajo creado.");
    }

    private void listarClientes() {
        controlador.listarClientesOrdenados();
    }
    
    private void listarTrabajosTerminados() {
        controlador.listarTrabajosTerminados();
    }
    
    private void listarTrabajosNoTerminados() {
        controlador.listarTrabajosNoTerminados();
    }
    
    private void marcarTerminado() {
        System.out.print("Código del trabajo: ");
        String codigo = sc.nextLine();
        controlador.marcarTerminado(codigo);
    }
    
    private void marcarCobrado() {
        System.out.print("Código del trabajo: ");
        String codigo = sc.nextLine();
        controlador.marcarCobrado(codigo);
    }

    
}
