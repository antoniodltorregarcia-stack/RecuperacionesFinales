package modelo;

public class Revista extends Publicacion{
    private int numeroEdicion;
    private boolean mensual;
    
    public Revista (String codigoId, String titulo, int numeroPaginas, double precio, int numeroEdicion, boolean mensual) {
        super(codigoId, titulo, numeroPaginas, precio);
        this.numeroEdicion = numeroEdicion;
        this.mensual = mensual;
    }
    
    public int getNumeroEdicion () {
        return numeroEdicion;
    }
    
    public void setNumeroEdicion (int numeroEdicion) {
        this.numeroEdicion = numeroEdicion;
    }
    
    public boolean getMensual () {
        return mensual;
    }
    
    public void setMensual (boolean mensual) {
        this.mensual = mensual;
    }
    
    @Override
    public String toString() {
        return super.toString() + "[Revista]" + " - " + "Número de Edición: " + numeroEdicion + 
        " - " + "¿Es mensual? " + mensual + ".";
    }
}