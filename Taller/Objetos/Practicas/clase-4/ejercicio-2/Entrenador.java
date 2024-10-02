/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class Entrenador extends Empleado{
    private int campeonatosGanados;
    
    public Entrenador(int campeonatosGanados, String nombre, double sueldoBasico, int antiguedad){
        super(nombre,sueldoBasico,antiguedad);
        this.campeonatosGanados = campeonatosGanados;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }

    public double calcularEfectividad(){
        double aux = campeonatosGanados / getAntiguedad();
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        double sueldo = getSueldoBasico();
        
        sueldo += getAntiguedad() * (getSueldoBasico() * 0.1);
        
        if(campeonatosGanados == 0)
            return sueldo;
        else if(campeonatosGanados <= 4)
            sueldo += 5000.0;
        else if(campeonatosGanados <= 10)
            sueldo += 30000.0;
        else
            sueldo += 50000.0;
        
        return sueldo;
    }
    
    public String toString(){
        return "Entrenador: " + "cantidad de campeonatos ganados: " + getCampeonatosGanados() + super.toString() + " campeonatos por anio.";
    }
    
}
