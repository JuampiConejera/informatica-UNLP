/*
 * Hola crack. Espero que estes bien :D
 */

package tema3;

 //@author Juampi conejera
public class Hotel {
    private Habitacion [] habitaciones;
    private int cantidadHabitaciones;
    
    public Hotel(int N){
        cantidadHabitaciones = N;
        habitaciones = new Habitacion[N];
        for(int i = 0; i < N; i++){
            habitaciones[i] = new Habitacion();
        }
    }

    public Hotel () {
       habitaciones = new Habitacion[cantidadHabitaciones];
   }
    
    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }


    public int getCantidadHabitaciones() {
        return cantidadHabitaciones;
    }

    public void agregarCliente(Persona C, int X){
        habitaciones[X-1].setCliente(C);
    }
    
    public void aumentarPrecio(double monto){
        for(int i = 0; i < this.cantidadHabitaciones; i++)
            habitaciones[i].setCostoPorNoche(monto + habitaciones[i].getCostoPorNoche());
    }

    @Override
    public String toString() {
        String aux = "";
        for(int i = 0; i < cantidadHabitaciones; i++)
            aux += "Habitacion " + (i+1) + ": "+ this.habitaciones[i].toString() + "\n";
        return aux;
    }
    
    
}
