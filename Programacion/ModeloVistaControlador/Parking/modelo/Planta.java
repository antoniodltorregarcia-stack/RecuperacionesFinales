package modelo;
import java.util.Map;
import java.util.HashMap;

public class Planta {
    private int numeroPlanta;
    private Map<Integer, Plaza> mapaPlazas;
    
    
    public Planta (int numeroPlanta) {
        this.numeroPlanta = numeroPlanta;
        
        this.mapaPlazas = new HashMap<>();
    }
    
    public int getNumeroPlanta() {
        return numeroPlanta;
    }
    
    public void setNumeroPlanta (int numeroPlanta) {
        this.numeroPlanta = numeroPlanta;
    }
    
    public Map<Integer, Plaza> getMapaPlazas () {
        return mapaPlazas;
    }
    
    public void addPlaza(Plaza p) {
        mapaPlazas.put(p.getNumero(), p);
    }
    
}