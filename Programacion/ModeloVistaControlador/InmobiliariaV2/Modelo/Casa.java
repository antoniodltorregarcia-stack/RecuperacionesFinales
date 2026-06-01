package Modelo;

public class Casa extends Inmueble {
    
    private int numeroPlantas;
    private boolean jardin;
    
    public Casa (String codigoIdentificador, String direccion, int metrosCuadrados, double precio, int numeroPlantas, boolean jardin) {
        super(codigoIdentificador, direccion, metrosCuadrados, precio);
        this.numeroPlantas = numeroPlantas;
        this.jardin = jardin;
    }
    
    public int getNumeroPlantas() {
        return numeroPlantas;
    }
    
    public void setNumeroPlantas(int numeroPlantas) {
        this.numeroPlantas = numeroPlantas;    
    }
    
    public boolean getJardin() {
        return jardin;
    }
    
    public void setJardin(boolean jardin) {
        this.jardin = jardin;
    }
    
    @Override
    public String toString () {
        return "[Casa]" + super.toString() + "Numero de plantas: " + numeroPlantas + " - " +
        "Jardín: " + jardin + ".";
    }
}