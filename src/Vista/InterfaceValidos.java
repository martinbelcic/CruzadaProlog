package Vista;

import Controlador.Controlador;

import java.util.ArrayList;

import javax.swing.JCheckBox;

public interface InterfaceValidos {
    void setControlador(Controlador controlador);
    void arrancar();
    void matar();
    ArrayList<JCheckBox> getListaCheck();
    final static String ACEPTAR = "AceptarVal";
}
