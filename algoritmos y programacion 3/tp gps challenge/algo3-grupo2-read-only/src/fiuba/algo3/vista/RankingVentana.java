package fiuba.algo3.vista;


import javax.swing.JFrame;
import javax.swing.JLabel;

import fiuba.algo3.modelo.TablaDePuntuaciones;

public class RankingVentana extends JFrame{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RankingVentana(){
		add(new PanelGPS());
		TablaDePuntuaciones unaTabla = new TablaDePuntuaciones();
		unaTabla= TablaDePuntuaciones.leerXml();
		

		setLocation(500, 200);
		this.setVisible(true);                 
		this.setTitle("Ranking");
		this.setSize(250,350);
		this.setResizable(true);
		
	
		
		
		                        
		String str = "<html><div style='text-align:center;'>"
				+ "<FONT FACE=verdana"
				+ "<br>"
				+ "<br>"
				+ "<br>"
				+ "<br>"
				+ "<b>Tabla de Posiciones </b><br>"
				+ "<br>"
				+ "<TABLE BORDER WIDTH = '40%'>"
				+ "<TR><TD> Nombre </TD><TD> Puntaje</TD>";
		
				//Muestra como maximo los mejores 6 puntajes
				for (int i = 0; i < 6; i++) {					
						if (i == unaTabla.getTamanio()) break;
						str += "<TR><TD> " + unaTabla.getElementoEnPosicion(i).getNombre()+ "</TD><TD> " + unaTabla.getElementoEnPosicion(i).getPuntaje()+ " </TD>"
						+ "</TR>";
						
				};
				
				str +=  "</TABLE>" 
				+ "<br>"
				+ "<br>"		
				+ "</html></div></font>";
		
		JLabel texto= new JLabel(str);
		this.add(texto);
		}	
}