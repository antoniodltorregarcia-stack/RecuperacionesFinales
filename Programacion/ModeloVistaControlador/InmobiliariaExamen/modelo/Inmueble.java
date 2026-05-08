package modelo;


public abstract class Inmueble {
    
    private String codigoIdentificador;
    private String direccion;
    private double metrosCuadrados;
    private double precio;
    
    //Constructor
    public Inmueble (String codigoIdentificador, String direccion, double metrosCuadrados, double precio) {
        this.codigoIdentificador=codigoIdentificador;
        this.direccion=direccion;
        this.metrosCuadrados=metrosCuadrados;
        this.precio=precio;
    }
    
    //Getters Y Setters
    
    public String getCodigoIdentificador() {
        return codigoIdentificador;
    }
    
    public void setCodigoIdentificador(String codigoIdentificador) {
        this.codigoIdentificador=codigoIdentificador;
    }
    
    public String getDireccion() {
        return direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion=direccion;    
    }
    
    public double getMetrosCuadrados() {
        return metrosCuadrados;
    }
    
    public void setMetrosCuadrados(double metrosCuadrados) {
        this.metrosCuadrados=metrosCuadrados;    
    }
    
    public double getPrecio () {
        return precio;
    }
    
    public void setPrecio(double precio) {
        this.precio=precio;    
    }
    
    @Override
    
    public String toString() {
        return codigoIdentificador + " - " + direccion + 
               " - " + metrosCuadrados + "m² - " + precio + "€";
    }
}