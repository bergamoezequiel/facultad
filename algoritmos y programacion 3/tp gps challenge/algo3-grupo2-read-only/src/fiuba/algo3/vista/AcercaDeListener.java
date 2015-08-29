package fiuba.algo3.vista;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;


public class AcercaDeListener implements ActionListener{

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getActionCommand().compareTo("Acerca de...")==0){
			JFrame unaVentana = new AcercaDeVentana();
			unaVentana.setVisible(true);
			unaVentana.setAlwaysOnTop(true);
		}		
		
	}


}
	


