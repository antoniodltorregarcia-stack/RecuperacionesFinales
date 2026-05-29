package modelo;



public abstract class Persona{
        private String dni;
        private String nombre;
        private String apellidos;
        private String email;
        private String telefono;
        
        public Persona (String dni, String nombre, String apellidos, String email, String telefono) {
            //Constructor
            
            this.dni = dni;
            this.nombre = nombre;
            this.apellidos = apellidos;
            this.email = email;
            this.telefono = telefono;
        }
        
        // Getters y Setters
        
        public String getDni () {
            return dni;
        }
        
        public void setDni (String dni) {
            this.dni = dni;
        }
        
        public String getNombre() {
            return nombre;
        }
        
        public void setNombre(String nombre) {
            this.nombre = nombre;
        }
        
        public String getApellidos() {
            return apellidos;
        }
        
        public void setApellidos(String apellidos) {
            this.apellidos = apellidos;
        }
        
        public String getEmail() {
            return email;
        }
        
        public void setEmail(String email) {
            this.email = email;
        }
        
        public String getTelefono () {
            return telefono;
        }
        
        public void setTelefono (String telefono) {
            this.telefono = telefono;
        }
}