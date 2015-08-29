package fiuba.algo3.vista;

import javax.swing.*;

import fiuba.algo3.controlador.ControlPorTeclado;
import fiuba.algo3.modelo.Juego;
import fiuba.algo3.modelo.Usuario;
import fiuba.algo3.modelo.vehiculos.*;

import java.awt.Choice;
import java.awt.FlowLayout;

import java.awt.event.*;
public class NuevoUsuarioVentana extends JFrame implements ActionListener {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	

	private JButton botonAceptar, botonVolver;
	private JPanel panelCampos;
	private JTextField texto;
	private Juego juego;
	private Choice desplegable;
	
	public NuevoUsuarioVentana(Juego unJuego) {   
		this.juego = unJuego;
		getContentPane().setLayout(new FlowLayout());
		setVisible(true);
		setBounds(400,250, 400,400);
		setTitle("Crear Nuevo Usuario");
		setVisible(true);
		setSize(300,100);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
		
		botonAceptar = new JButton("Aceptar");
		botonVolver = new JButton("Volver");
		
		panelCampos = new JPanel();
		texto = new JTextField("Ingresa tu Nombre");
		
		/*
		 * Todo esto es para que cuando se clickee se borre todo.
		 */
		texto.addMouseListener(new MouseListener() {	
			@Override
			public void mouseReleased(MouseEvent e) {
				// TODO Auto-generated method stub	
			}			
			@Override
			public void mousePressed(MouseEvent e) {
				// TODO Auto-generated method stub
			}			
			@Override
			public void mouseExited(MouseEvent e) {
				// TODO Auto-generated method stub				
			}			
			@Override
			public void mouseEntered(MouseEvent e) {
				// TODO Auto-generated method stub				
			}
			@Override
			public void mouseClicked(MouseEvent e) {
				texto.setText("");
			}
		});
		
		desplegable = new Choice();
		desplegable.add("Moto");
		desplegable.add("Auto");
		desplegable.add("TodoTerreno");

		
		
		add(texto);
		add(desplegable);
		add(botonAceptar);
		add(botonVolver);
		add(panelCampos);
		
		
		botonAceptar.addActionListener(this);
		botonVolver.addActionListener(this);
	}
	
	public void actionPerformed(ActionEvent e) {
		
		
		if (e.getSource()== botonAceptar) {
			Usuario usuarioNuevo = new Usuario(texto.getText());
			boolean usuarioValido = this.juego.agregarUsuario(usuarioNuevo);
			
			
			/*
			 * Si el usuario no existia anteriormente esta todo bien
			 * pero si ya existia, le muestro un mensaje de error al
			 * usuario y le vuelvo a abrir esta ventana.
			 */
			if (usuarioValido) {	
				this.juego.guardarListaDeUsuarios();
				switch (desplegable.getSelectedIndex()) {
				case 0:
					this.juego.iniciarPartida(usuarioNuevo, Moto.getInstancia());
					break;
				case 1:
					this.juego.iniciarPartida(usuarioNuevo, Auto.getInstancia());
					break;
				default:
					this.juego.iniciarPartida(usuarioNuevo, TodoTerreno.getInstancia());
					break;
				}
				
				Ventana unaVentana = new Ventana(this.juego, new ControlPorTeclado(this.juego));
				this.juego.addObserver(unaVentana);
				
			} else{
				new NuevoUsuarioVentana(this.juego);
				JOptionPane.showMessageDialog(null,"Ya existe un Usuario con ese Nombre."); 
				
			}
			
			dispose();	
		}
		
		if (e.getSource() == botonVolver){
			dispose();
			new VentanaInicial(this.juego);
		}
	}
}
