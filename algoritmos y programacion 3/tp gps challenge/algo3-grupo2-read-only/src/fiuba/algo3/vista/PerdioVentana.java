package fiuba.algo3.vista;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import fiuba.algo3.modelo.Juego;

public class PerdioVentana extends JFrame implements ActionListener {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private JButton botonMenu, botonSalir;

	public PerdioVentana(Juego unJuego){
		getContentPane().setLayout(new FlowLayout());
		setLocation(500,200);
		setVisible(true);
		setSize(300,150);
		//setBounds(400,250, 400,400);
		setTitle("Te quedaste sin movimientos...");
		
		String str = "<html>"
				+ "<FONT FACE=verdana"
				+ "<br>"
				+ " Lo siento, "+ unJuego.getUsuarioActual().getNombre() + ", Perdiste... <br>"
				+ " Hiciste " + Integer.toString(unJuego.getPuntajeAcumulado()) +" puntos.<br>"
				+ " Mejor suerte para la proxima! <br>"
				+ "<br>"
				+ "</html></font>";
		
		JLabel texto = new JLabel(str);
		add(texto);
		
		//Agrego los botones
		botonMenu = new JButton("Menu Principal");
		botonSalir = new JButton("Salir");
		add(botonMenu);
		add(botonSalir);
		
		botonMenu.addActionListener(this);
		botonSalir.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
        if (e.getSource()== botonMenu) {
        dispose();
        VentanaInicial unaVentana = new VentanaInicial(new Juego());
        	
        }
        if (e.getSource() == botonSalir){
        	System.exit(0);
        }
    }
		
}