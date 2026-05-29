package modelo;



public class Furgon extends Vehiculo {
    public Furgon (String matricula, int anioFabricacion, String descripcionModelo) {
        super(matricula, anioFabricacion, descripcionModelo);
    }
    
    @Override
    public String toString() {
        return "Furgón: " + getMatricula() + " - " + getDescripcionModelo() + " - " +
        getAnioFabricacion();
    }
}