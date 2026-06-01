package Modelo;
import java.util.List;
import java.util.ArrayList;

public class Cliente {
    private String dni;
    private String nombre;
    private String telefono;
    private List <Inmueble> inmueblesFavoritos;
    
    public Cliente (String dni, String nombre, String telefono, List <Inmueble> inmueblesFavoritos) {
        this.dni = dni;
        this.nombre = nombre;
        this.telefono = telefono;
        this.inmueblesFavoritos = new ArrayList<>();
    }
    
    public String getDni() {
        return dni;
    }
    
    public void setDni (String dni) {
        this.dni=dni;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getTelefono() {
        return telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public List<Inmueble> getFavoritos() {
        return inmueblesFavoritos;
    }
    
    public void addFavorito(Inmueble i) {
        this.inmueblesFavoritos.add(i);
    }
    
    @Override
    public String toString () {
        return "[Cliente] " + "Dni: " + dni + " - " + "Nombre: " + nombre + " - " + 
        "Telefono: " + telefono + ".";
    }
}