package Vista;

import Controlador.Controlador;

public interface InterfaceDimensiones {
    void setControlador(Controlador controlador);
    String getAlto();
    String getAncho();
    void arrancar();
    void matar();
    final static String ACEPTAR = "AceptarDim";
}
