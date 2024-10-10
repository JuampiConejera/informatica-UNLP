/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class Circulo extends Figura {
    private double radio;
    
    public Circulo(double radio, String CR, String CL){
        super(CR,CL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularArea(){
        return Math.PI * Math.pow(radio, 2);
    }
   
    public double calcularPerimetro(){
        return Math.PI * radio * 2;
    }
    
    public String toString(){
        return "Radio: " + radio + super.toString();
    }
}
