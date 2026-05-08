package vista;

import java.util.Scanner;
import controlador.Controlador;

public class Vista {

    private static Scanner sc = new Scanner(System.in);
    private static Controlador controlador = Controlador.getInstancia();

    public static void main(String[] args) {

        int opcion;

        do {
            mostrarMenu();
            opcion = leerEntero("Elige una opción: ");

            switch (opcion) {

                case 1:
                    altaCasa();
                    break;

                case 2:
                    altaPiso();
                    break;

                case 3:
                    eliminarInmueble();
                    break;

                case 4:
                    controlador.listarInmuebles();
                    break;

                case 5:
                    controlador.listarCasas();
                    break;

                case 6:
                    controlador.listarPisos();
                    break;

                case 7:
                    altaCliente();
                    break;

                case 8:
                    addFavorito();
                    break;

                case 9:
                    mostrarFavoritos();
                    break;

                case 10:
                    controlador.listarInmueblesPorPrecio();
                    break;

                case 11:
                    controlador.listarCasasPorMetros();
                    break;

                case 12:
                    controlador.listarPisosPorPlanta();
                    break;

                case 0:
                    System.out.println("Saliendo del programa...");
                    break;

                default:
                    System.out.println("Opción no válida.");
            }

            System.out.println();

        } while (opcion != 0);
    }

    // ============================
    //         MÉTODOS MENÚ
    // ============================

    private static void mostrarMenu() {
        System.out.println("====================================");
        System.out.println("         MENÚ INMOBILIARIA");
        System.out.println("====================================");
        System.out.println("1. Alta Casa");
        System.out.println("2. Alta Piso");
        System.out.println("3. Eliminar Inmueble");
        System.out.println("4. Listar Inmuebles");
        System.out.println("5. Listar Casas");
        System.out.println("6. Listar Pisos");
        System.out.println("7. Alta Cliente");
        System.out.println("8. Añadir Favorito");
        System.out.println("9. Mostrar Favoritos");
        System.out.println("10. Listar Inmuebles por Precio");
        System.out.println("11. Listar Casas por Metros");
        System.out.println("12. Listar Pisos por Planta");
        System.out.println("0. Salir");
        System.out.println("====================================");
    }

    private static void altaCasa() {
        System.out.println("=== Alta Casa ===");
        String codigo = leerTexto("Código: ");
        String direccion = leerTexto("Dirección: ");
        double metros = leerDouble("Metros cuadrados: ");
        double precio = leerDouble("Precio: ");
        int plantas = leerEntero("Número de plantas: ");
        boolean jardin = leerBoolean("¿Tiene jardín? (true/false): ");

        controlador.AltaCasa(codigo, direccion, metros, precio, plantas, jardin);
        System.out.println("Casa registrada correctamente.");
    }

    private static void altaPiso() {
        System.out.println("=== Alta Piso ===");
        String codigo = leerTexto("Código: ");
        String direccion = leerTexto("Dirección: ");
        double metros = leerDouble("Metros cuadrados: ");
        double precio = leerDouble("Precio: ");
        int planta = leerEntero("Planta: ");
        boolean ascensor = leerBoolean("¿Tiene ascensor? (true/false): ");

        controlador.altaPiso(codigo, direccion, metros, precio, planta, ascensor);
        System.out.println("Piso registrado correctamente.");
    }

    private static void eliminarInmueble() {
        System.out.println("=== Eliminar Inmueble ===");
        String codigo = leerTexto("Código del inmueble: ");

        if (controlador.eliminarInmueble(codigo)) {
            System.out.println("Inmueble eliminado.");
        } else {
            System.out.println("No existe un inmueble con ese código.");
        }
    }

    private static void altaCliente() {
        System.out.println("=== Alta Cliente ===");
        String dni = leerTexto("DNI: ");
        String nombre = leerTexto("Nombre: ");
        String telefono = leerTexto("Teléfono: ");

        controlador.altaCliente(dni, nombre, telefono);
        System.out.println("Cliente registrado correctamente.");
    }

    private static void addFavorito() {
        System.out.println("=== Añadir Favorito ===");
        String dni = leerTexto("DNI del cliente: ");
        String codigo = leerTexto("Código del inmueble: ");

        if (controlador.addFavorito(dni, codigo)) {
            System.out.println("Inmueble añadido a favoritos.");
        }
    }

    private static void mostrarFavoritos() {
        System.out.println("=== Mostrar Favoritos ===");
        String dni = leerTexto("DNI del cliente: ");
        controlador.mostrarFavoritos(dni);
    }

    // ============================
    //         UTILIDADES
    // ============================

    private static String leerTexto(String msg) {
        System.out.print(msg);
        return sc.nextLine();
    }

    private static int leerEntero(String msg) {
        System.out.print(msg);
        return Integer.parseInt(sc.nextLine());
    }

    private static double leerDouble(String msg) {
        System.out.print(msg);
        return Double.parseDouble(sc.nextLine());
    }

    private static boolean leerBoolean(String msg) {
        System.out.print(msg);
        return Boolean.parseBoolean(sc.nextLine());
    }
}
