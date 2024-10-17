/*
 * Hola crack. Espero que estes bien :D
 */

package puto;

 //@author Juampi conejera
public class BancoDigital extends Banco{
    private String direccionWeb;

    public BancoDigital(String nombre, int cantidadEmpleados,int N,String direccionWeb){
        super(nombre,cantidadEmpleados,N);
        this.direccionWeb = direccionWeb;
    }
    
    public boolean agregarCuenta(int CBU, String alias, int DNITitular, String moneda){
        boolean aux = false;
        if(getDimL() < getCantidadMaximaCuentas()){
            insertarCuenta(new Cuenta(CBU,alias,DNITitular,moneda));
            aux = true;
        }
        return aux;
    }
    
    public boolean puedeRecibirTarjeta(int buscarCBU){
        Cuenta aux = super.obtenerCuenta(buscarCBU);
        boolean retorno = false;
        if(aux != null){
            if(aux.getMoneda().equals("Pesos")){
                if(aux.getMonto() > 100000){
                    retorno = true;
                }
            }
        }
        return retorno;
    }
    
}
