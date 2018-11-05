package Vista;

import Controlador.Controlador;

import java.util.ArrayList;

import javax.swing.JTextField;

public interface InterfaceGratis {
    void setControlador(Controlador controlador);
    void arrancar();
    void matar();
    ArrayList<JTextField> getTextField();
    
    public static String ACEPTAR = "AceptarGratis";
}
