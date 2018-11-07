package Modelo;

public class Palabra
{
    /**
     * si el tipo es vertical, la ubicacion te da la columna, si es horizontal, te da la fila.
     */
    private int inicio, fin, ubicacion, size;
    private String tipo, palabra;
    
    public Palabra(int ini, int fin, int ubicacion, String tipo)
    {
        this.inicio = ini;
        this.fin = fin;
        this.ubicacion = ubicacion;
        this.tipo = tipo;
        this.size = fin - inicio + 1;
        this.palabra = "";
    }

    public int getUbicacion() {
        return ubicacion;
    }

    public int getInicio()
    {
        return inicio;
    }

    public int getFin()
    {
        return fin;
    }

    public void setPalabra(String palabra)
    {
        this.palabra = palabra;
    }

    public String getPalabra()
    {
        return palabra;
    }
    
    public int getSize(){
        return this.size;
    }
    
    public boolean isTipo(String tipo){
        return this.tipo.equals(tipo);
    }
    
    public boolean esCelda(int i, int j){
        boolean respuesta;
        if(this.isTipo("horizontal")){
            respuesta = (i == this.ubicacion && j == this.inicio);
        }
        else{
            respuesta = (j == this.ubicacion && i == this.inicio);
        }
        return respuesta;
    }
    
    public boolean isDentro(int valor)
    {
        return (this.inicio <= valor) && (valor <= this.fin);
    }
    
    public String toString(){
        return this.inicio+" "+this.fin+" "+this.ubicacion+" "+this.size+" "+this.tipo+" "+this.palabra+"\n";
    }
}
