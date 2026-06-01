
public class Libro {
    private String isbn;
    private String titulo;
    private int numeroPaginas;
    private double precio;
    
    public Libro (String isbn, String titulo, int numeroPaginas, double precio) {
        this.isbn = isbn;
        this.titulo = titulo;
        this.numeroPaginas = numeroPaginas;
        this.precio = precio;
    }
    
    public String getIsbn() {
        return isbn;
    }
    
    public String getTitulo() {
        return titulo;
    }
    
    public int getNumeroPaginas() {
        return numeroPaginas;
    }
    
    public double getPrecio() {
        return precio;
    }
    
    public boolean esLibroLargo() {
        return numeroPaginas > 300;
    }
    
    public double aplicarIVA(double porcentajeIVA) {
        return precio + (precio * porcentajeIVA / 100);
    }
}