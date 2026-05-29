package modelo;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


/**
 * Write a description of class TrabajoTaller here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class TrabajoTaller { 
    //Atributos
    private String codigoTrabajo;
    private String descripcionTrabajo;
    private double costePiezas;
    private int horasTrabajo;
    private boolean terminado;
    private boolean cobrado;
    private String dniMecanico;
    private String matriculaVehiculo;
    
    //Constructor
    public TrabajoTaller(String descripcionTrabajo, double costePiezas, int horasTrabajo, String dniMecanico, String matriculaVehiculo) {
        
        this.descripcionTrabajo = descripcionTrabajo;
        this.costePiezas = costePiezas;
        this.horasTrabajo = horasTrabajo;
        this.dniMecanico = dniMecanico;
        this.matriculaVehiculo = matriculaVehiculo;
        
        //los boolean por defecto en false
        this.terminado = false;
        this.cobrado = false;
        
        //El codigo lo generaremos nosotros mas adelante
        this.codigoTrabajo = generarCodigoTrabajo(matriculaVehiculo);
    }
    
    private String generarCodigoTrabajo(String matriculaVehiculo) {
        
        LocalDate hoy = LocalDate.now(); //obtenemos fecha actual
        
        DateTimeFormatter formato = DateTimeFormatter.ofPattern("yyyyMMdd"); 
        
        String fechaFormateada = hoy.format(formato);
        
        return fechaFormateada + matriculaVehiculo;
    }
    
    public double calcularPrecio(Vehiculo v) {
        double precio = 0;
        
        if (v instanceof Motocicleta) { //instaceof selecciona la clase 
            precio = costePiezas + (horasTrabajo * 10);
        }
        else if (v instanceof Turismo) {
            precio = costePiezas + (horasTrabajo * 20); 
        } 
        else if (v instanceof Furgon) {
            double piezasConRecargo = costePiezas + 1.10;
            
            precio = piezasConRecargo + (horasTrabajo * 25);
        }
        
        return precio;
    }
    
    //Getters y Setters
    
    public String getCodigoTrabajo() {
        return codigoTrabajo;
    }

    public String getDescripcionTrabajo() {
        return descripcionTrabajo;
    }
    
    public double getCostePiezas() {
        return costePiezas;
    }
    
    public int getHorasTrabajo() {
        return horasTrabajo;
    }
    
    public boolean isTerminado() {
        return terminado;
    }
    
    public void setTerminado(boolean terminado) {
        this.terminado = terminado;
    }
    
    public boolean isCobrado() {
        return cobrado;
    }
    
    public void setCobrado(boolean cobrado) {
        this.cobrado = cobrado;
    }
    
    public String getDniMecanico() {
        return dniMecanico;
    }
    
    public String getMatriculaVehiculo() {
        return matriculaVehiculo;
    }

}
    