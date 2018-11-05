package Vista;

import Controlador.Controlador;

public class Prueba {
    public Prueba() {
        super();
    }

    public static void main(String[] args) {
        VentanaDimensiones ventana = new VentanaDimensiones();
        Controlador c = new Controlador(ventana);
        ventana.setControlador(c);
        ventana.setVisible(true);
    }
}
