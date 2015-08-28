package fiuba.algo3.vista.pintores;

import java.awt.Graphics;

import javax.swing.ImageIcon;

import fiuba.algo3.modelo.coordenadas.Coordenada;

public class PintorSorpresa extends Pintor{

	final String PATH = "/imagenes/sorpresa.png";
	
	@Override
	public void pintar(Graphics g, Coordenada unaCoordenadaVista, int anchoCelda, int altoCelda){
		ImageIcon imagenSorpresa = new ImageIcon(getClass().getResource(PATH));
		g.drawImage(imagenSorpresa.getImage(), unaCoordenadaVista.getX(), unaCoordenadaVista.getY(), anchoCelda, altoCelda, null);
	}
}