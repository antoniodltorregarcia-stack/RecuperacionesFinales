package modelo;
import java.util.List;
import java.util.ArrayList;

public class Cliente {
    private String dni;
    private String nombre;
    private String telefono;
    private List<Publicacion>publicacionesFav;
    
    public Cliente (String dni, String nombre, String telefono) {
        this.dni = dni;
        this.nombre = nombre;
        this.telefono = telefono;
    }
    
    public String getDni () {
        return dni;
    }
    
    public void setDni (String dni) {
        this.dni = dni;
    }
    
    public String getNombre () {
        return nombre;
    }
    
    public void setNombre (String nombre) {
        this.nombre = nombre;
    }
    
    public String getTelefono () {
        return telefono;
    }
    
    public void setTelefono (String telefono) {
        this.telefono = telefono;
    }
    
    public List<Publicacion> getFavoritos () {
        return publicacionesFav;
    }
    
    public void addFavorito (Publicacion p) {
        this.publicacionesFav.add(p);
    }
    
    @Override
    public String toString() {
        return "DNI: " + dni + " - " + "Nombre: " + nombre + " - " + "Telefono: " + telefono + ".";
    }
}