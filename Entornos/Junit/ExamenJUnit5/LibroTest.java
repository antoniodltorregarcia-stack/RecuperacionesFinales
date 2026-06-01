import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class LibroTest {
    
    @Test
    public void CrearLibro() {
        Libro l = new Libro ("AER4J", "El planeta de los simios", 645, 19.99);
        
        assertEquals("AER4J", l.getIsbn());
        assertEquals("El planeta de los simios", l.getTitulo());
        assertEquals(645, l.getNumeroPaginas());
        assertEquals(19.99, l.getPrecio(), 0.001);
    }
    
    @Test
    public void metodoGetIsbn() {
        Libro l = new Libro ("AER4J", "El planeta de los simios", 645, 19.99);
        
        assertEquals("AER4J", l.getIsbn());
    }
    
    @Test
    public void esLibroLargoTrue() {
        Libro l = new Libro ("AER4J", "El planeta de los simios", 645, 19.99);
        
        assertTrue(l.esLibroLargo());

    }
    
    @Test
    public void esLibroLargoFalse() {
        Libro l = new Libro ("123rd4", "El diario de Greg", 230, 14.99);
        
        assertFalse(l.esLibroLargo());
    }
}