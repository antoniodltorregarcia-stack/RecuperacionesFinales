import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


public class AlumnoTest {
    @Test
    public void CrearAlumno() {
        Alumno a = new Alumno ("1234JF", "Marcos De Arriba", 23, 4.6);
        
        assertEquals("1234JF", a.getMatricula());
        assertEquals("Marcos De Arriba", a.getNombre());
        assertEquals(23, a.getEdad());
        assertEquals(4.6, a.getNotaMedia() , 0.001);
    }
    
    @Test
    public void esMayorDeEdadTrue() {
        Alumno a = new Alumno ("1234JF", "Marcos De Arriba", 23, 4.6);
        
        assertTrue(a.esMayorDeEdad());
    }
    
    @Test
    public void esMayorDeEdadFalse() {
        Alumno a = new Alumno ("9876AJ", "Miguel Torres", 15, 7.8);
        
        assertFalse(a.esMayorDeEdad());
    }
    
    @Test
    public void tieneNotaAprobadaTrue() {
        Alumno a = new Alumno ("9876AJ", "Miguel Torres", 15, 7.8);
        
        assertTrue(a.tieneNotaAprobada());
    }
    
    @Test
    public void tieneNotaAprobadaFalse() {
        Alumno a = new Alumno ("1234JF", "Marcos De Arriba", 23, 4.6);
        
        assertFalse(a.tieneNotaAprobada());
    }
}