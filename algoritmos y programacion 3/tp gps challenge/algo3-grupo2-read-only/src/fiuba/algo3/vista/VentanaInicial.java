package fiuba.algo3.vista;

import javax.swing.*;

import fiuba.algo3.modelo.Juego;

import java.awt.event.*;

public class VentanaInicial extends JFrame implements ActionListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	JButton botonNuevo;
	JButton botonExisto;
	JButton botonRanking;
	private Juego juego;
	
	public VentanaInicial(Juego unJuego) {
		this.juego = unJuego;
		setLayout(null);
		setVisible(true);
		setLocationRelativeTo(null);
		setBounds(300,100, 400,400);
		
		setTitle("GPS Challenge");
		botonNuevo = new JButton("Nuevo Usuario");
		botonExisto = new JButton ("Ya tengo un Usuario");
		botonRanking = new JButton ("Ver Ranking");
		
		botonNuevo.setBounds(100,100,200,50);
		botonExisto.setBounds(100,160,200,50);
		botonRanking.setBounds(100,220,200,50);
		
		add(botonNuevo);
		add(botonExisto);
		add(botonRanking);
		
		botonNuevo.addActionListener(this);
		botonExisto.addActionListener(this);
		botonRanking.addActionListener(this);
	}
	
	public void actionPerformed(ActionEvent e) {
		if (e.getSource()== botonNuevo) {
			new NuevoUsuarioVentana(this.juego);
			dispose();
		}
		if (e.getSource() == botonExisto){
			new CargarUsuarioVentana(this.juego);
			dispose();
		}
		
		if (e.getSource() == botonRanking){
			new RankingVentana();
		}
	}
}