package modelo;

import java.util.*;

public class Taller {
    
    //Atributos
    private String cif;
    private String descripcion;
    private List<Vehiculo> listaVehiculos;
    private List<Mecanico> listaMecanicos;
    private Map<String, Cliente> mapaClientes; //clave dni
    private Map<String, TrabajoTaller> mapaTrabajos; //clave codigoTrabajo
    
    //Constructor
    
    public Taller(String cif, String descripcion) {
        this.cif = cif;
        this.descripcion = descripcion;
        
        this.listaVehiculos = new ArrayList<>();
        this.listaMecanicos = new ArrayList<>();
        this.mapaClientes = new HashMap<>();
        this.mapaTrabajos = new HashMap<>();
    }
    
    //Getters y Setters
    
    
    //LISTAS
    
    public List<Mecanico>getListaMecanicos() {
        return listaMecanicos;
    }
    //Añadir mecanico a la lista
    public void addMecanico(Mecanico m) {
        listaMecanicos.add(m);
    }
    
    
    public List<Vehiculo>getListaVehiculos() {
        return listaVehiculos;
    }
    //Añadir vehiculo a su lista
    public void addVehiculo(Vehiculo v) {
        listaVehiculos.add(v);
    }
    
    //MAPAS
    
    public Map<String, Cliente> getMapaClientes() {
        return mapaClientes;
    }
    //Añadir cliente al mapa
    public void addCliente(Cliente c) {
        mapaClientes.put(c.getDni(), c);
    }
    
    
    public Map<String, TrabajoTaller> getMapaTrabajos() {
        return mapaTrabajos;
    }
    //Añadir trabajo al mapa
    public void addTrabajo (TrabajoTaller t) {
        mapaTrabajos.put(t.getCodigoTrabajo(), t);
    }
    
    
}