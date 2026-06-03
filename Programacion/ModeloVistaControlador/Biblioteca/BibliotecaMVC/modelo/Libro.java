package modelo;

public class Libro extends Publicacion{
    private String autor;
    private String genero;
    
    public Libro (String codigoId, String titulo, int numeroPaginas, double precio, String autor, String genero) {
        super(codigoId, titulo, numeroPaginas, precio);
        this.autor = autor;
        this.genero = genero;
    }
    
    public String getAutor () {
        return autor;
    }
    
    public void setAutor (String autor) {
        this.autor = autor;
    }
    
    public String getGenero () {
        return genero;
    }
    
    public void setGenero(String genero) {
        this.genero = genero;
    }
    
    @Override
    public String toString() {
        return super.toString() + "[Libro]" + " - " + "Autor: " + autor + " - " + "Genero Literario: " + 
        genero + ".";
    }
}