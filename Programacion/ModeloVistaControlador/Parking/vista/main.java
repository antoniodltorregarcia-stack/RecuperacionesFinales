package vista;

import modelo.*;
import controlador.*;

import java.util.Scanner;

public class main { 

    public static void main(String[] args) {
        mostrarMenu();
    }

    public static void mostrarMenu() {


        Scanner sc = new Scanner(System.in);
        Controlador controlador = Controlador.getInstancia();

        int opcion;

        do {
            System.out.println("===== MENÚ PARKING =====");
            System.out.println("1. Registrar entrada de un coche");
            System.out.println("2. Registrar salida de un coche");
            /*
            System.out.println("3. Mostrar todos los inmuebles");
            System.out.println("4. Mostrar sólo las casas");
            System.out.println("5. Mostrar sólo los pisos");
            System.out.println("6. Dar de alta cliente");
            System.out.println("7. Añadir inmueble favorito a un cliente");
            System.out.println("8. Mostrar favoritos de un cliente");*/
            System.out.println("0. Salir");
            System.out.print("Elige una opción: ");

            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {

                case 1:
                    System.out.println("Registrar Coche");
            
                    System.out.println("Matricula:");
                    String matricula = sc.nextLine();

                    System.out.println("Hora y Fecha de Entrada:");
                    String horaFechaEntrada = sc.nextLine();

                    break;

                case 2:
                    System.out.println("Eliminar Coche");
                    
                    System.out.println("Hora y Fecha de Salida:");
                    String horaFechaSalida = sc.nextLine();
                    
                    System.out.print("Introduce la matricula:");
                    String matriculaEliminar = sc.nextLine();

                    boolean eliminado = controlador.eliminarCoche(matriculaEliminar);

                    if (eliminado) {
                        System.out.println("Coche eliminado correctamente.");
                    } else {
                        System.out.println("No existe un coche con esta matricula.");
                    }
                    break;
                /*
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
                */

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
