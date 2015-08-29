package fiuba.algo3.vista;


import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;


import javax.swing.JFileChooser;
import javax.swing.JFrame;


import fiuba.algo3.modelo.Juego;

public class CargarJuegoVentana extends JFrame{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private Juego juego;

	public CargarJuegoVentana(Juego unJuego){                  
		    	
		this.juego= unJuego;
		getContentPane().setLayout(new FlowLayout());
		setBounds(400,250, 400,400);
		setTitle("Cargar");
		setVisible(true);
		setSize(600,400); 		     
		
		
		JFileChooser browser = new JFileChooser();
		File carpetaInicial = new File("./src/partidasGuardadas");
		browser.setCurrentDirectory(carpetaInicial);
		browser.addActionListener(new ActionListener() {	
			@Override
			public void actionPerformed(ActionEvent e) {
				jFileChooserActionPerformed(e);
				
			}
		});
		
		//Agrego el browser.
		add(browser);
	}	

	private void jFileChooserActionPerformed(java.awt.event.ActionEvent evt){
		JFileChooser selectorArchivo = (JFileChooser)evt.getSource();
		String command = evt.getActionCommand();
			if (command.equals(JFileChooser.APPROVE_SELECTION)){
		    	File archivoSeleccionado = selectorArchivo.getSelectedFile();
		    	this.juego.CargarNivelXml(archivoSeleccionado.getAbsolutePath());
		    	dispose();
		    } else if (command.equals(JFileChooser.CANCEL_SELECTION)){
		    	dispose();
		    }
	}
	
}