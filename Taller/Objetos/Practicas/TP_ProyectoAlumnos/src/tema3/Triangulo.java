/*
 * Hola crack. Espero que estes bien :D
 */

package tema3;

/*1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a, b y c
son los lados y 𝑠 = . La función raíz cuadrada es Math.sqrt(#)*/

 //@author Juampi conejera
public class Triangulo {
    private double ladoA = 0;
    private double ladoB = 0;
    private double ladoC = 0;
    private String colorRelleno = "";
    private String colorLinea = "";

    public Triangulo(double ladoA, double ladoB, double ladoC, String colorRelleno, String colorLinea){
        this.ladoA = ladoA;
        this.ladoB = ladoB;
        this.ladoC = ladoC;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
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

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularPerimetro(){
        double perimetro = ladoA + ladoB + ladoC;
        return perimetro;
    }
    
    public double calcularArea(){
        double s = (ladoA + ladoB + ladoC) / 2.0;
        double area = Math.sqrt(s*(s-ladoA)*(s-ladoB)*(s-ladoC));
        return area;
    }
    
    public String toString(){
        String aux;
        aux = "El triangulo es de " + ladoA + "x" + ladoB + "x" + ladoC + ". Color de relleno " + colorRelleno + " con su linea color " + colorLinea + ".";
        return aux;
    }
}
/*- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
NOTA: Calcular el área con la fórmula Á𝑟𝑒𝑎 = 𝑠(𝑠 − 𝑎)(𝑠 − 𝑏)(𝑠 − 𝑐) , donde a, b y c
son los lados y 𝑠 = . La función raíz cuadrada es Math.sqrt(#)*/
