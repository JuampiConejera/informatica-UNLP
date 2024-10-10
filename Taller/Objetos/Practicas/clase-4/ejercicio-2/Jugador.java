/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class Jugador extends Empleado {
    private int partidosJugados;
    private int golesAnotados;
    
    public Jugador(int partidosJugados, int golesAnotados, String nombre, double sueldoBasico, int antiguedad){
        super(nombre,sueldoBasico,antiguedad);
        this.partidosJugados = partidosJugados;
        this.golesAnotados = golesAnotados;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }

    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }

    public int getGolesAnotados() {
        return golesAnotados;
    }

    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    public double calcularEfectividad(){
        double aux = golesAnotados / partidosJugados;
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        double sueldo = getSueldoBasico();
        sueldo += getAntiguedad() * (getSueldoBasico() * 0.1);
        
        if(calcularEfectividad() > 0.5)
            sueldo += getSueldoBasico();
        
        return sueldo;
    }
    
    public String toString(){
        return "Jugador: " + "goles anotados: " + golesAnotados + ", en " + partidosJugados + super.toString() + " goles por partido.";
    }
}
