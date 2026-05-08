package modelo;


public class Casa extends Inmueble {
    
    private int numeroPlantas;
    private boolean tieneJardin;
    //Constructor
    public Casa (String codigoIdentificador, String direccion, double metrosCuadrados, double precio, int numeroPlantas, boolean tieneJardin) {
        super(codigoIdentificador, direccion, metrosCuadrados, precio); //LLamamos a los atributos de Inmueble
        this.numeroPlantas=numeroPlantas;
        this.tieneJardin=tieneJardin;
    }
    
    //Getters y Setters
    
    public int getNumeroPlantas() {
        return numeroPlantas;
    }
    
    public void setNumeroPlantas(int numeroPlantas) {
        this.numeroPlantas=numeroPlantas;        
    }
    
    public boolean getTieneJardin() {
        return tieneJardin;
    }
    
    public void setTieneJardin(boolean tieneJardin) {
        this.tieneJardin=tieneJardin;    
    }
    
    @Override
    
    public String toString() {
        return "[CASA] " + super.toString() +
               " | Plantas: " + numeroPlantas +
               " | Jardín: " + (tieneJardin ? "Sí" : "No");
    }
}