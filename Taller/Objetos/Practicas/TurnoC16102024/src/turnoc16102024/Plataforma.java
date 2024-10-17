/*
 * Hola crack. Espero que estes bien :D
 */

package turnoc16102024;

 //@author Juampi conejera
public class Plataforma {
    private String nombre;
    private int cantidadSuscriptores;
    private int cantidadCategoriasMaxima;
    private Estreno[][] estrenos;
    private int[] vectorDimL;
    
    public Plataforma(String nombre, int cantidadSuscriptores, int C){
        this.nombre = nombre;
        this.cantidadSuscriptores = cantidadSuscriptores;
        cantidadCategoriasMaxima = C;
        estrenos = new Estreno[cantidadCategoriasMaxima][12];
        vectorDimL = new int[cantidadCategoriasMaxima];
        for(int i = 0; i < cantidadCategoriasMaxima; i++){
            vectorDimL[i] = 0;
        }
    }
    
    public void AgregarEstreno(int X, Estreno estreno){
        int i = 0;
        while(i < 12 && estrenos[X-1][i] != null){
            i++;
        }
        if(i<12){
            estrenos[X-1][i] = estreno;
            vectorDimL[X-1]++;
        }
    }
    
    public String listarEstrenos(int X){
        String aux = "";
        for(int i = 0; i < vectorDimL[X-1]; i++){
            aux += estrenos[X-1][i].toString() + "\n";
        }
        return aux;
    }
    
    public double totalGanancias(){
        double recaudacion = 0;
        for(int i = 0; i < cantidadCategoriasMaxima; i++){
            for(int j = 0; j < vectorDimL[i]; j++){
                recaudacion += estrenos[i][j].getRecaudacion();
            }
        }
        return recaudacion / 2;
    }
    
    public String toString(){
        String aux = "Plataforma: " + nombre + ", " + cantidadSuscriptores + " suscriptores. \n";
        for(int i = 0; i < cantidadCategoriasMaxima; i++){
            aux += "\n Categoria: " + (i+1) + ":";
            for(int j = 0; j < vectorDimL[i]; j++){
                aux += " \n Mes: " + (j+1) + "\n" + estrenos[i][j].toString();
            }
        }
        return aux;
    }
    
}
