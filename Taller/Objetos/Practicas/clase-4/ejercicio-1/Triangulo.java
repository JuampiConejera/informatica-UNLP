/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class Triangulo extends Figura{
    private double ladoA;
    private double ladoB;
    private double ladoC;
    
    public Triangulo(double ladoA, double ladoB, double ladoC, String CR, String CL){
        super(CR,CL);
        this.ladoA = ladoA;
        this.ladoB = ladoB;
        this.ladoC = ladoC;
    }

    public double getLadoA() {
        return ladoA;
    }

    public void setLadoA(double ladoA) {
        this.ladoA = ladoA;
    }

    public double getLadoB() {
        return ladoB;
    }

    public void setLadoB(double ladoB) {
        this.ladoB = ladoB;
    }

    public double getLadoC() {
        return ladoC;
    }

    public void setLadoC(double ladoC) {
        this.ladoC = ladoC;
    }
    
    public double calcularArea(){
        double s = (ladoA + ladoB + ladoC) / 2.0;
        return (Math.sqrt(s * (s-ladoA) * (s-ladoB) * (s-ladoC)));
    }
    
    public double calcularPerimetro(){
        return ladoA + ladoB + ladoC;
    }
    
    public String toString(){
        return "lado A: " + ladoA + ". lado B: " + ladoB + ". lado C: " + ladoC + super.toString();
    }
}
