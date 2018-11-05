package Modelo;

public class Interseccion {
    
    private int i,j;

    public Interseccion(int i, int j) {
        this.i = i;
        this.j = j;
    }

    public int getI()
    {
        return i;
    }

    public int getJ()
    {
        return j;
    }
    
    public String toString(){
        return this.i+" "+this.j+"\n";
    }
}
