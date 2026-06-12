package controlador;

import modelo.*;
import java.util.List;
import java.util.ArrayList;

public class Controlador {
    private static Controlador instancia = null;
    
    private Parking parking;
    private List <Coche> coches;
    
    private Controlador () {
        this.parking = new Parking (5.00);
        coches = new ArrayList<>();
    }
    
    public static Controlador getInstancia() {
        if (instancia == null) {  //Si no existe se crea
            instancia = new Controlador();
        }
        return instancia; // y lo devolvemos
    }
    
    //Registrar entrada de un coche
    public void addCoche (String matricula, String horaFechaEntrada, String horaFechaSalida) {
        Coche c = new Coche (matricula, horaFechaEntrada, horaFechaSalida);
        coches.add(c);
    }
    
    //Registrar Salida
    public boolean eliminarCoche (String matricula) {
        for (int i = 0; i < coches.size(); i++) {
            if (coches.get(i).getMatricula().equalsIgnoreCase(matricula)) {
                coches.remove(i);
                return true;
            }
        }
        
        return false;
    }
    
    //Lis
    /*
    //MostrarEstadoParking
    public void MostrarEstadoParking() {
        Planta.getMapaPlazas().values()
        .forEach(System.out::println);
    }       

    */
}
