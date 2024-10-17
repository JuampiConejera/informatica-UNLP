/*
 * Hola crack. Espero que estes bien :D
 */

package puto;

 //@author Juampi conejera
public abstract class Banco {
    private String nombre;
    private int cantidadEmpleados;
    private Cuenta[] cuentas;
    private int dimL;
    private int cantidadMaximaCuentas;
    
    public Banco(String nombre, int cantidadEmpleados, int N){
        this.nombre = nombre;
        this.cantidadEmpleados = cantidadEmpleados;
        cantidadMaximaCuentas = N;
        cuentas = new Cuenta[cantidadMaximaCuentas];
    }

    public int getDimL() {
        return dimL;
    }

    public int getCantidadMaximaCuentas() {
        return cantidadMaximaCuentas;
    }
    
    public abstract boolean agregarCuenta(int CBU, String alias, int DNITitular, String moneda);

    public void insertarCuenta(Cuenta cuenta){
        cuentas[dimL] = cuenta;
        dimL++;
    }
    
    public Cuenta obtenerCuenta(int BuscarCBU){
        Cuenta aux = null;
        int i = 0;
        boolean ok = false;
        while(i < dimL && !ok){
            if(cuentas[i].getCBU() == BuscarCBU){
                ok = true;
                aux = cuentas[i];
            }
            i++;
        }
        return aux;
    }
    
    public void depositarDinero(int buscarCBU, double montoAgregar){
        Cuenta aux = null;
        int i = 0;
        while(i < dimL && aux != null){
            i++;
            }
            if(cuentas[i].getCBU() == buscarCBU){
                cuentas[i].setMonto(cuentas[i].getMonto() + montoAgregar);
        }
    }
    
    public abstract boolean puedeRecibirTarjeta(int buscarCBU);
}
