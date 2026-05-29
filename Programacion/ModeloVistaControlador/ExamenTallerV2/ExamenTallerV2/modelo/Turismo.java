package modelo;



public class Turismo extends Vehiculo{
    public Turismo (String matricula, int anioFabricacion, String descripcionModelo) {
        super(matricula, anioFabricacion, descripcionModelo);
    }
    
    @Override
    public String toString() {
        return "Turismo: " + getMatricula() + " - " + getDescripcionModelo() + " - " +
        getAnioFabricacion();
    }
}