
public class Tratamiento { 
    private String nombre; 
    private int duracionDias; 
    private double coste; 
     
    public Tratamiento(String nombre, int duracionDias, double coste) { 
           this.nombre = nombre; 
           this.duracionDias = duracionDias; 
           this.coste = coste; 
    } 
     
    public String getNombre() {
        return nombre; 
    } 
       
    public int getDuracionDias() {
        return duracionDias; 
    } 
    
    public double getCoste() {
        return coste; 
    } 
    
    public boolean esLargo() { 
        return duracionDias > 30; 
    } 
    
    public double aplicarDescuento(double porcentaje) { 
        return coste - (coste * porcentaje / 100); 
    }
}