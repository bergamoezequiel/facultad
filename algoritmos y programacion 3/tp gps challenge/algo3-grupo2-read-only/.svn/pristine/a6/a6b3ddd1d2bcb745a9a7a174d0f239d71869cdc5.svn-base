package fiuba.algo3.vista;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import fiuba.algo3.modelo.Juego;

public class GuardarVentana extends JFrame implements ActionListener{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private JButton botonAceptar, botonVolver;
    private JPanel panelCampos;
    private JTextField texto;
    private Juego juego;

	public GuardarVentana(Juego unJuego){                  
		    	
		this.juego = unJuego;
		getContentPane().setLayout(new FlowLayout());
		setVisible(false);
		setBounds(400,250, 400,400);
		setTitle("Guardar");
		setSize(220,100); 
		        
		botonAceptar = new JButton("Aceptar");
		botonVolver = new JButton("Volver");
		        
		panelCampos = new JPanel();
		texto = new JTextField("Ingrese el nombre del archivo.");
		        
		add(texto);
		add(botonAceptar);
		add(botonVolver);
		add(panelCampos);       
		        
		botonAceptar.addActionListener(this);
		botonVolver.addActionListener(this);
		
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
		    }
		    
		    public void actionPerformed(ActionEvent e) {
		    	
		    	
		        if (e.getSource()== botonAceptar) {
		        	this.juego.guardar(this.texto.getText());
		        	JOptionPane.showMessageDialog(null,"Se guardo el archivo correctamente.");
		        	dispose();
		        	
		        }
		        if (e.getSource() == botonVolver){
		        	setVisible(false);
		        }
		    }
}