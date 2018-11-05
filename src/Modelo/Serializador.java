package Modelo;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Serializador
{
    private Grilla grilla;
    public static String ruta = "./prolog.pl";
    private File archivo;
    
    public Serializador(Grilla grilla)
    {
        this.grilla = grilla;
    }
    
    public void crearArchivo(){
        this.archivo = new File(ruta);
        if(this.archivo.exists()){
            this.archivo.delete();
            this.archivo = new File(ruta);
        }
    }
    
    public void escribirArchivo() throws ErrorInterseccionException {
        try {
            BufferedWriter bf =new BufferedWriter(new FileWriter(this.archivo));
            bf.write(this.armaEstaticos());
            //System.out.println(this.armaEstaticos());
            bf.write(this.grilla.getPalabrasTamaño());
            //System.out.println(this.grilla.getPalabrasTamaño());
            bf.write(this.grilla.getMiembros());
            //System.out.println(this.grilla.getMiembros());
            bf.write(this.grilla.getPosiciones());
            //System.out.println(this.grilla.getPosiciones());
            bf.write(this.armaSolucion());
            //System.out.println(this.armaSolucion());
            bf.close();
        } catch (IOException e) {
        }
    }
    
    private String armaEstaticos()
    {
        String respuesta = "longitud([],0).\n" + 
        "longitud(Lista,N):-\n" + 
        "    Lista = [_|Col],\n" + 
        "    longitud(Col,M),\n" + 
        "    N is M+1.\n" + 
        "posicion([Cabeza|_],1,Cabeza).\n" + 
        "posicion([_|Cola],N,X):-\n" + 
        "    N>0,\n" + 
        "    N1 is N-1,\n" + 
        "    posicion(Cola,N1,X1),\n" + 
        "    X=X1.\n";
        return respuesta;
    }

    private String armaSolucion() throws ErrorInterseccionException {
        String retorno = "sol(C):-\n";
        try {
            retorno += this.grilla.prologGratis();
        } catch (NoHayGratisException e) {
        }
        retorno += this.grilla.getPrologPalabras();
        retorno += this.grilla.armaPrologIntersecciones();
        return retorno;
    }
}
