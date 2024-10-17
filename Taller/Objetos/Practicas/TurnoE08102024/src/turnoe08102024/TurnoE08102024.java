/*
 * Hola crack. Espero que estes bien :D
 */
package turnoe08102024;
import PaqueteLectura.*;
/**
 *
 * @author Juampi conejera
 */
public class TurnoE08102024 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Supermercado market = new Supermercado(GeneradorAleatorio.generarString(3));
        for(int i = 0; i < 5; i++){
            market.agregarCaja(new Caja(GeneradorAleatorio.generarString(7),10));
        }
        for(int j = 0; j < 6; j++){
            market.agregarCaja(GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarInt(1000), GeneradorAleatorio.generarInt(50), GeneradorAleatorio.generarDouble(15000), "Credito");
        }
        System.out.println("\n" + "Numero de caja con menor cantidad de tickets emitidos: " + market.minimoTicketsCredito());
        System.out.println(market.toString());
    }
    
}
