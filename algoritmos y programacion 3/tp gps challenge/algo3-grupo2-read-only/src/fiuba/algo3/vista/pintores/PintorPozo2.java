package fiuba.algo3.vista.pintores;

import java.awt.Graphics;

import javax.swing.ImageIcon;

import fiuba.algo3.modelo.coordenadas.Coordenada;

public class PintorPozo2 extends Pintor{

	final String PATH = "/imagenes/pozo.png";
	
	@Override
	public void pintar(Graphics g, Coordenada unaCoordenadaVista, int anchoCelda, int altoCelda){
		ImageIcon imagenPozo = new ImageIcon(getClass().getResource(PATH));
		g.drawImage(imagenPozo.getImage(), unaCoordenadaVista.getX(), unaCoordenadaVista.getY(), anchoCelda, altoCelda, null);
	}
}
