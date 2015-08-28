package fiuba.algo3.vista;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;

import fiuba.algo3.modelo.Juego;

public class GuardarListener implements ActionListener{

	private Juego juego;
	
	public GuardarListener(Juego unJuego){
		this.juego = unJuego;
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().compareTo("Guardar")==0){
			JFrame unaVentana = new GuardarVentana(this.juego);
			unaVentana.setVisible(true);
			unaVentana.setAlwaysOnTop(true);
		}		
		
	}


}
