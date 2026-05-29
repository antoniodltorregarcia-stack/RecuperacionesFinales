package modelo;


public class Cliente extends Persona {
    
    //Constructor que hereda de persona 
    
    public Cliente (String dni, String nombre, String apellidos, String email, String telefono) {
        super(dni, nombre, apellidos, email, telefono);
    }
    
    @Override
    public String toString() {
        return "Cliente: " + getDni() + " - " + getApellidos() + " - " + getNombre();
    }
    
}