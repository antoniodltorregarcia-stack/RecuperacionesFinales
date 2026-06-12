package modelo;
import java.util.List;
import java.util.Map;

public class Plaza {
    private int numero;
    private boolean ocupada;
    
    public Plaza (int numero, boolean ocupada) {
        this.numero = numero;
        this.ocupada = ocupada;
    }
    
    public int getNumero() {
        return numero;
    }
    
    public void setNumero(int numero) {
        this.numero = numero;
    }
    
    public boolean getOcupada () {
        return ocupada;
    }
    
    public void setOcupada (boolean ocupada) {
        this.ocupada = ocupada;
    }
}