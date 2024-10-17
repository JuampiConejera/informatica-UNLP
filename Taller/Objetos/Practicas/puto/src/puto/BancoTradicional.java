/*
 * Hola crack. Espero que estes bien :D
 */

package puto;

 //@author Juampi conejera
public class BancoTradicional extends Banco{
    private String direccion;
    private String localidad;
    private int cantidadCuentasDolares;
    
    public BancoTradicional(String nombre, int cantidadEmpleados, int N,String direccion, String localidad){
        super(nombre, cantidadEmpleados, N);
        cantidadCuentasDolares = 0;
        this.direccion = direccion;
        this.localidad = localidad;
    }
    
    public boolean agregarCuenta(int CBU, String alias, int DNITitular, String moneda){
        boolean aux = false;
        if(getDimL() < getCantidadMaximaCuentas() && cantidadCuentasDolares < 100){
            super.insertarCuenta(new Cuenta(CBU,alias,DNITitular,moneda));
            aux = true;
        }
        return aux;
    }
    
    public boolean puedeRecibirTarjeta(int buscarCBU){
        Cuenta aux;
        boolean retorno = false;
        aux = super.obtenerCuenta(buscarCBU);
        if(aux != null){
            if(aux.getMoneda().equals("Pesos")){
                if(aux.getMonto() > 70000){
                    return true;
                }
            }
            else if(aux.getMoneda().equals("Dolares")){
                if(aux.getMonto() > 500){
                    return true;
                }
            }
        }
        return retorno;
    }
    
}
