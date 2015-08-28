package fiuba.algo3.modelo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Observable;
import java.util.Observer;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import fiuba.algo3.modelo.mapa.Mapa;
import fiuba.algo3.modelo.vehiculos.*;

public class Nivel implements Observer {
	/*
	 * PRECONDICION:
	 * Debe existir un mapa.
	 * Debe existir un conductor en el mapa.
	 * Debe existir una llegada en el mapa.
	 */
	protected String nombre;
	protected Mapa mapa;
	protected Conductor conductor;
	protected int movimientosLimites;
	protected Juego juegoActual;
	protected int puntajePorMovimientoSobrante; 
	
	public Mapa getMapa(){
		return this.mapa;
	}
	public void setMapa(Mapa unMapa){
		this.mapa=unMapa;
	}
	public void setJuego(Juego juego){
		this.juegoActual=juego;
	}
	
	public void setConductor(Conductor conductor){
		this.conductor=conductor;
	}
	
	public Conductor getConductor(){
		return this.conductor;
	}
	
	public int getMovimientosLimites(){
		return this.movimientosLimites;
	}
	public void setPuntajePorMovimientoSobrante(int puntaje){
		this.puntajePorMovimientoSobrante=puntaje;
	}
	public int getPuntajePorMovimientoSobrante(){
		return this.puntajePorMovimientoSobrante;
	}
	public void setMovimientosLimites(int movimientos){
		this.movimientosLimites = movimientos;
	}
	
	
	public int getMovimientosRestantes(){
		return this.movimientosLimites - this.conductor.getMovimientos();
	}
	
	public String getNombre(){
		return this.nombre;
	}
	
	public int getPuntaje(){
		return (getMovimientosRestantes() * puntajePorMovimientoSobrante);
	}
	
	public Juego getJuegoActual(){
		return juegoActual;
	}
	
	@Override
	public void update(Observable o, Object arg) {
		if (getMovimientosRestantes() <= 0){
			this.juegoActual.perdio();
		}
		
		else if (this.conductor.getEncontroLlegada()){
			this.juegoActual.conductorAlcanzoLaLlegadaDelNivelActual();
		}
	}
	public Element serializar(){
		Element nodoNivel= new Element("nivel");
		nodoNivel.setAttribute("Nombre", this.getNombre());
		nodoNivel.setAttribute("MovimientosLimites", Integer.toString(this.movimientosLimites));
		nodoNivel.setAttribute("PuntajePorMovimientoSobrante", Integer.toString(this.puntajePorMovimientoSobrante));
		nodoNivel.addContent(this.mapa.serializar());
		return nodoNivel;
		
	}
	

	public void guardar(){
		try{
		Document docMapa =new Document();
		Element nivel = this.serializar();
		
		docMapa.setRootElement(nivel);
		XMLOutputter xmlOutput =new XMLOutputter(Format.getPrettyFormat());
		xmlOutput.output(docMapa,new FileOutputStream(new File("./src/archivos/nivelMuyDificil.xml")));
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
    }
	
	public void CargarNivelXml(String ruta, Vehiculo unVehiculo){
		SAXBuilder builder = new SAXBuilder();
		try {
			Document lecturaDoc = builder.build(new File(ruta));
			Element root = lecturaDoc.getRootElement();
			
			this.setMovimientosLimites(Integer.parseInt(root.getAttributeValue("MovimientosLimites")));
			this.setPuntajePorMovimientoSobrante(Integer.parseInt(root.getAttributeValue("PuntajePorMovimientoSobrante")));
			Mapa mapa = Mapa.deserializarse(root.getChild("mapa"), this, unVehiculo);
			this.setMapa(mapa);
	    }
	    catch(JDOMException  e){
	    	e.printStackTrace(); 			
	    }
		catch(IOException  e){
			e.printStackTrace(); 			
		}
	}		
}
