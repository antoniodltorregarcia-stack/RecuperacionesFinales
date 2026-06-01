package Modelo;


public abstract class Inmueble {
    private String codigoIdentificador;
    private String direccion;
    private int metrosCuadrados;
    private double precio;
    
    public Inmueble (String codigoIdentificador, String direccion, int metrosCuadrados, double precio) {
        this.codigoIdentificador = codigoIdentificador;
        this.direccion = direccion;
        this.metrosCuadrados = metrosCuadrados;
        this.precio = precio;
    }
    
    public String getCodigoIdentificador() {
        return codigoIdentificador;
    }
    
    public void setCodigoIdentificador(String codigoIdentificador) {
        this.codigoIdentificador = codigoIdentificador;
    }
    
    public String getDireccion() {
        return direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    
    public int getMetrosCuadrados() {
        return metrosCuadrados;
    }
    
    public void setMetrosCuadrados(int metrosCuadrados) {
        this.metrosCuadrados = metrosCuadrados;
    }
    
    public double getPrecio() {
        return precio;
    }
    
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    public String toString() {
        return "Codigo: " + codigoIdentificador + " - " + "Direccion: " + direccion + " - " + 
        "MetrosCuadrados: " + metrosCuadrados + " - " + "Precio: " + precio + " - ";
    }
}