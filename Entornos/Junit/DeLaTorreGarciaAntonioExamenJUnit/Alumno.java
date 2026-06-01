
public class Alumno {
    private String matricula;
    private String nombre;
    private int edad;
    private double notaMedia;
    
    public Alumno(String matricula, String nombre, int edad, double notaMedia) {
        this.matricula = matricula;
        this.nombre = nombre;
        this.edad = edad;
        this.notaMedia = notaMedia;
    }
    
    public String getMatricula() {
        return matricula;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public int getEdad() {
        return edad;
    }
    
    public double getNotaMedia() {
        return notaMedia;
    }
    
    public boolean esMayorDeEdad() {
        return edad >= 18;
    }
    
    public boolean tieneNotaAprobada() {
        return notaMedia >= 5.0;
    }
}