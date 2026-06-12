package modelo;

public class Coche {
    private String matricula;
    private String horaFechaEntrada;
    private String horaFechaSalida;
    
    public Coche (String matricula, String horaFechaEntrada, String horaFechaSalida) {
        this.matricula = matricula;
        this.horaFechaEntrada = horaFechaEntrada;
        this.horaFechaSalida = horaFechaSalida;
    }
    
    public String getMatricula () {
        return matricula;
    }
    
    public void setMatricula (String matricula) {
        this.matricula = matricula;
    }
    
    public String getHoraFechaEntrada () {
        return horaFechaSalida;
    }
    
    public void setHoraFechaEntrada (String horaFechaEntrada) {
        this.horaFechaEntrada = horaFechaEntrada;
    }
    
    public String getHoraFechaSalida () {
        return horaFechaSalida;
    }
    
    public void setHoraFechaSalida (String horaFechaSalida) {
        this.horaFechaSalida = horaFechaSalida;
    }
    
}