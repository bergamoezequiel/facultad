package fiuba.algo3.modelo.coordenadas;

import org.jdom2.Element;


public abstract class Direccion {
	
	protected int direccionX;
	protected int direccionY;
	
	@Override
	public boolean equals (Object unObjeto) {
		boolean sonIguales = false;
		
		if (unObjeto instanceof Direccion) {
			Direccion unaDireccion = (Direccion) unObjeto;
			if ( this.getX() == unaDireccion.getX() && this.getY() == unaDireccion.getY() ) {
				sonIguales = true;
			}
		}
		return sonIguales;
	}
	
	public Coordenada getDireccionComoCoordenada(){
		return (new Coordenada(direccionX, direccionY));
	}
	
	private int getX(){
		return this.direccionX;
	}
	
	private int getY(){
		return this.direccionY;
	}
	public Element serializar(){
		Element nodoDireccion = new Element("elemento");
		nodoDireccion.setAttribute("x", Integer.toString(this.direccionX));
		nodoDireccion.setAttribute("y", Integer.toString(this.direccionY));
		return nodoDireccion;
		}
}
