package fiuba.algo3.modelo.objetosEncontrables;

import fiuba.algo3.modelo.coordenadas.Coordenada;
import fiuba.algo3.modelo.mapa.Celda;
import fiuba.algo3.modelo.mapa.ContenidoDeCelda;
import fiuba.algo3.modelo.mapa.UbicacionEnMapaException;

public abstract class ObjetoEncontrable extends ContenidoDeCelda implements Interactuable{

	@Override
	public void setCelda(Celda unaCelda) throws UbicacionEnMapaException {
		Coordenada coordenadaInicial = unaCelda.getCoordenada();
		if (coordenadaInicial.getX()%2 == 0 && coordenadaInicial.getY()%2 == 0){
			throw new UbicacionEnMapaException();
		}
		
		if (coordenadaInicial.getX()%2 != 0 && coordenadaInicial.getY()%2 != 0){
			throw new UbicacionEnMapaException();
		}
		this.celda = unaCelda;
	}

}
