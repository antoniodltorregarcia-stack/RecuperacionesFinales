package modelo;



public abstract class Vehiculo{
    private String matricula;
    private int anioFabricacion;
    private String descripcionModelo;
    
    //Constructor
    
    public Vehiculo (String matricula, int anioFabricacion, String descripcionModelo) {
        this.matricula = matricula;
        this.anioFabricacion = anioFabricacion;
        this.descripcionModelo = descripcionModelo;
    }
    
    //Getters y Setters
    
    public String getMatricula() {
        return matricula;
    }
    
    public void setMatricula(String matricula) {
        this.matricula=matricula;
    }
    
    public int getAnioFabricacion() {
        return anioFabricacion;
    }
    
    public void setAnioFabricacion(int anioFabricacion) {
        this.anioFabricacion=anioFabricacion;
    }
    
    public String getDescripcionModelo() {
        return descripcionModelo;
    }
    
    public void setDescripcionModelo(String descripcionModelo) {
        this.descripcionModelo=descripcionModelo;
    }
    
    //To String
    
    public String toString() {
        return matricula + " - " + descripcionModelo + " - " + anioFabricacion;
    }
}