package fiuba.algo3.modelo.mapa;

import java.util.ArrayList;
import java.util.Hashtable;
import java.io.File;
import java.io.FileOutputStream;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import fiuba.algo3.modelo.Nivel;
import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.objetosEncontrables.*;
import fiuba.algo3.modelo.vehiculos.Conductor;
import fiuba.algo3.modelo.vehiculos.Vehiculo;


public class Mapa {
    
	private ArrayList<ArrayList<Celda>> celdas;
	private int filas;
	private int columnas;

	private Mapa(){}
	public Mapa(int cantManzanasAncho, int cantManzanasAlto) {
		this.celdas = new ArrayList<ArrayList<Celda>>();
		this.filas = (cantManzanasAlto*2)+1;
		this.columnas = (cantManzanasAncho*2)+1;
		for (int x = 0; x<this.columnas ; x++){
			ArrayList<Celda> columna = new ArrayList<Celda>();
			for (int y = 0; y < this.filas; y++){
				columna.add(new Celda(this, new Coordenada(x, y)));
			}
			this.celdas.add(columna);            
    	}
	}

	public int getCantidadDeFilas() {
		return this.filas;
	}

	public int getCantidadDeColumnas() {
		return this.columnas;
	}
	
	public void setCantidadDeFilas(int filas) {
		this.filas=filas;
	}

	public void setCantidadDeColumnas(int columnas) {
		this.columnas=columnas;
	}

	public Celda getCeldaEn(Coordenada unaCoordenada) throws UbicacionEnMapaException  {
		if (!this.coordenadaValida(unaCoordenada)){
			throw new UbicacionEnMapaException();
		}
		ArrayList<Celda> fila = this.celdas.get(unaCoordenada.getX());
		return fila.get(unaCoordenada.getY());
	}
	
	public boolean coordenadaValida(Coordenada unaCoordenada) {
		return (unaCoordenada.getX() <= this.getCantidadDeColumnas()-1 && unaCoordenada.getX() >= 0) &&
			(unaCoordenada.getY() <= this.getCantidadDeFilas()-1 && unaCoordenada.getY() >= 0);
		}
	
	public Element serializar(){
		Element nodoMapa = new Element("mapa");
		nodoMapa.setAttribute("filas", Integer.toString(this.filas));
		nodoMapa.setAttribute("columnas", Integer.toString(this.columnas));
		for (int x = 0; x<this.columnas ; x++)
			for (int y = 0; y < this.filas; y++){	
				if ((celdas.get(x).get(y).getContenido())!=null){
				nodoMapa.addContent((celdas.get(x)).get(y).serializar());}
			}
			
		return nodoMapa;
	}
	
	public void guardar(){
		try{
		Document docMapa =new Document();
		Element mapa = this.serializar();
		
		docMapa.setRootElement(mapa);
		XMLOutputter xmlOutput =new XMLOutputter(Format.getPrettyFormat());
		xmlOutput.output(docMapa,new FileOutputStream(new File("./src/nivelFacil.xml")));
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public static Mapa deserializarse(Element nodoMapa,Nivel nivel, Vehiculo unVehiculo ){
		Hashtable<String,ContenidoDeCelda> clases = new Hashtable<String,ContenidoDeCelda>() ;
		clases.put("Control", new ControlPolicial());
		clases.put("Pozo", new Pozo());
		clases.put("Piquete", new Piquete());
		clases.put("Llegada", new Llegada());
		clases.put("Cambio", new CambioDeVehiculo());
		clases.put("Snorlax", new Snorlax());
		clases.put("Desfavorable",new SorpresaDesfavorable());
		clases.put("favorable",new SorpresaFavorable());
		clases.put("Conductor",new Conductor(unVehiculo,new Arriba(),5));
		
		Mapa unMapa = new Mapa();
		unMapa.setCantidadDeFilas(Integer.parseInt(nodoMapa.getAttributeValue("filas")));
		unMapa.setCantidadDeColumnas(Integer.parseInt(nodoMapa.getAttributeValue("columnas")));
		unMapa.celdas = new ArrayList<ArrayList<Celda>>();
		for (int x = 0; x<unMapa.getCantidadDeColumnas() ; x++){
			ArrayList<Celda> columna = new ArrayList<Celda>();
			for (int y = 0; y < unMapa.getCantidadDeFilas(); y++){
				columna.add(new Celda(unMapa, new Coordenada(x, y)));
			}
			unMapa.celdas.add(columna);            
    	}
		
		for(Element nodoCelda : nodoMapa.getChildren("celda")){
			Coordenada coordenada= Coordenada.deserializarse(nodoCelda.getChild("coordenada"));
			Celda celda = unMapa.getCeldaEn(coordenada);
			celda.agregarContenido(clases.get((nodoCelda.getChild("contenido").getAttributeValue("tipoDeEncontrable"))).clonar());
			if ((nodoCelda.getChild("contenido").getAttributeValue("tipoDeEncontrable")).equals("Conductor")){
				Conductor cond  =(Conductor) celda.getContenido();
				nivel.setConductor(cond);
				nivel.getConductor().addObserver(nivel);
			}
		
		}
	
		return unMapa;		
	}	
}	