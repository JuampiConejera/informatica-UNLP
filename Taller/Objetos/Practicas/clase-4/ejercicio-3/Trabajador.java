/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class Trabajador extends Persona{
    private String empleo;
    
    public Trabajador(String empleo, String nombre, int DNI, int edad){
        super(nombre,DNI,edad);
        this.empleo = empleo;
    }

    public String getEmpleo() {
        return empleo;
    }

    public void setEmpleo(String empleo) {
        this.empleo = empleo;
    }
    
    public String toString(){
        return super.toString() + " Soy " + empleo + ".";
    }
}
