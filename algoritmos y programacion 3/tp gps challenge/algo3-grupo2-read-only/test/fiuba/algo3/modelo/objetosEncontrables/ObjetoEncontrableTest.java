package fiuba.algo3.modelo.objetosEncontrables;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.Coordenada;
import fiuba.algo3.modelo.mapa.Celda;
import fiuba.algo3.modelo.mapa.Mapa;
import fiuba.algo3.modelo.mapa.UbicacionEnMapaException;
import fiuba.algo3.modelo.objetosEncontrables.Pozo;

public class ObjetoEncontrableTest {
	@Test(expected = UbicacionEnMapaException.class) 
	public void vehiculoDeberiaLanzarExcepcionSiSeCreaEnCoordenadaParXyParY(){
		Mapa unMapa = new Mapa(1,1);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Pozo unPozo = new Pozo();
		celdaInicial.agregarContenido(unPozo);
	}
	
	@Test(expected = UbicacionEnMapaException.class) 
	public void vehiculoDeberiaLanzarExcepcionSiSeCreaEnCoordenadaImParXyImParY(){
		Mapa unMapa = new Mapa(1,1);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(3, 3));
		Pozo unPozo = new Pozo();
		celdaInicial.agregarContenido(unPozo);
	}
}