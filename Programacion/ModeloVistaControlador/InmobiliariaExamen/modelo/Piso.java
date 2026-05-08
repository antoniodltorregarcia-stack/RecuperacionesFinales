package modelo;


public class Piso extends Inmueble {
    
    private int planta;
    private boolean tieneAscensor;
    //Constructor
    public Piso (String codigoIdentificador, String direccion, double metrosCuadrados, double precio, int planta, boolean tieneAscensor) {
        super(codigoIdentificador, direccion, metrosCuadrados, precio);
        this.planta=planta;
        this.tieneAscensor=tieneAscensor;
    }
    //Getters y Setters
    public int getPlanta () {
        return planta;
    }
    
    public void setPlanta(int planta) {
        this.planta=planta;
    }
    
    public boolean getTieneAscensor() {
        return tieneAscensor;
    }
    
    public void setTieneAscensor(boolean tieneAscensor) {
        this.tieneAscensor = tieneAscensor;
    }
    
    @Override
    
    public String toString() {
        return "[PISO] " + super.toString() +
               " | Planta: " + planta +
               " | Ascensor: " + (tieneAscensor ? "Sí" : "No");
    }
}