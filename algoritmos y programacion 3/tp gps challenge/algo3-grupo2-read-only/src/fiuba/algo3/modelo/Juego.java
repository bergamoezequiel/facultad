package fiuba.algo3.modelo;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Observable;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import fiuba.algo3.modelo.vehiculos.*;

public class Juego extends Observable {
	
	private final int multiplicadorPorGanarJuego = 5;
	private ArrayList<Usuario> usuarios;  
	private Nivel nivelActual;
	private Usuario usuarioActual;
	private Hashtable<Integer, String> indiceNiveles;

	private int nroNivelActual;
	private TablaDePuntuaciones tablaDePuntuaciones;
	private int puntajeAcumulado;
	
	public Juego (){
		this.indiceNiveles = new Hashtable<Integer, String>();
		this.tablaDePuntuaciones = new TablaDePuntuaciones();
		this.usuarios = new ArrayList<Usuario>();
		this.tablaDePuntuaciones = TablaDePuntuaciones.leerXml();
		this.CargarLista();
		
		this.nroNivelActual = 1;
		String ruta="./src/archivos/nivelVacio.xml";
		this.indiceNiveles.put(1, ruta);
		ruta="./src/archivos/nivelFacil.xml";
		this.indiceNiveles.put(2, ruta);
		ruta="./src/archivos/nivelModerado.xml";
		this.indiceNiveles.put(3, ruta);
		ruta="./src/archivos/nivelDificil.xml";
		this.indiceNiveles.put(4, ruta);
		ruta="./src/archivos/nivelMuyDificil.xml";
		this.indiceNiveles.put(5, ruta);
		

	}
	
	public void iniciarPartida(Usuario unUsuario, Vehiculo unVehiculo){
		this.usuarioActual = unUsuario;
		this.puntajeAcumulado = 0;
		
		Nivel nuevoNivel = new Nivel();
		nuevoNivel.CargarNivelXml(this.indiceNiveles.get(this.nroNivelActual), unVehiculo);
		this.setNivelActual(nuevoNivel);
		this.nivelActual.setJuego(this);
	}
	
	// Devuelve true o false dependiendo si pudo agregarlo o no.
	public boolean agregarUsuario(Usuario unUsuario){
		boolean pudoAgregarlo = false;
		if(!this.usuarios.contains(unUsuario)){
			this.usuarios.add(unUsuario);
			pudoAgregarlo = true;
		}		
		return pudoAgregarlo;
	}

	public void setNivelActual(Nivel unNivel){
		this.nivelActual = unNivel;
	}
	
	public Nivel getNivelActual(){
		return this.nivelActual;
	}
	
	public int getNroNivelActual(){
		return this.nroNivelActual;
	}
	
	public Usuario getUsuarioActual(){
		return this.usuarioActual;
	}
	
	public void setUsuarioActual(Usuario unUsuario){
		this.usuarioActual = unUsuario;
	}
	
	public ArrayList<Usuario> getListaDeUsuarios(){
		return this.usuarios;
	}

	public void pasarDeNivel(){
		this.puntajeAcumulado += this.nivelActual.getPuntaje();
		this.nroNivelActual += 1;
		Nivel nivelSiguiente = new Nivel();
		nivelSiguiente.CargarNivelXml(this.indiceNiveles.get(this.nroNivelActual), this.getNivelActual().getConductor().getVehiculo());
		this.nivelActual = nivelSiguiente;
		this.nivelActual.setJuego(this);
		
		this.setChanged();
		this.notifyObservers("Juego Pasa De Nivel");
	}
	
	public void gano(){		
		this.nroNivelActual = 0;
		nivelActual = null;
		this.puntajeAcumulado *= this.multiplicadorPorGanarJuego;
		this.tablaDePuntuaciones.agregar(new ElementoTablaDePuntuacion(this.getUsuarioActual(), this.puntajeAcumulado));
		this.tablaDePuntuaciones.guardar();
		
		this.setChanged();
		this.notifyObservers("Gano");
	}
	
