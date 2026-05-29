package modelo;


public class Motocicleta extends Vehiculo {
    
    //Constructor
    
    public Motocicleta (String matricula, int anioFabricacion, String descripcionModelo) {
        super(matricula, anioFabricacion, descripcionModelo);
    }
    
    @Override
    public String toString() {
        return "Motocicleta: " + getMatricula() + " - " + getDescripcionModelo() + " - " +
        getAnioFabricacion();
    }
}