package fiuba.algo3.vista;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

import fiuba.algo3.modelo.Juego;

public class GanoVentana extends JFrame implements ActionListener {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private JButton botonMenu, botonSalir;

	public GanoVentana(Juego unJuego){
		getContentPane().setLayout(new FlowLayout());
		setLocation(500,200);
		setVisible(true);
		setSize(500,150);
		setTitle("Ganaste!");
		
		String str = "<html>"
				+ "<FONT FACE=verdana"
				+ "<br>"
				+ " Felicidades, "+ unJuego.getUsuarioActual().getNombre() + ", ganaste! <br>"
				+ " Por el bonus multiplicador de haber terminado la partida<br>"
				+ " lograste una puntuacion de " + Integer.toString(unJuego.getPuntajeAcumulado()) +" puntos.<br>"
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
        new VentanaInicial(new Juego());
        	
        }
        if (e.getSource() == botonSalir){
        	System.exit(0);
        }
    }
		
}
	


