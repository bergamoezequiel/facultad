package fiuba.algo3.modelo.coordenadas;

import org.jdom2.Element;

//COORDENADAS CARTESIANAS//
public class Coordenada {
	private int x;
	private int y;
	
	public Coordenada(int coordenadaX, int coordenadaY){
		this.x = coordenadaX;		
		this.y = coordenadaY;	
	}

	@Override
	public boolean equals (Object unObjeto) {
		boolean sonIguales = false;
		
		if (unObjeto instanceof Coordenada) {
			Coordenada unaCoordenada = (Coordenada) unObjeto;
			if ( this.getX() == unaCoordenada.getX() && this.getY() == unaCoordenada.getY() ) {
				sonIguales = true;
			}
		}
		return sonIguales;
	}
	
	public int getX(){
		return this.x;
	}
	
	public int getY(){
		return this.y;
	}
	
	public Coordenada sumar(Coordenada unaCoordenada){
		return new Coordenada (this.x+unaCoordenada.getX(), this.y+unaCoordenada.getY());
	}
	
	public double calcularDistancia(Coordenada unaCoordenada){
		double distanciaXAlCuadrado = Math.pow(this.getX() - unaCoordenada.getX(), 2);
		double distanciaYAlCuadrado = Math.pow(this.getY() - unaCoordenada.getY(), 2);;
		return Math.sqrt(distanciaXAlCuadrado + distanciaYAlCuadrado);
	}
	
	public Element serializar(){
		Element nodoCoordenada = new Element("coordenada");
		nodoCoordenada.setAttribute("x", Integer.toString(this.x));
		nodoCoordenada.setAttribute("y", Integer.toString(this.y));
		return nodoCoordenada;
		}
	
	public static Coordenada deserializarse(Element nodo){
		Coordenada coordenada = new Coordenada (Integer.parseInt(nodo.getAttributeValue("x")),Integer.parseInt(nodo.getAttributeValue("y"))); 
		return coordenada;
	}
		
}
