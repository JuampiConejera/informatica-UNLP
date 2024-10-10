/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class Dibujo{
    private String titulo;
    private Figura [] vector;
    private int guardadas;
    private int capacidadMaxima=10;
    //inicia el dibujo, sin figuras
    public Dibujo (String titulo){
        //completar
        this.titulo = titulo;
        guardadas = 0;
        this.vector = new Figura[capacidadMaxima];
    }
    //agrega la figura al dibujo
    public void agregar(Figura f){
    //completar
    if(!this.estaLleno()){
        this.vector[guardadas] = f;
        guardadas += 1;
        System.out.println("la figura " + f.toString() + " se ha guardado");
    }
}
    //calcula el área del dibujo:
    //suma de las áreas de sus figuras
    public double calcularArea(){
        double area = 0;
        for(int i = 0; i < guardadas;i++){
            area += vector[i].calcularArea();
        }
        return area;
    }
    public void mostrar(){
        String aux = this.titulo + "";
        for(int i = 0; i < guardadas; i++){
            aux += vector[i].toString();
        }
    }
    //retorna está lleno el dibujo
    public boolean estaLleno() {
    return (guardadas == capacidadMaxima);
}
    }
