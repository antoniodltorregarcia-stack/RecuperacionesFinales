package controlador;

import modelo.*;

public class Controlador{
    private static Controlador instancia = null;
    
    private Taller taller; //referencia al modelo
    
    //Constructo privado
    private Controlador() {
        //Creamos el taller con datos fijos
        this.taller = new Taller("CIF12345", "Taller los Tilines");
    }
    
    //Metodo para obtener una única instancia
    public static Controlador getInstancia() {
        if (instancia == null) {
            instancia = new Controlador();
        }
        return instancia;
    }
    
    //Getter del taller por si hiciera falta
    public Taller getTaller() {
        return taller;
    }
    
    
    //Añadir Cliente
    public void addCliente(String dni, String nombre, String apellidos, String email, String telefono) {
        Cliente c = new Cliente (dni, nombre, apellidos, email, telefono);
        taller.addCliente(c);
    }
    
    //Añadir Mecanico
    public void addMecanico(String dni, String nombre, String apellidos, String email, String telefono, int anioLlegada) {
        Mecanico m = new Mecanico (dni, nombre, apellidos, email, telefono, anioLlegada);
        taller.addMecanico(m);
    }
    
    //Añadir Vehiculo
    public void addVehiculo(Vehiculo v) {
        taller.addVehiculo(v);
    }
    
    //Crear trabajo
    public void crearTrabajo(String descripcion, double costePiezas, int horas,
                         String dniMecanico, String matriculaVehiculo) {

        TrabajoTaller t = new TrabajoTaller(descripcion, costePiezas, horas,
                                            dniMecanico, matriculaVehiculo);
    
        taller.addTrabajo(t);
    }
    
    //Marcar Trabajo Como Terminado
    public void marcarTerminado(String codigoTrabajo) {
        TrabajoTaller t = taller.getMapaTrabajos().get(codigoTrabajo);
        if (t != null) {
            t.setTerminado(true);
        }
    }
    
    //Marcar Trabajo como Cobrado
    public void marcarCobrado(String codigoTrabajo) {
        TrabajoTaller t = taller.getMapaTrabajos().get(codigoTrabajo);
        if (t != null) {
            t.setCobrado(true);
        }
    }
    
    //Listar clientes ordenador por dni 
    public void listarClientesOrdenados() {
        taller.getMapaClientes().values().stream()
            .sorted((c1, c2) -> c1.getDni().compareTo(c2.getDni()))
            .forEach(System.out::println);
    }
    
    //Listar trabajos Terminados y sin terminar
    public void listarTrabajosTerminados() {
        taller.getMapaTrabajos().values().stream()
            .filter(t -> t.isTerminado())
            .forEach(System.out::println);
    }

    public void listarTrabajosNoTerminados() {
        taller.getMapaTrabajos().values().stream()
            .filter(t -> !t.isTerminado())
            .forEach(System.out::println);
    }





}