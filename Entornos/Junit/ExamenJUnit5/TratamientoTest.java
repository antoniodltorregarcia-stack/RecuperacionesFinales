import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class TratamientoTest {
    
    @Test
    public void CreacionTratamiento() {
        Tratamiento t = new Tratamiento("Escayola", 22, 25.00);
        
        assertEquals("Escayola", t.getNombre());
        assertEquals(22, t.getDuracionDias());
        assertEquals(25.00, t.getCoste());
    }
    
    @Test
    public void NoEsLargo() {
        Tratamiento t = new Tratamiento("Esguince", 29, 23.00);
        
        assertFalse(t.esLargo());
    }
    
    @Test
    public void SiEsLargo() {
        Tratamiento t = new Tratamiento("Esguince de menisco", 45, 23.00);
        
        assertTrue(t.esLargo());
    }
    
    @Test
    public void aplicarDescuento0() {
        Tratamiento t = new Tratamiento("Accidente", 60, 100.00);
        
        double resultado = t.aplicarDescuento(0);
        
        assertEquals(100.00, resultado, 0.001);
    }
    
    @Test
    public void aplicarDescuento10() {
        Tratamiento t = new Tratamiento("Accidente", 60, 100.00);
        
        double resultado = t.aplicarDescuento(10);
        
        assertEquals(90.00, resultado, 0.001);
    }
    
    
    
}