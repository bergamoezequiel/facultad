package fiuba.algo3.vista;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;

import fiuba.algo3.modelo.Juego;

public class CargarJuegoListener implements ActionListener{

	private Juego juego;
	
	public CargarJuegoListener(Juego unJuego){
		this.juego = unJuego;
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().compareTo("Cargar")==0){
			JFrame unaVentana = new CargarJuegoVentana(this.juego);
			unaVentana.setVisible(true);
			unaVentana.setAlwaysOnTop(true);
		}		
		
	}


}
