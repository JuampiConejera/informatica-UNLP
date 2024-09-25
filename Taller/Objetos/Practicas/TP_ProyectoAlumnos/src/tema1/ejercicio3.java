/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java

*/
package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
//Paso 1. importar la funcionalidad para generar datos aleatorios

public class ejercicio3 {

    public static void main(String[] args) {
        
	//Paso 2. iniciar el generador aleatorio     
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        //Paso 4. mostrar el contenido de la matriz en consola
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        GeneradorAleatorio.iniciar();
        //3.
        int [][] matriz = new int[5][5];
        for (int i = 0;i < 5; i++) {
            for(int j = 0; j < 5; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(30);
        }
        
        //4.
        for(int i = 0; i < 5; i++) {
            for(int j = 0; j < 5; j++)
                System.out.print(matriz[i][j] + " | ");
            System.out.println();
            System.out.println("__________________________");
        }
        
        //5.
        int suma = 0;
        for(int i = 0; i < 5; i++)
            suma += matriz[0][i];
        System.out.println("La suma de numeros de la fila 1 es: " + suma);
        
        //6.
        int [] vector = new int[5];
        for(int j = 0; j < 5; j++){
            int sumaVector = 0;
            for(int i = 0; i < 5; i++)
                sumaVector += matriz[j][i];
            vector[j] = sumaVector;
        }
        for(int i = 0; i < 5; i++){
            System.out.println("El vector en la posicion " + i + " suma: " + vector[i]);
        }
        //7.
        System.out.println("Numero a buscar: ");
        int numero = Lector.leerInt();
        boolean ok = false;
        for(int i = 0; i < 5 && !ok; i++){
            for(int j = 0; j < 5 && !ok; j++){
                if(numero == matriz[i][j]){
                    System.out.print("El elemento esta en la posicion [" + i + ","+ j + "] de la matriz");
                    ok = true;
                }
            }
        }
        if(!ok)
            System.out.println("No se encontro el elemento");
    }
}
