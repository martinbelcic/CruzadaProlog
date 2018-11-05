package Vista;

import Controlador.Controlador;

public interface InterfacePalabras {
    void setControlador(Controlador controlador);
    String getPalabra();
    void arrancar();
    void matar();
    void limpiar();
    
    final static String ACEPTAR = "AceptarPal";
    final static String AGREGAR = "AgregarPal";
}
