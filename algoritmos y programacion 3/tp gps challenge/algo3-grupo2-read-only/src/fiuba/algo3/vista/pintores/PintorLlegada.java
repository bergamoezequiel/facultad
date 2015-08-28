package fiuba.algo3.vista.pintores;

import java.awt.Graphics;

import javax.swing.ImageIcon;

import fiuba.algo3.modelo.coordenadas.Coordenada;

public class PintorLlegada extends Pintor{

	final String PATH = "/imagenes/llegada.png";
	
	@Override
	public void pintar(Graphics g, Coordenada unaCoordenadaVista, int anchoCelda, int altoCelda){
		ImageIcon imagenLlegada = new ImageIcon(getClass().getResource(PATH));
		g.drawImage(imagenLlegada.getImage(), unaCoordenadaVista.getX(), unaCoordenadaVista.getY()-(altoCelda*1/3), anchoCelda, altoCelda, null);
	}
}