	public int getPuntajeAcumulado(){
		return this.puntajeAcumulado;
	}
	
	
	public Element serializar(){
		Element nodoJuego= new Element("juego");
		nodoJuego.setAttribute("nroNivelActual", Integer.toString(this.getNroNivelActual()));
		nodoJuego.setAttribute("puntajeAcumulado", Integer.toString(this.getPuntajeAcumulado()));
		return nodoJuego;
	}
	
	public void guardar(String nombre){
		  try{
		  Document docjuego =new Document();
		  Element juego = this.serializar();
		  
		  docjuego.setRootElement(juego); 
		  XMLOutputter xmlOutput =new XMLOutputter(Format.getPrettyFormat());
		  xmlOutput.output(docjuego,new FileOutputStream(new File("./src/partidasGuardadas/" + nombre + ".xml")));
		  
		  }
		  catch(Exception ex){
		   ex.printStackTrace();
		  }
	}
	
	public void CargarNivelXml(String unString){
		SAXBuilder builder = new SAXBuilder();
		try {
			Document lecturaDoc = builder.build(new File(unString));
			Element root = lecturaDoc.getRootElement();
			this.nroNivelActual =  Integer.parseInt(root.getAttributeValue("nroNivelActual"));
			this.puntajeAcumulado =  Integer.parseInt(root.getAttributeValue("puntajeAcumulado"));
			Nivel nuevoNivel = new Nivel();
			nuevoNivel.CargarNivelXml(this.indiceNiveles.get(this.nroNivelActual), this.nivelActual.getConductor().getVehiculo());
			this.setNivelActual(nuevoNivel);
			this.nivelActual.setJuego(this);
	    }

		
	    catch(JDOMException  e){
	    	e.printStackTrace(); 			
	    }
		catch(IOException  e){
			e.printStackTrace(); 			
		}
		
		this.setChanged();
		this.notifyObservers("Juego Pasa De Nivel");
		
	}	
	
	public void perdio() {
		this.nroNivelActual = 0;
		nivelActual = null;
		
		this.tablaDePuntuaciones.agregar(new ElementoTablaDePuntuacion(this.getUsuarioActual(), this.puntajeAcumulado));
		this.tablaDePuntuaciones.guardar();
		
		this.setChanged();
		this.notifyObservers("Perdio");
	}
	
	public int getCantidadDeUsuarios(){
		return this.usuarios.size();
	}
	
	public void conductorAlcanzoLaLlegadaDelNivelActual() {
		this.nivelActual.getConductor().deleteObservers();
		
		if (this.nroNivelActual == this.indiceNiveles.size()){
			this.gano();
		}
		else{
			this.pasarDeNivel();
		}

	}
	
	public void guardarListaDeUsuarios(){
		try{
			  Document docjuego =new Document();
			  Element listaDeUsuarios = new Element("lista");
			  docjuego.setRootElement(listaDeUsuarios); 
			  Iterator<Usuario> iterador= usuarios.iterator();
			  while (iterador.hasNext()){
				  Element nodoUsuario = (iterador.next()).serializar();
				  listaDeUsuarios.addContent(nodoUsuario);
			  }
			  XMLOutputter xmlOutput =new XMLOutputter(Format.getPrettyFormat());
			  xmlOutput.output(docjuego,new FileOutputStream(new File("./src/archivos/Usuarios.xml")));
			  
			  }
			  catch(Exception ex){
			   ex.printStackTrace();
			  }
		}
		
	public void CargarLista(){
	
		SAXBuilder builder = new SAXBuilder();
		try {
			Document lecturaDoc = builder.build(new File("./src/archivos/Usuarios.xml"));


		    Element root = lecturaDoc.getRootElement();
			for(Element nodoUsuario : root.getChildren("usuario")){

				this.agregarUsuario(new Usuario(nodoUsuario.getAttributeValue("nombre")));
			}
	    }

		
	    catch(JDOMException  e){
	    	e.printStackTrace(); 			
	    }
		catch(IOException  e){
			e.printStackTrace(); 			
		}		
	}	
}

