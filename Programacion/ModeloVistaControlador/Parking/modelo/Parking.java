package modelo;
import java.util.List;
import java.util.ArrayList;


public class Parking {
    private List <Planta> listaPlantas;
    private double precioPorHora;
    
    public Parking (double precioPorHora) {
        this.precioPorHora = precioPorHora;
        this.listaPlantas = new ArrayList<>();
    }
    
    public double getPrecioPorHora () {
        return precioPorHora;
    }
    
    public void setPrecioPorHora (double precioPorHora) {
        this.precioPorHora = precioPorHora;
    }
    
    public List<Planta>getListaPlantas () {
        return listaPlantas;
    }
    
    public void addPlanta (Planta p) {
        listaPlantas.add(p);
    }
}