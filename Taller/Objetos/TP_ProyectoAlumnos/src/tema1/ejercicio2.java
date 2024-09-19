
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class ejercicio2 {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        //Paso 3: Crear el vector para 15 double
        //Paso 4: Declarar indice y variables auxiliares a usar
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        //Paso 7: Calcular el promedio de alturas, informarlo
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        //Paso 9: Informar la cantidad.
        double [] alturas = new double[15];
        double suma = 0; //suma total de alturas
        for(int i = 0; i < 15; i++){
            System.out.println("Altura del jugador " + i);
            alturas[i] = Lector.leerDouble();
            suma += alturas[i];
        }
        double promedio = suma/15;
        System.out.println("La altura promedio es " + promedio);
        int cantidad = 0;
        for(int i = 0; i < 15; i++){
            if(alturas[i] > promedio)
                cantidad++;
        }
        System.out.println("La cantidad de jugadores mayores al promedio es: " + cantidad);
    }
    
}
