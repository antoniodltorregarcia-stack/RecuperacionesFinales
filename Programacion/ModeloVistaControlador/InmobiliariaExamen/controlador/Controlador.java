package controlador;

import java.util.ArrayList;
import java.util.Collections;
import modelo.*;


public class Controlador {
    
    private static Controlador instancia = null; //Crea uno vacio para comenzar a trabajar
    
    private ArrayList<Inmueble> inmuebles;
    private ArrayList<Cliente> clientes;
    
    private Controlador() {  //Creamos las lista aqui para que empiecen en 0, privadas para no crear mas
        inmuebles = new ArrayList<>();
        clientes = new ArrayList<>();
    }
    
    public static Controlador getInstancia() {
        if (instancia == null) { 
            instancia = new Controlador(); //Si no existe lo crea
        }
        return instancia; //Si existe no crea otro, lo devuelve
    }
    
    public void AltaCasa (String codigo, String direccion, double metros, double precio,
                        int numeroPlantas, boolean tieneJardin) {
                     
        Casa c = new Casa(codigo, direccion, metros, precio, numeroPlantas, tieneJardin); //Crea una nueva
        
        inmuebles.add(c);// Lo añade to
    }
    
    public void altaPiso(String codigo, String direccion, double metros, double precio,
                     int planta, boolean tieneAscensor) {

        Piso p = new Piso(codigo, direccion, metros, precio, planta, tieneAscensor);
        
        inmuebles.add(p);
    }
    
    public boolean eliminarInmueble(String codigo) {
        
        for (int i = 0; i < inmuebles.size(); i++) {   // Bucle para buscar entre los inmuebles
            
            if (inmuebles.get(i).getCodigoIdentificador().equalsIgnoreCase(codigo)) {  //Los buscamos por codigo ident / el ignoreCase es por si mayusculas o fallos 
                inmuebles.remove(i);
                return true; //Devolvemos true si eliminamos
            }
        }
        
        return false;  //Devolvemos false si el bucle no encuentra nada
    }
    
    public void listarInmuebles () {
        
        if (inmuebles.isEmpty()) {  //Si esta vacia devolvemos un mensaje
            System.out.println("No hay inmuebles registrados");
            return;
        }
        
        for (Inmueble i : inmuebles) {   //Recorremos toda la lista mostrando los inmuebles
            System.out.println(i); //llamamos al toString sacando la lista completa de cada Inmueble
        }
    }
    
    public void listarCasas() {
        
        boolean hayCasas = false; //Empezamos siempre en false
        
        for (Inmueble i : inmuebles) { 
            if (i instanceof Casa) {  //instance of simula una pregunta, ¿Este inmueble es una casa?
                System.out.println(i);
                hayCasas = true;
            }
        }
        
        if (!hayCasas) {  //No hay? mandamos un mensaje
            System.out.println("No hay casas registradas");
        }
    }
    
    public void listarPisos() { //Igual que en casas

        boolean hayPisos = false;
    
        for (Inmueble i : inmuebles) {
            if (i instanceof Piso) {
                System.out.println(i);
                hayPisos = true;
            }
        }
    
        if (!hayPisos) {
            System.out.println("No hay pisos registrados.");
        }
    }
    
    public void altaCliente(String dni, String nombre, String telefono) {
        
        Cliente c = new Cliente(dni, nombre, telefono);
        clientes.add(c);
        
    }
    
    public boolean addFavorito(String dni, String codigoInmueble) {
        //Buscamos cliente por dni
        Cliente cliente = null;
        
        for (Cliente c : clientes) {
            if (c.getDni().equalsIgnoreCase(dni)) {
                cliente = c;
                break;
            }
        }
        
        if (cliente == null) {
            System.out.println("No existe un cliente con este dni");
            return false;
        }
        
        //Buscamos inmueble por su codigo
        Inmueble inmueble = null;
        
        for (Inmueble i : inmuebles) {
            if (i.getCodigoIdentificador().equalsIgnoreCase(codigoInmueble)) {
                inmueble = i;
                break;
            }
        }
        
        if (inmueble == null) {
            System.out.println("No existe un inmueble con ese código.");
            return false;
        }
        
        //Lo añadimos a favoritos
        cliente.addFavorito(inmueble);
        return true;
    }
    
