import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CuentaBancariaTest {
    
    @Test
    public void hacerIngreso() {
        
        CuentaBancaria c = new CuentaBancaria (100.00);
        
        c.ingresar(25.00);
        
        assertEquals(125.00 , c.getSaldo(), 0.001);
    }
    
    @Test
    public void RetiradaValida() {
        CuentaBancaria c = new CuentaBancaria(100.00);
        
        c.retirar(50.00);
        
        assertEquals(50.00 , c.getSaldo());
    }
    
    @Test
    public void RetiradaNoValida() {
        CuentaBancaria c = new CuentaBancaria(100.00);
        
        c.retirar(150.00);
        
        assertEquals(100.00, c.getSaldo());
    }
}