package modelo;

public abstract class Publicacion {
    private String codigoId;
    private String titulo;
    private int numeroPaginas;
    private double precio;
    
    public Publicacion (String codigoId, String titulo, int numeroPaginas, double precio) {
        this.codigoId = codigoId;
        this.titulo = titulo;
        this.numeroPaginas = numeroPaginas;
        this.precio = precio;
    }
    
    public String getCodigoId () {
        return codigoId;
    }
    
    public void setCodigoId (String codigoId) {
        this.codigoId = codigoId;
    }
    
    public String getTitulo () {
        return titulo;
    }
    
    public void setTitulo (String titulo) {
        this.titulo = titulo;
    }
    
    public int getNumeroPaginas () {
        return numeroPaginas;
    }
    
    public void setNumeroPaginas (int numeroPaginas) {
        this.numeroPaginas = numeroPaginas;
    }
    
    public double getPrecio() {
        return precio;
    }
    
    public void setPrecio (double precio) {
        this.precio = precio;
    }
    
    @Override
    public String toString() {
        return "Codigo Identificador: " + codigoId + " - " + "Titulo: " + titulo + " - " +
        "Número de paginas: " + numeroPaginas + " - " + "Precio: " + precio + "$" + " - ";
    }
}