import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ProductoTest {
    
    @Test
    public void CrearProducto() {
        Producto p = new Producto ("Pegatina", 10.00);
        
        assertEquals("Pegatina", p.getNombre());
        assertEquals(10.00, p.getPrecio());
    }
    
    @Test
    public void getNombre() {
        Producto p = new Producto ("silla", 35.00);
        
        assertEquals("silla", p.getNombre());
    }
    
    @Test
    public void getPrecio() {
        Producto p = new Producto ("silla", 35.00);
        
        assertEquals (35.00, p.getPrecio());
    }
    
    @Test
    public void aplicarDescuento() {
        Producto p = new Producto ("Espejo", 47.00);
        
        double resultado = p.aplicarDescuento(30);
        
        assertEquals(32.9, resultado, 0.001);
        
    }
    
    @Test
    public void siEsCaro() {
        Producto p = new Producto ("Tele", 120.00);
        
        assertTrue(p.esCaro());
    }
    
    @Test
    public void noEsCaro() {
        Producto p = new Producto ("silla", 35.00);
        
        assertFalse(p.esCaro());
    }
}