    public void mostrarFavoritos(String dni) {
        //Buscamos cliente por su dni
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
        
        //Comprobamos si existen favoritos
        if (cliente.getInmueblesFavoritos().isEmpty()) {
            System.out.println("El cliente no tiene inmuebles favoritos");
            return;
        }
        
        //Mostramos sus favoritos
        System.out.println("Inmuebles favoritos de " + cliente.getNombre() + ":");
        for (Inmueble i : cliente.getInmueblesFavoritos()) {
            System.out.println(i);
        }
    }
    
    //Comparators
        
        // ============================
    //   COMPARATOR PRECIO
    // ============================
    private class ComparatorPrecio implements java.util.Comparator<Inmueble> {
        
        @Override
        
        public int compare(Inmueble i1, Inmueble i2) {
            return Double.compare(i1.getPrecio(), i2.getPrecio());
        }
    }
    
    // Método del controlador
    public void listarInmueblesPorPrecio() {
    
        if (inmuebles.isEmpty()) {
            System.out.println("No hay inmuebles registrados");
            return;
        }
    
        Collections.sort(inmuebles, new ComparatorPrecio());
    
        for (Inmueble i : inmuebles) {
            System.out.println(i);
        }
    }
    
    
    
    // ============================
    //   COMPARATOR METROS (CASAS)
    // ============================
    private class ComparatorMetrosCasa implements java.util.Comparator<Inmueble> {
        
        @Override
        public int compare(Inmueble i1, Inmueble i2) {
    
            if (i1 instanceof Casa && i2 instanceof Casa) {
                return Double.compare(((Casa) i1).getMetrosCuadrados(),
                                      ((Casa) i2).getMetrosCuadrados());
            }
    
            if (i1 instanceof Casa) return -1;
            if (i2 instanceof Casa) return 1;
    
            return 0;
        }
    }
    
    // Método del controlador
    public void listarCasasPorMetros() {
    
        ArrayList<Inmueble> casas = new ArrayList<>();
    
        for (Inmueble i : inmuebles) {
            if (i instanceof Casa) {
                casas.add(i);
            }
        }
    
        if (casas.isEmpty()) {
            System.out.println("No hay casas registradas.");
            return;
        }
    
        Collections.sort(casas, new ComparatorMetrosCasa());
    
        for (Inmueble c : casas) {
            System.out.println(c);
        }
    }
    
    
    
    // ============================
    //   COMPARATOR PLANTA (PISOS)
    // ============================
    private class ComparatorPlantaPiso implements java.util.Comparator<Inmueble> {
        @Override
        public int compare(Inmueble i1, Inmueble i2) {
    
            if (i1 instanceof Piso && i2 instanceof Piso) {
                return Integer.compare(((Piso) i1).getPlanta(),
                                       ((Piso) i2).getPlanta());
            }
    
            if (i1 instanceof Piso) return -1;
            if (i2 instanceof Piso) return 1;
    
            return 0;
        }
    }
    
    // Método del controlador
    public void listarPisosPorPlanta() {
    
        ArrayList<Inmueble> pisos = new ArrayList<>();
    
        for (Inmueble i : inmuebles) {
            if (i instanceof Piso) {
                pisos.add(i);
            }
        }
    
        if (pisos.isEmpty()) {
            System.out.println("No hay pisos registrados.");
            return;
        }
    
        Collections.sort(pisos, new ComparatorPlantaPiso());
    
        for (Inmueble p : pisos) {
            System.out.println(p);
        }
    }


    
}