package Controlador;

import Modelo.ErrorInterseccionException;
import Modelo.Grilla;

import Modelo.NoExistePalabraException;
import Modelo.Palabra;

import Modelo.Serializador;

import Vista.InterfaceDimensiones;
import Vista.InterfaceGratis;
import Vista.InterfacePalabras;
import Vista.InterfaceSolucion;
import Vista.InterfaceValidos;
import Vista.VentanaDimensiones;

import Vista.VentanaGratis;

import Vista.VentanaPalabras;

import Vista.VentanaSolucion;

import Vista.VentanaValidos;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import java.util.ArrayList;

import java.util.Iterator;

import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JTextField;

public class Controlador implements ActionListener
{    
    private InterfaceDimensiones dimensiones;
    private InterfacePalabras palabras;
    private InterfaceValidos validos;
    private InterfaceGratis gratis;
    private InterfaceSolucion solucion;
    private Grilla grilla;
    private Serializador serializador;
    
    public Controlador(InterfaceDimensiones dimensiones)
    {
        super();
        this.dimensiones = dimensiones;
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        
        if(e.getActionCommand().equalsIgnoreCase(InterfaceDimensiones.ACEPTAR)){
            int alto = Integer.parseInt(dimensiones.getAlto());
            int ancho = Integer.parseInt(dimensiones.getAncho());
            validos = new VentanaValidos(alto, ancho);
            grilla = new Grilla(ancho, alto);
            this.serializador = new Serializador(grilla);
            validos.setControlador(this);
            dimensiones.matar();
            validos.arrancar();            
        }
        else if(e.getActionCommand().equalsIgnoreCase(InterfaceValidos.ACEPTAR))
        {
            palabras = new VentanaPalabras();
            palabras.setControlador(this);
            //Guardar valores de la grilla
            this.setMatriz(validos.getListaCheck());    
            grilla.buscaPalabras();
            grilla.buscaInterseccion();
            grilla.imprimirPalabras();
            grilla.imprimirIntersecciones();
            validos.matar();   
            palabras.arrancar();
        }
        else if(e.getActionCommand().equalsIgnoreCase(InterfacePalabras.AGREGAR))
        {
            String palabra = palabras.getPalabra();
            grilla.addPalabraLista(palabra.toLowerCase());
            palabras.limpiar();
        }
        else if(e.getActionCommand().equalsIgnoreCase(InterfacePalabras.ACEPTAR)){
            gratis = new VentanaGratis(this.grilla.getFilas(), this.grilla.getCol(), this.grilla);
            gratis.setControlador(this);
            palabras.matar();
            grilla.imprimirLista();
            gratis.arrancar();
        }
        else if(e.getActionCommand().equalsIgnoreCase(InterfaceGratis.ACEPTAR))
        {
            solucion = new VentanaSolucion(this.grilla.getFilas(), this.grilla.getCol(), this.grilla);
            solucion.setControlador(this);
            try {
                this.guadarGratis();
                grilla.imprimirPalabras();
                gratis.matar();
                this.serializador.crearArchivo();
                this.serializador.escribirArchivo();
                grilla.armarSolucion();
                solucion.arrancar();
            } catch (NoExistePalabraException f) {
            } catch (ErrorGratisException f) {
                    System.out.println("Error en gratis");
            } catch (ErrorInterseccionException f) {
            }
        }
        else if(e.getActionCommand().equalsIgnoreCase(InterfaceSolucion.NUEVO))
        {
            dimensiones = new VentanaDimensiones();
            dimensiones.setControlador(this);
            solucion.matar();
            dimensiones.arrancar();
        }
    }
    
    private void setMatriz(ArrayList<JCheckBox> lista){
        int i = 0, j = 0;
        Iterator<JCheckBox> it = lista.iterator();
        while(it.hasNext()){
            JCheckBox actual = it.next();
            if(actual.isSelected()){
                this.grilla.setCeldaTrue(i, j);
            }
            if(j < (this.grilla.getCol() - 1)){
                j++;
            }
            else {
                j = 0;
                i++;
            }
        }
    }

    private void guadarGratis() throws NoExistePalabraException, ErrorGratisException {
        int i = 0, j = -1, ultimoI, ultimoJ, inicioI, inicioJ;
        Iterator<JTextField> it = this.gratis.getTextField().iterator();
        JTextField actual;
        do{
            actual = it.next();
            if(j < (this.grilla.getCol() - 1)){
                j++;
            }
            else {
                j = 0;
                i++;
            }
        } while((it.hasNext() && actual.getText().isEmpty()));
        if(!actual.getText().isEmpty()){
            String palabra = actual.getText().toLowerCase().substring(0, 1);
            inicioI = ultimoI = i;
            inicioJ = ultimoJ = j;
            while(it.hasNext()){
                actual = it.next();
                if(j < (this.grilla.getCol() - 1)){
                    j++;
                }
                else {
                    j = 0;
                    i++;
                }
                if(!actual.getText().isEmpty()){
                    palabra += actual.getText().toLowerCase().substring(0, 1);
                    ultimoI = i;
                    ultimoJ = j;
                }
            }
            String tipo;
            if(inicioI == ultimoI){                
                tipo = "horizontal";
            }
            else if(inicioJ == ultimoJ){
                tipo = "vertical";
            }
            else {
                throw new ErrorGratisException();
            }
            //buscar palabra y correspondiente y guardar el String
            Palabra encontrada = grilla.buscaPalabra(inicioI, inicioJ, tipo);
            encontrada.setPalabra(palabra);
            grilla.removePalabraLista(palabra);
            System.out.println(encontrada);
        }
        else{
            System.out.println("UPS");
        }
    }
}
