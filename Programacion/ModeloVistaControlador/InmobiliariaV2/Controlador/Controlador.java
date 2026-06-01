package Controlador;

import Modelo.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Collections;

public class Controlador {
    private static Controlador instancia = null; // La creamos vacia para trabajar con ella
    
    private List <Inmueble> inmueblesEnVenta;
    private List <Cliente> clientes;
    
    private Controlador() {
        
        inmueblesEnVenta = new ArrayList <>(); //Listas vacias
        clientes = new ArrayList<>();
        
    }
    
    
    public static Controlador getInstancia() {
        if (instancia == null) {  //Si no existe se crea
            instancia = new Controlador();
        }
        return instancia; // y lo devolvemos
    }
    //1. Dar de alta un inmueble para vender (el usuario elegirá si es Casa o Piso)
    
    //Casa
    public void altaCasa (String codigoIdentificador, String direccion, int metrosCuadrados, double precio, int numeroPlantas, boolean jardin) {
        Casa c = new Casa (codigoIdentificador, direccion, metrosCuadrados, precio, numeroPlantas, jardin);
        
        inmueblesEnVenta.add(c);
    }
    
    //Piso
    public void altaPiso (String codigoIdentificador, String direccion, int metrosCuadrados, double precio, int numeroPlanta, boolean ascensor) {
        Piso p = new Piso (codigoIdentificador, direccion, metrosCuadrados, precio, numeroPlanta, ascensor);
        
        inmueblesEnVenta.add(p);
    }
    
    //2. Retirar un inmueble vendido del sistema
    public boolean eliminarInmueblesEnVenta(String codigoIdentificador) {
        for (int i = 0; i < inmueblesEnVenta.size(); i++) {
            if (inmueblesEnVenta.get(i).getCodigoIdentificador().equals(codigoIdentificador)) {
                inmueblesEnVenta.remove(i);
                return true; //true si lo eliminamos
            }
        }
        
        return false;
    }
    
    //Explicacion metodo
        //Creamos bucle for para recorrer todo la lista de inmuebles en venta
        //dentro le damos una condicion la cual es =
            // si dentro de inmuebles, coges el codigo getter de codigoIdentificador y es
            //igual que el CodigoIdentificador que buscamos...
            //Eliminalo con remove y devuelve true
        //Si no existe simplemente devuelve false
        
    
    //3. Mostrar todos los inmuebles
    public void listarInmuebles() {
        if (inmueblesEnVenta.isEmpty()) {
            System.out.println("No hay inmuebles registrados");
            return;
        }
        
        for (int i = 0; i < inmueblesEnVenta.size(); i++) {
            System.out.println(inmueblesEnVenta.get(i));
        }
    }
    
    //Explicacion metodo
        //Condicion inicial para comprobar si esta vacia (isEmpty)
            //Devolvemos un mensaje de que no existe
        //Si no lo esta hacemos un bucle for
            //El bucle recorre toda la lista y la escribe
            
    //4. Mostrar sólo las casas
    public void listarSoloCasas() {
        boolean hayCasas = false;
        
        for (Inmueble i : inmueblesEnVenta) {
            if (i instanceof Casa) {
                System.out.println(i);
                hayCasas = true;
            }
        }
        
        if (hayCasas == false) {
            System.out.println("No hay casas registradas");
        }
    }
    
    //Explicacion metodo
        //Creamos un boolean para saber si hay casas con valor inicial en false
        //Creamos un bucle forEach que recorre todos la lista inmueblesEnVenta
            //Condicion if con instanceof que comprueba si ese inmueble es una casa
            //instanceof es un metodo el cual comprueba si inmueble tiene las caracteristicas
            //del contructor que deberia tener casa, si no las cumple no seria un casa
                //Las imprime y cambia a true
            //Condicion en el caso qe¡ue no se haya encontrado casas, como sigue en false,
            //la condicion se cumple y devuelve el System.out.println
    
    //5. Mostrar sólo los pisos
    public void listarSoloPisos() {
        boolean hayPisos = false;
        
        for (Inmueble i : inmueblesEnVenta) {
            if (i instanceof Piso) {
                System.out.println(i);
                hayPisos = true;
            }
        }   
            
        if (hayPisos == false) {
                System.out.println("No hay pisos registrados");
        }
        
    }
    
    //Explicacion metodo
        //Igual que el de Casa
        
    //6. Dar de alta cliente
    public void DarAltaCliente(String dni, String nombre, String telefono, List <Inmueble> inmueblesFavoritos) {
        Cliente c = new Cliente (dni, nombre, telefono, inmueblesFavoritos);
        
        clientes.add(c);
    }
    
    //Explicacion metodo
        //Se añaden todos los atributos del Cliente
        //Se crea con new
        //Se añade con .add el (c) lo declaramos antes para que almacene los clientes
    
    //7. Añadir inmueble favorito a un cliente
    
    public boolean addFavorito(String dni, String codigoIdentificador) {
        Cliente cliente = null;
        
        for (Cliente c : clientes) {
            if (c.getDni().equalsIgnoreCase(dni)) {
                cliente = c;
                break;
            }
        }
        
        if (cliente == null) {
            System.out.println("No existe un cliente con este dni");
            return false;
        }
        
        Inmueble inmueble = null;
        
        for (Inmueble i : inmueblesEnVenta) {
            if (i.getCodigoIdentificador().equalsIgnoreCase(codigoIdentificador)) {
                inmueble = i;
                break;
            }
        }
    
        if (inmueble == null) {
            System.out.println("No existe un inmueble con este codigo");
            return false;
        }
    
        cliente.addFavorito(inmueble);
        return true;
    }
    
