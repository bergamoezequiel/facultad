package fiuba.algo3.modelo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;


public class TablaDePuntuaciones {
	
	private ArrayList<ElementoTablaDePuntuacion> elementosTablaDePuntuacion;
	
	public TablaDePuntuaciones(){
		this.elementosTablaDePuntuacion = new ArrayList<ElementoTablaDePuntuacion>();
	}
	
	public void agregar(ElementoTablaDePuntuacion unElementoTablaDePuntuacion){
		this.elementosTablaDePuntuacion.add(unElementoTablaDePuntuacion);
		Collections.sort(this.elementosTablaDePuntuacion);
		Collections.reverse(this.elementosTablaDePuntuacion);
	}
	
	public int getTamanio(){
		return this.elementosTablaDePuntuacion.size();
	}
	
	public ElementoTablaDePuntuacion getElementoEnPosicion(int unaPosicion){
		return this.elementosTablaDePuntuacion.get(unaPosicion);
	}
	
	public Element serializar(){
		Element nodoTablaDePuntuacion = new Element("tabla");
		for(int posicion=0;posicion<this.getTamanio();posicion++){
		nodoTablaDePuntuacion.addContent(this.elementosTablaDePuntuacion.get(posicion).serializar());
		}
		return nodoTablaDePuntuacion;
	}
	

	public void guardar(){
		try{
		Document docMapa =new Document();
		Element tabla = this.serializar();
		docMapa.setRootElement(tabla);
		XMLOutputter xmlOutput =new XMLOutputter(Format.getPrettyFormat());
		xmlOutput.output(docMapa,new FileOutputStream(new File("./src/archivos/tabla.xml")));
		
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}	
	public static TablaDePuntuaciones leerXml(){
		TablaDePuntuaciones tabla = new TablaDePuntuaciones();
		SAXBuilder builder = new SAXBuilder();
		try {
			Document lecturaDoc = builder.build(new File("./src/archivos/tabla.xml"));
			Element root = lecturaDoc.getRootElement();
			for(Element nodoElemento : root.getChildren("elemento")){
				ElementoTablaDePuntuacion elementoDeTabla = new ElementoTablaDePuntuacion(nodoElemento);
				tabla.agregar(elementoDeTabla);
			}
	    }
	    catch(JDOMException  e){
	    	e.printStackTrace(); 			
	    }
		catch(IOException  e){
			e.printStackTrace(); 			
		}
	    return  tabla;	
	}	

	
	
}
