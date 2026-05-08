package modelo;
import java.util.ArrayList;


public class Cliente {
    private String dni;
    private String nombre;
    private String telefono;
    private ArrayList <Inmueble> inmueblesFavoritos;
    
    public Cliente (String dni, String nombre, String telefono) {
        this.dni=dni;
        this.nombre=nombre;
        this.telefono=telefono;
        this.inmueblesFavoritos = new ArrayList <>();
    }
    
    //Getters y Setters
    public String getDni() {
        return dni;
    }
    
    public void setDni(String dni) {
        this.dni=dni;  
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre=nombre;  
    }
    
    public String getTelefono() {
        return telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono=telefono;  
    }
    
    public ArrayList<Inmueble> getInmueblesFavoritos() {
        return inmueblesFavoritos;
    }

    public void addFavorito(Inmueble i) {
        this.inmueblesFavoritos.add(i);
    }
    
    @Override
    
    public String toString() {
        return dni + " - " + nombre + " - " + telefono;
    }
    
}