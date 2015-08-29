package fiuba.algo3.vista;

import java.awt.Choice;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Iterator;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

import fiuba.algo3.controlador.ControlPorTeclado;
import fiuba.algo3.modelo.Juego;
import fiuba.algo3.modelo.Usuario;
import fiuba.algo3.modelo.vehiculos.Auto;
import fiuba.algo3.modelo.vehiculos.Moto;
import fiuba.algo3.modelo.vehiculos.TodoTerreno;

public class CargarUsuarioVentana extends JFrame implements ActionListener{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JButton botonAceptar, botonVolver;
	private JPanel panelCampos;
	private Choice desplegable;
	private Choice desplegableVehiculo;
	private Juego juego;

	public CargarUsuarioVentana(Juego unJuego){
		this.juego= unJuego;
		getContentPane().setLayout(new FlowLayout());
		setBounds(400,250, 400,400);
		setTitle("Cargar Usuario Existente");
		setVisible(true);
		setSize(260,100); 
				
		botonAceptar = new JButton("Aceptar");
		botonVolver = new JButton("Volver");
				
		panelCampos = new JPanel();
		desplegable = new Choice();
		
		ArrayList<Usuario> listaDeUsuarios = unJuego.getListaDeUsuarios();
		Iterator<Usuario> iterador= listaDeUsuarios.iterator();
		while (iterador.hasNext()){
			  desplegable.add(iterador.next().getNombre());
		  }		
		
		desplegableVehiculo = new Choice();
		desplegableVehiculo.add("Auto");
		desplegableVehiculo.add("Moto");
		desplegableVehiculo.add("TodoTerreno");
				
		add(desplegable);
		add(desplegableVehiculo);
		add(botonAceptar);
		add(botonVolver);
		add(panelCampos);	   
				
		botonAceptar.addActionListener(this);
		botonVolver.addActionListener(this);
	}
			
	public void actionPerformed(ActionEvent e) {
		
		if (e.getSource()== botonAceptar) {
			switch (desplegableVehiculo.getSelectedIndex()) {
			case 0:
				this.juego.iniciarPartida(new Usuario(desplegable.getSelectedItem()), Auto.getInstancia());
				break;
			case 1:
				this.juego.iniciarPartida(new Usuario(desplegable.getSelectedItem()), Moto.getInstancia());
				break;
			default:
				this.juego.iniciarPartida(new Usuario(desplegable.getSelectedItem()), TodoTerreno.getInstancia());
				break;
			}
			
			Ventana unaVentana = new Ventana(this.juego, new ControlPorTeclado(this.juego));
			this.juego.addObserver(unaVentana);
			dispose();	
		}
		if (e.getSource() == botonVolver){
			new VentanaInicial(this.juego);
			dispose();			
		}
	}
	

}