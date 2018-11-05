package Modelo;

import java.util.ArrayList;
import java.util.Iterator;

public class Grilla
{
    private boolean[][] matriz;
    private int col, filas;
    private ArrayList<String> lista = new ArrayList<String>();
    private ArrayList<Palabra> palabras = new ArrayList<Palabra>();
    private ArrayList<Interseccion> intersecciones = new ArrayList<Interseccion>();
    
    public Grilla(int col, int filas)
    {
        this.col = col;
        this.filas = filas;
        matriz = new boolean[filas][col];
    }

    public int getCol() {
        return col;
    }

    public int getFilas() {
        return filas;
    }

    public void addPalabra(Palabra palabra)
    {
        this.palabras.add(palabra);
    }
    
    public void addPalabraLista(String palabra)
    {
        this.lista.add(palabra);
    }
    
    public void addInterseccion(Interseccion interseccion){
        this.intersecciones.add(interseccion);
    }
    
    public void removePalabra(Palabra palabra)
    {
        this.palabras.remove(palabra);
    }
    
    public void setCeldaTrue(int i, int j)
    {
        this.matriz[i][j] = true;
    }
    
    public boolean getCelda(int i, int j){
        return this.matriz[i][j];
    }
    
    public void buscaPalabras()
    {
        buscaPalabrasHorizontal();
        buscaPalabrasVertical();
    }
    
    public void buscaPalabrasHorizontal(){
        for(int i = 0; i < this.filas; i++){
            for(int j = 0; j < this.col; j++){
                if(this.getCelda(i, j)){
                    int inicio = j, fin = j;
                    while(j < this.col && this.getCelda(i, j)){
                        fin = j;
                        j++;
                    }
                    if(inicio != fin)
                        this.addPalabra(new Palabra(inicio, fin, i, "horizontal"));
                }
            }
        }
    }
    
    public void buscaPalabrasVertical(){
        for(int j = 0; j < this.col; j++){
            for(int i = 0; i < this.filas; i++){
                if(this.getCelda(i, j)){
                    int inicio = i, fin = i;
                    while(i < this.filas && this.getCelda(i, j)){
                        fin = i;
                        i++;
                    }
                    if(inicio != fin)
                        this.addPalabra(new Palabra(inicio, fin, j, "vertical"));
                }
            }
        }
    }
    
    public void buscaInterseccion(){
        for(int i = 0; i < this.filas; i++){
            for(int j = 0; j < this.col; j++){
                if(hayInterseccion(i,j)){
                    this.addInterseccion(new Interseccion(i,j));
                }
            }
        }
    }
    
    public boolean hayInterseccion(int i, int j){
        boolean respuesta, left, right, up, down;
        respuesta = this.getCelda(i, j);
        //comprobar que las celdas que toca cumplan.
        up = (i > 0) && this.getCelda(i-1, j);
        down = (i < this.filas - 1) && this.getCelda(i+1, j); 
        left = (j > 0) && this.getCelda(i, j-1);
        right = (j < this.col - 1) && this.getCelda(i, j+1); 
        //todas las condiciones de interseccion
        return respuesta && ((up && right) || (right && down) || (down && left) || (left && up));
    }
    
    /*
     * Arma pos(1.4), base de datos ubicacion de la palabra y tamaño
     */
    public String getPalabrasTamaño()
    {
        String respuesta = "";
        Iterator<Palabra> it = this.palabras.iterator();
        int i = 1;
        while(it.hasNext())
        {
            Palabra actual = it.next();
            respuesta += "pos("+i+","+actual.getSize()+").\n";
            i++;
        }
        return respuesta;
    }
    
    /*
     * Arma miembro(X,sol(X,_,_,_)):-
                X = palabra(Lista),
                pos(1,N),
                longitud(Lista,N).
     */
    public String getMiembros()
    {
        String respuesta = "";
        String cabeza = "miembro(X,(";
        for(int i = 1; i <= this.lista.size(); i++)
        {
            respuesta += cabeza;
            respuesta += this.armaCabezaProlog(i, this.lista.size())+")):-\n";
            respuesta += "  X = Lista,\n";
            respuesta += "  pos("+i+",N),\n";
            respuesta += "  longitud(Lista,N).\n";
            
        }
        return respuesta;
    }
    
    /*
     * Arma ubicacion1(X,sol(_,X,_,_)):-
            X = palabra(Lista),
            pos(2,N),
            longitud(Lista,N).
     */
    public String getPosiciones()
    {
        String respuesta = "";
        for(int i = 1; i <= this.lista.size(); i++)
        {
            String cabeza = "ubicacion"+i+"(X,(";
            respuesta += cabeza;
            respuesta += this.armaCabezaProlog(i, this.lista.size())+")):-\n";
            respuesta += "  X = Lista,\n";
            respuesta += "  pos("+i+",N),\n";
            respuesta += "  longitud(Lista,N).\n";
            
        }
        return respuesta;
    }
    /*
     * Arma _,_,_,X,_ 
     */
    private String armaCabezaProlog(int posicion, int cantidad)
    {
        String respuesta = "";
        for(int i = 1; i <= cantidad; i++)
        {
            if(i == posicion)
            {
                respuesta += "X";
            }
            else
            {
                respuesta += "_";
            }
            if(i < cantidad)
            {
                respuesta += ",";
            }
        }
        return respuesta;
    }
    /*
     * Arma prolog miembro(palabra([a,s,n,o]),C)
     */
    public String getPrologPalabras(){
        String respuesta = "", actual;
        Iterator<String> it = this.lista.iterator();
        while(it.hasNext()){
            actual = it.next();
            respuesta += "  miembro(["+this.armarListaString(actual)+"],C),\n";
        }
        return respuesta;
    }
    
    
    /*
     * Arma lista [a,s,n,o]
     */
    private String armarListaString(String palabra){
        String respuesta = "";
        for(int i = 0; i < palabra.length(); i++){
            respuesta += palabra.charAt(i);
            if(i < (palabra.length() - 1)){
                respuesta += ",";
            }
        }
        return respuesta;
    }
    
