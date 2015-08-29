package fiuba.algo3.modelo.mapa;

import org.jdom2.Element;

import fiuba.algo3.modelo.coordenadas.Coordenada;
import fiuba.algo3.modelo.coordenadas.Direccion;
import fiuba.algo3.modelo.vehiculos.Conductor;

public class Celda{
	
	private Coordenada coordenada;
	private ContenidoDeCelda contenido;
	private Mapa mapa;
	
	public Celda(Mapa unMapa, Coordenada unaCoordenada){
		this.coordenada = unaCoordenada;
		this.contenido = null;
		this.mapa = unMapa;
	}
	
	public ContenidoDeCelda getContenido () {
		return this.contenido;
	}

	public Coordenada getCoordenada () {
		return this.coordenada;
	}
	
	public void agregarContenido(ContenidoDeCelda unContenido) throws UbicacionEnMapaException {
		
		this.contenido = unContenido;
		this.contenido.setCelda(this);
	}

	public void quitarContenido() {
		this.contenido.setCeldaNull();
		this.contenido = null;
	}

	public Celda getVecino(Direccion unaDireccion) {
		Coordenada coordenadaVecina = this.getCoordenada().sumar(unaDireccion.getDireccionComoCoordenada());
		Celda celdaVecina = this.mapa.getCeldaEn(coordenadaVecina);
		return celdaVecina;
	}
	
	public boolean esVisiblePara (Conductor unConductor){
		Celda celdaConductor = unConductor.getCelda();
		double distanciaEntreCoordenadas = this.getCoordenada().calcularDistancia(celdaConductor.getCoordenada());
		return (distanciaEntreCoordenadas <= unConductor.getAlcanceDeVision());
	}
	
	public Element serializar(){
		Element nodoCelda = new Element("celda");
		nodoCelda.addContent(this.coordenada.serializar());
		if (contenido!=null){
			nodoCelda.addContent(this.contenido.serializar());
		}
		return nodoCelda;
		}
	
}