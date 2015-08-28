package fiuba.algo3.vista;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import fiuba.algo3.modelo.Juego;

public class NuevaPartidaListener implements ActionListener {

	private Juego juego;
	
	public NuevaPartidaListener(Juego unJuego){
		this.juego=unJuego;
	}
	
	@Override
	public void actionPerformed(ActionEvent arg0) {
		this.juego.CargarNivelXml("./src/partidasGuardadas/partidaNueva.xml");
	}

}