    //Explicacion metodo
        //Creamos un metodo boolean con los datos que nos hacen falta dni y codigoInmueble
        //Creamos una variable para guardar el cliente que encontremos (cliente) esta empieza
        //en null pq no sabemos si existe
        
        //Recorremos con un forEach la lista de clientes y si coincide el dni lo
        //guardamos en la variable 
        //Si no se encuentra nada (null) tiramos un false y return
        
        //Hacemos lo mismo con inmueble y su codigo
        
        //añadimos a cliente usando el metodo que creamos en Cliente
        //devolvemos true porque funcionó
        
    //8. Mostrar favoritos de un cliente
    public void listarFavoritos(String dni) {
        Cliente cliente = null;
        
        for (Cliente c : clientes) {
            if (c.getDni().equalsIgnoreCase(dni)) {
                cliente = c;
                break;
            }
        }
        
        if (cliente == null) {
            System.out.println("No existe un cliente con este dni");
            return;
        }    
        
        if (cliente.getFavoritos().isEmpty()) {
            System.out.println("El cliente no tiene inmuebles favoritos");
            return;
        }
        
        System.out.println("Inmuebles favoritos de " + cliente.getNombre() + ":");
        
        for (Inmueble i : cliente.getFavoritos()) {
            System.out.println(i);
        }
        
    }
    
    //Explicacion metodo
    
        //Repetimos el proceso de antes para ver si existe el cliente
        
        //Creamos la condicion donde esa variable cliente llama al metodo getFavoritos si
        // se encuentra vacia manda un mensaje y return
        
        //En el caso de que no se cumpla la variable mandamos un un texto para que quede bien
        //ademas de un forEach que vaya pintando todos los inmuebles favoritos de dicho cliente
        
        
        
    //COMPARATORS
    
    
    
    //por precio ascendente (casas y pisos, listado de todos los inmuebles)
    private class ComparatorPrecio implements java.util.Comparator<Inmueble> {
        
        @Override
        public int compare(Inmueble i1, Inmueble i2) {
            return Double.compare(i1.getPrecio(), i2.getPrecio());
        }
        
        //Explicacion metodo
            //Compara el precio de un inmueble 1 con otro inmueble 2
            //Double.compare devuelve:
                //un número negativo si a < b osea (i1 < i2)
                // 0 si son iguales (i1 == i2)
                //un número positivo si a > b (i1 > i2)
                    //Esto ordenara todos los inmuebles de la lista
    }
    
    //Explicacion
        //Se crea una clase interna que implementa la interaz comparator<inmuble>
        //Le dice a java como compararlos
        
    public void listarInmueblesPorPrecio() {

        if (inmueblesEnVenta.isEmpty()) {
            System.out.println("No hay inmuebles registrados");
            return;
        }
    
        Collections.sort(inmueblesEnVenta, new ComparatorPrecio());
    
        for (Inmueble i : inmueblesEnVenta) {
            System.out.println(i);
        }
    }
    
    //Explicacion metodo
        //Condicion para ver si esta vacio con empty
        
        //Se llama al metodo sort con la lista de inmuebles y el comparator
            //Recorre toda la lista
            //Ejecuta el comparator que hicimos antes y lo ordena todo segun precio
            
        //Con ForEach imprimimos toda la lista ya ordenada
        
    //por metros cuadrados (casas)
    private class ComparatorMetrosCasa implements java.util.Comparator<Inmueble> {

        @Override
        public int compare(Inmueble i1, Inmueble i2) {
            Casa c1 = (Casa) i1;
            Casa c2 = (Casa) i2;
    
            return Integer.compare(c1.getMetrosCuadrados(), c2.getMetrosCuadrados());
        }
        
        //Explicacion
            //El metodo es int porque comparamos el atributo int metrosCuadrados
            //Intenger.compare los devuelve ordenados
    }

    
    // Método del controlador
    public void listarCasasPorMetros() {
    
        ArrayList<Inmueble> casas = new ArrayList<>();
    
        for (Inmueble i : inmueblesEnVenta) {
            if (i instanceof Casa) {
                casas.add(i);
            }
        }
    
        if (casas.isEmpty()) {
            System.out.println("No hay casas registradas.");
            return;
        }
    
        Collections.sort(casas, new ComparatorMetrosCasa());
    
        for (Inmueble c : casas) {
            System.out.println(c);
        }
    }
    
    //Explicacion
        //Creamos un nuevo ArrayList de casas con los datos de Inmueble
        //foreach para recorrer todos los que existen
        //instance confirma que es una casa
            //Si es una casa lo añade
        //Condicion, si esta vacio mandamos un mensaje de que no hay casas
        //Collections sort llama al comparator
        //forEach qye pinta todas las casas ya una vez ordenadas
        
    
    //por planta (pisos)
    private class ComparatorPlantaPiso implements java.util.Comparator<Inmueble> {

        @Override
        public int compare(Inmueble i1, Inmueble i2) {
            Piso p1 = (Piso) i1;
            Piso p2 = (Piso) i2;
    
            return Integer.compare(p1.getNumeroPlanta(), p2.getNumeroPlanta());
        }
    }
    
    public void listarPisosPorPlanta() {
    
        ArrayList<Inmueble> pisos = new ArrayList<>();
    
        for (Inmueble i : inmueblesEnVenta) {
            if (i instanceof Piso) {
                pisos.add(i);
            }
        }
    
        if (pisos.isEmpty()) {
            System.out.println("No hay pisos registrados.");
            return;
        }
    
        Collections.sort(pisos, new ComparatorPlantaPiso());
    
        for (Inmueble p : pisos) {
            System.out.println(p);
        }
    }
    
    //Funciona igual que el de casas pero con pisos
    
    
}