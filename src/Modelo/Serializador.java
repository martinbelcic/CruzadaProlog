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
    
    public void escribirArchivo() throws ErrorInterseccionException, NoHayGratisException {
        try {
            BufferedWriter bf =new BufferedWriter(new FileWriter(this.archivo));
            bf.write(this.grilla.getPalabrasTamaño());
            //System.out.println(this.grilla.getPalabrasTamaño());
            bf.write(this.grilla.prologGratis());
            bf.write(this.armaEstaticos());
            //System.out.println(this.armaEstaticos());
            bf.close();
        } catch (IOException e) {
        }
    }
    
    private String armaEstaticos()
    {
        String respuesta = "interseccion(Palabra1, Palabra2, Lugar1, Lugar2):-\n" +
                "\tnth1(Lugar1, Palabra1, Letra),\n" +
                "\tnth1(Lugar2, Palabra2, Letra).\n" +
                "\n" +
                "tomarPalabra(Lista, Palabra, Tam, Nueva):-\n" +
                "\tselect(Palabra, Lista, Nueva),\n" +
                "\tlength(Palabra, Tam).\n" +
                "\n" +
                "tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones):-\n" +
                "\tselect(Interseccion,ListaIntersecciones,NuevaListaIntersecciones),\n" +
                "\tInterseccion=inter(PosGratis,_,_,_).\n" +
                "\n" +
                "tomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones):-\n" +
                "\tselect(Interseccion,ListaIntersecciones,NuevaListaIntersecciones),\n" +
                "\tInterseccion=inter(_,PosGratis,_,_).\n" +
                "\n" +
                "agregaSolucion(ListaSolucion,PalabraObtenida,PosPalVertical,NuevaSolucion):-\n" +
                "\tsacarListaPosicion(ListaSolucion,PosPalVertical,NuevaSolucionAux),\n" +
                "\tagregarListaPosicion(NuevaSolucionAux,PosPalVertical,PalabraObtenida,NuevaSolucion).\n" +
                "\n" +
                "sacarListaPosicion([_|Cola],1,Cola).\n" +
                "\n" +
                "sacarListaPosicion([Cabeza|Cola],Pos,NuevaLista):-\n" +
                "\tPos>1,\n" +
                "\tPosAux is Pos -1,\n" +
                "\tsacarListaPosicion(Cola,PosAux,NuevaListaAux),\n" +
                "\tNuevaLista=[Cabeza|NuevaListaAux].\n" +
                "\n" +
                "agregarListaPosicion(Lista,1,PalabraObtenida,NuevaLista):-\n" +
                "\tNuevaLista=[PalabraObtenida|Lista].\n" +
                "\t\n" +
                "agregarListaPosicion([Cabeza|Cola],Pos,PalabraObtenida,NuevaLista):-\n" +
                "\tPos>1,\n" +
                "\tPosAux is Pos - 1,\n" +
                "\tagregarListaPosicion(Cola,PosAux,PalabraObtenida,NuevaListaAux),\n" +
                "\tNuevaLista=[Cabeza|NuevaListaAux].\n" +
                "\n" +
                "/*horizontal*/\n" +
                "\n" +
                "solucionGratis(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-\n" +
                "\tgratis(PosGratis,PalabraGratis),\n" +
                "\tagregaSolucion(ListaSolucion, PalabraGratis, PosGratis, ListaSolAux),\n" +
                "\ttomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones),\n" +
                "\tinter(PosGratis,PosPalVertical,PosLetraHorizontal,PosLetraVertical)=Interseccion,\n" +
                "\tpos(PosPalVertical,Tam),\n" +
                "\ttomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),\n" +
                "\tinterseccion(PalabraGratis,PalabraObtenida,PosLetraHorizontal,PosLetraVertical),\n" +
                "\tagregaSolucion(ListaSolAux,PalabraObtenida,PosPalVertical,NuevaSolucion),\n" +
                "\tsolucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),\n" +
                "\tSolucion = SolucionAux.\n" +
                "\n" +
                "/*vertical*/\n" +
                "solucionGratis(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-\n" +
                "\tgratis(PosGratis,PalabraGratis),\n" +
                "\tagregaSolucion(ListaSolucion, PalabraGratis, PosGratis, ListaSolAux),\n" +
                "\ttomaListaIntersecciones(ListaIntersecciones,Interseccion,PosGratis,NuevaListaIntersecciones),\n" +
                "\tinter(PosPalHorizontal, PosGratis, PosLetraHorizontal, PosLetraVertical) = Interseccion,\n" +
                "\tpos(PosPalHorizontal,Tam),\n" +
                "\ttomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),\n" +
                "\tinterseccion(PalabraObtenida, PalabraGratis, PosLetraHorizontal, PosLetraVertical),\n" +
                "\tagregaSolucion(ListaSolAux, PalabraObtenida, PosPalHorizontal, NuevaSolucion),\n" +
                "\tsolucion(NuevaListaPalabras, NuevaSolucion, SolucionAux, NuevaListaIntersecciones),\n" +
                "\tSolucion = SolucionAux." +
                "\n" +
                "solucion([], Solucion, Solucion,_).\n" +
                "\n" +
                "/* horizontal */\n" +
                "solucion(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-\n" +
                "\ttomarPalabra(ListaSolucion, Palabra,_,_),\n" +
                "\tnth1(PosPalabra, ListaSolucion, Palabra),\n" +
                "\ttomaListaIntersecciones(ListaIntersecciones,Interseccion,PosPalabra,NuevaListaIntersecciones),\n" +
                "\tinter(PosPalabra, PosPalVertical,PosLetraHorizontal,PosLetraVertical)=Interseccion,\n" +
                "\tpos(PosPalVertical,Tam),\n" +
                "\ttomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),\n" +
                "\tinterseccion(Palabra,PalabraObtenida,PosLetraHorizontal,PosLetraVertical),\n" +
                "\tagregaSolucion(ListaSolucion,PalabraObtenida,PosPalVertical,NuevaSolucion),\n" +
                "\tsolucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),\n" +
                "\tSolucion = SolucionAux.\n" +
                "\n" +
                "/*vertical*/\n" +
                "solucion(ListaPalabras, ListaSolucion, Solucion, ListaIntersecciones):-\n" +
                "\ttomarPalabra(ListaSolucion, Palabra,_,_),\n" +
                "\tnth1(PosPalabra, ListaSolucion, Palabra),\n" +
                "\ttomaListaIntersecciones(ListaIntersecciones,Interseccion,PosPalabra,NuevaListaIntersecciones),\n" +
                "\tinter(PosPalHorizontal,PosPalabra, PosLetraHorizontal,PosLetraVertical)=Interseccion,\n" +
                "\tpos(PosPalHorizontal,Tam),\n" +
                "\ttomarPalabra(ListaPalabras,PalabraObtenida,Tam,NuevaListaPalabras),\n" +
                "\tinterseccion(PalabraObtenida,Palabra,PosLetraHorizontal,PosLetraVertical),\n" +
                "\tagregaSolucion(ListaSolucion,PalabraObtenida,PosPalHorizontal,NuevaSolucion),\n" +
                "\tsolucion(NuevaListaPalabras,NuevaSolucion,SolucionAux,NuevaListaIntersecciones),\n" +
                "\tSolucion = SolucionAux.\n" +
                "    \n" +
                "resolver(ListaPalabras, Aux, Solucion, ListaIntersecciones):-\n" +
                "\tsolucionGratis(ListaPalabras, Aux, Solucion, ListaIntersecciones).";
        return respuesta;
    }

}