    public Palabra buscaPalabra(int i, int j, String tipo) throws NoExistePalabraException {
        Iterator<Palabra> it = this.palabras.iterator();
        Palabra palabra = null, actual;
        
        while(it.hasNext()){
            actual = it.next();
            if(actual.isTipo(tipo) && actual.esCelda(i,j)){
                palabra = actual;
            }
        }
        if(palabra == null){
            throw new NoExistePalabraException();
        }
        
        return palabra;
    }
    
    public String armaPrologIntersecciones() throws ErrorInterseccionException {
        Iterator<Interseccion> it = this.intersecciones.iterator();
        Interseccion actual;
        Palabra horizontal, vertical;
        String retorno = "";
        int i = 1;
        while(it.hasNext())
        {
            actual = it.next();
            horizontal = buscarHorizontal(actual);
            vertical = buscarVertical(actual);
            retorno += armaPrologUnaInterseccion(actual, horizontal, vertical, i);
            if(it.hasNext())
            {
                retorno += ",\n";
            }
            i++;
        }
        retorno += ".";
        return retorno;
    }
    
    public Palabra buscarHorizontal(Interseccion inter) throws ErrorInterseccionException {
        Iterator<Palabra> it = this.palabras.iterator();
        Palabra actual, retorno = null;
        while(it.hasNext() && retorno == null)
        {
            actual = it.next();
            if(actual.isTipo("horizontal") && actual.isDentro(inter.getJ()))
            {
                retorno = actual;
            }
        }
        if(retorno == null){
            throw new ErrorInterseccionException();
        }
        return retorno;
    }
    
    public Palabra buscarVertical(Interseccion inter) throws ErrorInterseccionException {
        Iterator<Palabra> it = this.palabras.iterator();
        Palabra actual, retorno = null;
        while(it.hasNext() && retorno == null)
        {
            actual = it.next();
            if(actual.isTipo("vertical") && actual.isDentro(inter.getI()))
            {
                retorno = actual;
            }
        }
        if(retorno == null){
            throw new ErrorInterseccionException();
        }
        return retorno;
    }
    /*
     * Arma el codigo Prolog de una interseccion
     * primero(palabra(X1),C),
       segundo(palabra(Y1),C),
       posicion(X1,1,Letra1),
       posicion(Y1,3,Letra1),
     */
    private String armaPrologUnaInterseccion(Interseccion actual, Palabra horizontal, Palabra vertical, int cant)
    {
        String retorno;
        retorno = " ubicacion"+this.posPalabra(horizontal)+"(X"+cant+",C),\n";
        retorno += "    ubicacion"+this.posPalabra(vertical)+"(Y"+cant+",C),\n";
        retorno += "    posicion(X"+cant+","+(actual.getJ()-horizontal.getInicio()+1)+",Letra"+cant+"),\n";
        retorno += "    posicion(Y"+cant+","+(actual.getI()-vertical.getInicio()+1)+",Letra"+cant+")";
        return retorno;
    }
    
    private int posPalabra(Palabra palabra)
    {
        int pos = 1;
        Iterator<Palabra> it = this.palabras.iterator();
        Palabra actual;
        boolean encontre = false;
        while(it.hasNext() && !encontre && pos < this.palabras.size())
        {
            actual = it.next();
            if(palabra.equals(actual))
            {
                encontre = true;
            }
            else 
            {
                pos++;
            }
        }
        return pos;
    }
    /*
    primero(palabra([l,e,o,n]),C),
    */
    public String prologGratis() throws NoHayGratisException {
        String retorno;
        Iterator<Palabra> it = this.palabras.iterator();
        Palabra actual = it.next();
        int pos = 1;
        while(it.hasNext() && actual.getPalabra().isEmpty())
        {
            actual = it.next();
            pos++;
        }
        if(actual.getPalabra().isEmpty()){
            throw new NoHayGratisException();
        }
        retorno = "ubicacion"+pos+"(["+this.armarListaString(actual.getPalabra())+"],C),\n";
        return retorno;
    }
    
    public void imprimirPalabras(){
        Iterator<Palabra> it = this.palabras.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }
    }
    
    public void imprimirIntersecciones(){
        Iterator<Interseccion> it = this.intersecciones.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }
    }
    
    public void imprimirLista(){
        Iterator<String> it = this.lista.iterator();
        while(it.hasNext()){
            System.out.println(it.next());
        }
    }
    
}
