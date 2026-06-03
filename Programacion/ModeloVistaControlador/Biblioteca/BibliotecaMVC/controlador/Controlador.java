package controlador;
import modelo.*;
import java.util.List;
import java.util.ArrayList;

public class Controlador {
    private static Controlador instancia = null;
    
    private List <Publicacion> publicaciones;
    private List <Cliente> clientes;
    
    private Controlador () {
        publicaciones = new ArrayList <>();
        clientes = new ArrayList <>();
    }
    
    public static Controlador getInstancia () {
        if (instancia == null) {
            instancia = new Controlador();
        }
        return instancia;
    }
    
    //1. Dar de alta una publicación

    //Libro
    public void altaLibro (String codigoId, String titulo, int numeroPaginas, double precio, String autor, String genero) {
        Libro l = new Libro (codigoId, titulo, numeroPaginas, precio, autor, genero);
        
        publicaciones.add(l);
    }
    
    //Revista
    
    public void altaRevista (String codigoId, String titulo, int numeroPaginas, double precio, int numeroEdicion, boolean mensual) {
        Revista r = new Revista (codigoId, titulo, numeroPaginas, precio, numeroEdicion, mensual);
        
        publicaciones.add(r);
    }
    
    //2. Retirar una publicación del sistema
    public boolean eliminarPublicacion (String codigoId) {
        for (int i = 0; i < publicaciones.size(); i++) {
            if (publicaciones.get(i).getCodigoId().equalsIgnoreCase(codigoId)) {
                publicaciones.remove(i);
                return true;
            }
        }
        
        return false;
    }
    
    //3. Mostrar todas las publicaciones
    public void listarPublicaciones() {
        if (publicaciones.isEmpty()) {
            System.out.println("No hay publicaciones registradas");
            return;
        }
        
        for (Publicacion p : publicaciones) {
            System.out.println(p);
        }
    }
    
    //4. Mostrar sólo los libros
    public void listarLibros () {
        boolean hayLibros = false;
        
        for (Publicacion p : publicaciones) {
            if (p instanceof Libro) {
                System.out.println(p);
                hayLibros = true;
            }
        }
        
        if (hayLibros == false) {
            System.out.println("No hay libros registrados");
        }
    }
    
    //5. Mostrar sólo las revistas
    public void listarRevistas () {
        boolean hayRevistas = false;
        
        for (Publicacion p : publicaciones) {
            if (p instanceof Revista) {
                System.out.println(p);
                hayRevistas = true;
            }
        }
        
        if (hayRevistas == false) {
            System.out.println("No hay libros registrados");
        }
    }
    
    //6. Dar de alta a usuario
    public void altaCliente (String dni, String nombre, String telefono) {
        Cliente c = new Cliente (dni, nombre, telefono);
        
        clientes.add(c);
    }
    
    //7. Añadir publicaciones favoritas a un usuario
    public boolean addFavorito (String dni, String codigoId) {
        Cliente cliente = null;
        
        for (Cliente c : clientes) {
            if (c.getDni().equalsIgnoreCase(dni)) {
                cliente = c;
                break;
            }
        }
        
        if (cliente == null) {
            System.out.println("No existe cliente con este Dni");
            return false;
        }
        
        Publicacion publicacion = null;
        
        for (Publicacion p : publicaciones) {
            if (p.getCodigoId().equalsIgnoreCase(codigoId)) {
                publicacion = p;
                break;
            }
        }
        
        if (publicacion == null) {
            System.out.println("No existe una publicacion con este codigo");
            return false;
        }
        
        cliente.addFavorito(publicacion);
        return true; 
    }
    
    //8. Mostrar favoritos de un usuario
    public void listarFavoritos (String dni) {
        Cliente cliente = null;
        
        for (Cliente c : clientes) {
            if (c.getDni().equalsIgnoreCase(dni)) {
                cliente = c;
                break;
            }
        }
        
        if (cliente == null) {
            System.out.println("No existe un cliente con este dni");
            return;
        }
        
        if (cliente.getFavoritos().isEmpty()) {
            System.out.println("El cliente no tiene inmuebles favoritos");
            return;
        }
        
        System.out.println("Publicaciones favoritas de " + cliente.getNombre() + ":");
        
        for (Publicacion p : cliente.getFavoritos()) {
            System.out.println(p);
        }
    }
}