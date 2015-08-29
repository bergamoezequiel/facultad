package fiuba.algo3.vista.pintores;

import java.awt.Graphics;

import javax.swing.ImageIcon;

import fiuba.algo3.modelo.coordenadas.Coordenada;

public class PintorControlPolicial extends Pintor{

	final String PATH = "/imagenes/controlPolicial.png";
	
	@Override
	public void pintar(Graphics g, Coordenada unaCoordenadaVista, int anchoCelda, int altoCelda){
		ImageIcon imagenControlPolicial = new ImageIcon(getClass().getResource(PATH));
		g.drawImage(imagenControlPolicial.getImage(), unaCoordenadaVista.getX(), unaCoordenadaVista.getY(), anchoCelda, altoCelda, null);
	}
}