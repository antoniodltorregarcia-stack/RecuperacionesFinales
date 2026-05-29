package modelo;



public class Mecanico extends Persona {
   
    private int anioLlegada; // se añade un atributo extra
    
    public Mecanico (String dni, String nombre, String apellidos, String email, String telefono, int anioLlegada) {
        super(dni, nombre, apellidos, email, telefono);
        this.anioLlegada = anioLlegada;
    }
    
    //Getters y Setters
    
    public int getAnioLlegada() {
        return anioLlegada;
    }
    
    public void setAnioLlegada(int anioLlegada) {
        this.anioLlegada = anioLlegada;
    }
    
    //To String
    
    @Override
    public String toString() {
        return "Mecanico: " + getDni() + " - " + getApellidos() + ", " + getNombre() +
               " (Año llegada: " + anioLlegada + ")";
    }
}