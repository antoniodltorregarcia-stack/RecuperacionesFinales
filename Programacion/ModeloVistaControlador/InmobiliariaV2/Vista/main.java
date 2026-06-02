package Vista;

import Modelo.*;
import Controlador.*;

import java.util.Scanner;

public class main { //Importante no llamarlo igual que el paquete

    public static void main(String[] args) {
        mostrarMenu();
    }

    public static void mostrarMenu() {


        Scanner sc = new Scanner(System.in);
        Controlador controlador = Controlador.getInstancia();

        int opcion;

        do {
            System.out.println("===== MENÚ INMOBILIARIA =====");
            System.out.println("1. Dar de alta un inmueble para vender");
            System.out.println("2. Retirar un inmueble vendido del sistema");
            System.out.println("3. Mostrar todos los inmuebles");
            System.out.println("4. Mostrar sólo las casas");
            System.out.println("5. Mostrar sólo los pisos");
            System.out.println("6. Dar de alta cliente");
            System.out.println("7. Añadir inmueble favorito a un cliente");
            System.out.println("8. Mostrar favoritos de un cliente");
            System.out.println("0. Salir");
            System.out.print("Elige una opción: ");

            opcion = sc.nextInt();
            sc.nextLine(); // limpiar buffer

            switch (opcion) {

                case 1:
                    System.out.println("Opción 1: alta inmueble");
                    System.out.println("Elige el tipo de Inmueble:");
                    System.out.println("1. Casa");
                    System.out.println("2. Piso");
                    int tipo = sc.nextInt();
                    sc.nextLine();

                    System.out.println("Código Identificador:");
                    String codigoInmueble = sc.nextLine();

                    System.out.println("Dirección:");
                    String direccion = sc.nextLine();

                    System.out.print("Metros cuadrados: ");
                    int metrosCuadrados = sc.nextInt();

                    System.out.print("Precio: ");
                    double precio = sc.nextDouble();

                    if (tipo == 1) {
                        System.out.print("Número de plantas: ");
                        int numeroPlantas = sc.nextInt();

                        System.out.print("¿Tiene jardín? (true/false): ");
                        boolean jardin = sc.nextBoolean();
                        sc.nextLine();

                        controlador.altaCasa(codigoInmueble, direccion, metrosCuadrados, precio, numeroPlantas, jardin);
                        System.out.println("Casa dada de alta correctamente.");

                    } else if (tipo == 2) {
                        System.out.print("Número de planta: ");
                        int numeroPlanta = sc.nextInt();

                        System.out.print("¿Tiene ascensor? (true/false): ");
                        boolean ascensor = sc.nextBoolean();
                        sc.nextLine();

                        controlador.altaPiso(codigoInmueble, direccion, metrosCuadrados, precio, numeroPlanta, ascensor);
                        System.out.println("Piso dado de alta correctamente.");
                    }

                    break;

                case 2:
                    System.out.println("Opción 2: retirar inmueble vendido del sistema");

                    System.out.print("Introduce el código identificador del inmueble: ");
                    String codigoEliminar = sc.nextLine();

                    boolean eliminado = controlador.eliminarInmueblesEnVenta(codigoEliminar);

                    if (eliminado) {
                        System.out.println("Inmueble eliminado correctamente.");
                    } else {
                        System.out.println("No existe un inmueble con ese código.");
                    }
                    break;

                case 3:
                    System.out.println("Opción 3: mostrar todos los inmuebles");
                    controlador.listarInmuebles();
                    break;

                case 4:
                    System.out.println("Opción 4: mostrar solo casas");
                    controlador.listarSoloCasas();
                    break;

                case 5:
                    System.out.println("Opción 5: mostrar solo pisos");
                    controlador.listarSoloPisos();
                    break;

                case 6:
                    System.out.println("Opción 6: alta cliente");

                    System.out.print("DNI: ");
                    String dni = sc.nextLine();

                    System.out.print("Nombre: ");
                    String nombre = sc.nextLine();

                    System.out.print("Teléfono: ");
                    String telefono = sc.nextLine();

                    controlador.DarAltaCliente(dni, nombre, telefono, new java.util.ArrayList<>());
                    System.out.println("Cliente dado de alta correctamente.");
                    break;

                case 7:
                    System.out.println("Opción 7: añadir inmueble favorito a un cliente");

                    System.out.print("DNI del cliente: ");
                    String dniFav = sc.nextLine();

                    System.out.print("Código del inmueble: ");
                    String codigoFav = sc.nextLine();

                    boolean añadido = controlador.addFavorito(dniFav, codigoFav);

                    if (añadido) {
                        System.out.println("Inmueble añadido a favoritos.");
                    } else {
                        System.out.println("No se pudo añadir el favorito.");
                    }
                    break;

                case 8:
                    System.out.println("Opción 8: mostrar favoritos de un cliente");

                    System.out.print("DNI del cliente: ");
                    String dniMostrar = sc.nextLine();

                    controlador.listarFavoritos(dniMostrar);
                    break;

                case 0:
                    System.out.println("Saliendo del programa...");
                    break;

                default:
                    System.out.println("Opción no válida.");
            }

            System.out.println();

        } while (opcion != 0);

        sc.close();
    }
}
