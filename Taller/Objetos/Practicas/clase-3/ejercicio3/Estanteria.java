/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 * 
 * @author alumnos
 */
public class Estanteria {
    private Libro [] libros;
    private int dimL;

    public Estanteria()
    {
        libros = new Libro[20];
        dimL = 0;
    }
    
    public int getCantidadLibros()
    {
        return dimL;
    }
    
    public boolean estaLleno()
    {
        return dimL == 20;
    }

    public void agregarLibro(Libro libro)
    {
        if(dimL < 20){
            libros[dimL] = libro;
            dimL++;
        }
    }
    
    public Libro libroExiste(String nombre)
    {
        int i = 0;
        while(i < dimL)
        {
            if(nombre.equals(this.libros[i].getTitulo()))
                return this.libros[i];
            i++;
        }
        return null;
    }
}