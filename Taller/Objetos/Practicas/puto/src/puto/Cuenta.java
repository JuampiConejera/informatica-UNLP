/*
 * Hola crack. Espero que estes bien :D
 */

package puto;

 //@author Juampi conejera
public class Cuenta {
    private int CBU;
    private String alias;
    private int DNITitular;
    private String moneda;
    private double monto;
    
    public Cuenta(int CBU, String alias, int DNITitular, String moneda){
        this.CBU = CBU;
        this.alias = alias;
        this.DNITitular = DNITitular;
        this.moneda = moneda;
        monto = 0;
    }
    
    public Cuenta(int CBU, String alias, int DNITitular, String moneda,double monto){
        this.CBU = CBU;
        this.alias = alias;
        this.DNITitular = DNITitular;
        this.moneda = moneda;
        this.monto = monto;
    }
    
    public int getCBU() {
        return CBU;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMoneda() {
        return moneda;
    }
    
    
}
