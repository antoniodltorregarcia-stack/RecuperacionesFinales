package Modelo;

public class Piso extends Inmueble {
    private int numeroPlanta;
    private boolean ascensor;
    
    public Piso (String codigoIdentificador, String direccion, int metrosCuadrados, double precio, int numeroPlanta, boolean ascensor) {
        super(codigoIdentificador, direccion, metrosCuadrados, precio);        
        this.numeroPlanta = numeroPlanta;
        this.ascensor = ascensor;
    }
    
    public int getNumeroPlanta() {
        return numeroPlanta;
    }
    
    public void setNumeroPlanta(int numeroPlanta) {
        this.numeroPlanta = numeroPlanta;
    }
    
    public boolean getAscensor() {
        return ascensor;
    }
    
    public void setAscensor(boolean ascensor) {
        this.ascensor = ascensor;
    }
    
    @Override
    public String toString () {
        return "[Piso]" + super.toString() + "Planta: " + numeroPlanta + " - " +
        "Tiene ascensor: " + ascensor + ".";
    }
}