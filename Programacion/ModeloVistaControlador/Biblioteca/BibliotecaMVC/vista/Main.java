package vista;

import modelo.*;
import controlador.*;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        mostrarMenu();
    }

    public static void mostrarMenu() {
        Scanner sc = new Scanner(System.in);
        Controlador controlador = Controlador.getInstancia();

        int opcion;

        do {
            System.out.println("==== MENU BIBLIOTECA ====");
            System.out.println("1. Dar de alta una publicación");
            System.out.println("2. Retirar una publicación del sistema");
            System.out.println("3. Mostrar todas las publicaciones");
            System.out.println("4. Mostrar sólo los libros");
            System.out.println("5. Mostrar sólo las revistas");
            System.out.println("6. Dar de alta usuario");
            System.out.println("7. Añadir publicación favorita a un usuario");
            System.out.println("8. Mostrar favoritos de un usuario");
            System.out.println("0. Salir del programa");
            System.out.print("Elige una opción: ");

            opcion = sc.nextInt();
            sc.nextLine();

            switch (opcion) {

                case 1:
                    System.out.println("Elige tipo de publicación:");
                    System.out.println("1. Libro");
                    System.out.println("2. Revista");
                    int tipo = sc.nextInt();
                    sc.nextLine();

                    System.out.print("Código Identificador: ");
                    String codigoId = sc.nextLine();

                    System.out.print("Título: ");
                    String titulo = sc.nextLine();

                    System.out.print("Número de páginas: ");
                    int numeroPaginas = sc.nextInt();

                    System.out.print("Precio: ");
                    double precio = sc.nextDouble();
                    sc.nextLine();

                    if (tipo == 1) {
                        System.out.print("Autor: ");
                        String autor = sc.nextLine();

                        System.out.print("Género literario: ");
                        String genero = sc.nextLine();

                        controlador.altaLibro(codigoId, titulo, numeroPaginas, precio, autor, genero);

                    } else if (tipo == 2) {
                        System.out.print("Número de edición: ");
                        int numeroEdicion = sc.nextInt();

                        System.out.print("¿Es mensual? (true/false): ");
                        boolean mensual = sc.nextBoolean();
                        sc.nextLine();

                        controlador.altaRevista(codigoId, titulo, numeroPaginas, precio, numeroEdicion, mensual);
                    }

                    System.out.println("Publicación dada de alta correctamente.");
                    break;

                case 2:
                    System.out.print("Introduce el código identificador de la publicación: ");
                    String codigoEliminado = sc.nextLine();

                    boolean eliminado = controlador.eliminarPublicacion(codigoEliminado);

                    if (eliminado) System.out.println("Publicación eliminada correctamente.");
                    else System.out.println("No existe la publicación.");
                    break;

                case 3:
                    controlador.listarPublicaciones();
                    break;

                case 4:
                    controlador.listarLibros();
                    break;

                case 5:
                    controlador.listarRevistas();
                    break;

                case 6:
                    System.out.print("DNI: ");
                    String dni = sc.nextLine();

                    System.out.print("Nombre: ");
                    String nombre = sc.nextLine();

                    System.out.print("Teléfono: ");
                    String telefono = sc.nextLine();

                    controlador.altaCliente(dni, nombre, telefono);
                    System.out.println("Usuario dado de alta correctamente.");
                    break;

                case 7:
                    System.out.print("DNI del usuario: ");
                    String dniFav = sc.nextLine();

                    System.out.print("Código de la publicación: ");
                    String codigoFav = sc.nextLine();

                    if (controlador.addFavorito(dniFav, codigoFav))
                        System.out.println("Favorito añadido.");
                    break;

                case 8:
                    System.out.print("DNI del usuario: ");
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
