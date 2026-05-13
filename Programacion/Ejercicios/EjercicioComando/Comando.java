import java.util.Scanner;

public class Comando {
    private static Scanner sc = new Scanner(System.in);
    
    public static void main (String[]args) {
        int opcion;
        
        do {
            mostrarMenu();
            opcion = sc.nextInt();
            sc.nextLine();
            
            switch (opcion) {
                case 1:
                    escribirTexto();
                    break;
                    
                case 0:
                    System.out.println("Saliendo del programa...");
                    break;
                
                default: 
                    System.out.println("Opción no valida");
                    break;
            }
            
        } while (opcion != 0);
    }
    
    private static void mostrarMenu() {
        System.out.println("Opcion 1 --> Escribir Comando");
        System.out.println("Opcion 0 --> Salir");
    }
    
    private static void escribirTexto() {
        System.out.println("Ejemplos de uso");
        System.out.println("T --> texto de ejemplo (Thola)");
        System.out.println("D --> 25 (D25)");
        System.out.println("F --> 0.23 (F0.23)");
        System.out.println("Escribe aqui tu comando");
        
        String entrada = sc.nextLine();
        
        if (entrada.isEmpty()) {
            System.out.println("El comando no puede estar vacio");
            return;
        } 
        
        if (entrada.length() < 2) {
            System.out.println("No puedes dejar solo la letra de comando");
            return;
        }
        
        char letraClave = entrada.charAt(0);
        
        if (letraClave == 'T') {
            comandoT(entrada, letraClave);
        }
        
        if (letraClave == 'D') {
            comandoD(entrada, letraClave);
        }
        
        if (letraClave == 'F') {
            comandoF(entrada, letraClave);
        }
        
    }
    
    private static void contenido(String entrada) {
        for (int i = 1; i < entrada.length(); i++) {
            System.out.print(entrada.charAt(i));
        }
    }
    
    private static void comandoT(String entrada, char letraClave) {
        for (int i = 1; i < entrada.length(); i++) {
            
            char letra = entrada.charAt(i);
            
            if (!(letra >= 'a' && letra <= 'z' || letra >= 'A' && letra <= 'Z')) {
                System.out.println("Error: " + letra + " No es un caracter valido con " + letraClave);
                return;    
            }
        }
        System.out.println("Es: Texto");
        System.out.print("Contenido: ");
        contenido(entrada);
        System.out.println("");
    }
    
    private static void comandoD (String entrada, char letraClave) {
        
        char letraPrimera = entrada.charAt(1);
        
        if (!(letraPrimera == '-' || letraPrimera >= '0' && letraPrimera <= '9')) {
            System.out.println("Error: " + letraPrimera + " No es un caracter valido con " + letraClave);
            return; 
        }
        
        for (int i = 2; i < entrada.length(); i++) {
            char letra = entrada.charAt(i);
            if (!(letra >= '0' && letra <= '9')) {
                if (letra == '-') {
                    System.out.println("El signo - solo puede ir al principio");
                    return;
                }
        
                System.out.println("Error: " + letra + " No es un caracter valido con " + letraClave);
                return;
            }
        }
        
        System.out.println("Es: Intenger");
        System.out.print("Contenido: ");
        contenido(entrada);
        System.out.println("");
    }
    
    private static void comandoF (String entrada, char letraClave) {
        char letraPrimera = entrada.charAt(1);
        
        if (letraPrimera == '.') {
            System.out.println("No puedes comenzar con un (.)");
            return;
        }
        
        if (!(letraPrimera == '-' || letraPrimera >= '0' && letraPrimera <= '9')) {
            System.out.println("Error: " + letraPrimera + " No es un caracter valido con " + letraClave);
            return; 
        }
        
        for (int i = 2; i < entrada.length(); i++) {
            int contador = 0;
            
            char letra = entrada.charAt(i);
            
            if (letra == '.') {
                    contador++;
            }
            
            if (contador >= 2) {
                    System.out.println("Solo puede existir un (.) ");
                    return;
            }
                
            if (!(letra >= '0' && letra <= '9' || letra == '.')) {
                
                if (letra == '-') {
                    System.out.println("El signo - solo puede ir al principio");
                    return;
                }
                
                System.out.println("Error: " + letra + " No es un caracter valido con " + letraClave);
                return;
            }
        }
        
        System.out.println("Es: Float");
        System.out.print("Contenido: ");
        contenido(entrada);
        System.out.println("");
    }
}
