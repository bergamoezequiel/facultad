package fiuba.algo3.vista.pintores;

import java.awt.Graphics;
import java.util.Hashtable;

import javax.swing.ImageIcon;

import fiuba.algo3.modelo.coordenadas.*;

public class PintorMoto extends PintorVehiculo{

	final String PATH_ABAJO = "/imagenes/moto_abajo.png";
	final String PATH_ARRIBA = "/imagenes/moto_arriba.png";
	final String PATH_IZQUIERDA = "/imagenes/moto_izquierda.png";
	final String PATH_DERECHA = "/imagenes/moto_derecha.png";
	
	public PintorMoto() {
		this.indice = new Hashtable<Class<?>, ImageIcon>();	
		this.indice.put(new Abajo().getClass(), new ImageIcon(getClass().getResource(PATH_ABAJO)));
		this.indice.put(new Arriba().getClass(), new ImageIcon(getClass().getResource(PATH_ARRIBA)));
		this.indice.put(new Izquierda().getClass(), new ImageIcon(getClass().getResource(PATH_IZQUIERDA)));
		this.indice.put(new Derecha().getClass(), new ImageIcon(getClass().getResource(PATH_DERECHA)));
	}

	
	@Override
	public void pintar(Graphics g, Coordenada unaCoordenadaVista, int anchoCelda, int altoCelda, Direccion unaDireccion){		
		ImageIcon imagen = this.indice.get(unaDireccion.getClass());
		g.drawImage(imagen.getImage(), unaCoordenadaVista.getX(), unaCoordenadaVista.getY(), anchoCelda, altoCelda, null);
	}
}