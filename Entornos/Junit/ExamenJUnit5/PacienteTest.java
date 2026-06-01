import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


public class PacienteTest {
    @Test
    public void testCreacionPaciente () {
        Paciente p = new Paciente ("123A", "Luis", 20);
        
        assertEquals("123A", p.getDni());
        assertEquals("Luis", p.getNombre());
        assertEquals(20, p.getEdad());
    }
    
    @Test
    public void testGetDni() {
        Paciente p = new Paciente ("0987J", "Migue", 25);
        
        assertEquals("0987J", p.getDni());
    }
    
    @Test
    public void testEsMenorEdad() {
        Paciente p = new Paciente ("1234J","Juan", 15);
        
        assertFalse(p.esMayorDeEdad());
    }
    
    @Test
    public void testEsMayorEdad() {
        Paciente p = new Paciente ("1234L","Juanito", 18);
        
        assertTrue(p.esMayorDeEdad());
    }
}