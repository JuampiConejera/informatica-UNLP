/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private double antiguedad; /*en años */
    
    public Empleado(String nombre, double sueldoBasico, int antiguedad){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public double getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public String toString(){
        return ". Nombre: " + nombre + ", sueldo a cobrar: " + this.calcularSueldoACobrar() + ", tiene una efectividad de: " + this.calcularEfectividad();
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
}
