package fiuba.algo3.modelo.mapa;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.Coordenada;

public class MapaTest {
	@Test
	public void testDeberiaPoderCrearUnMapaConCiertaDimension(){
		Mapa unMapa = new Mapa(2,2);
		Assert.assertEquals(5, unMapa.getCantidadDeFilas());
		Assert.assertEquals(5, unMapa.getCantidadDeColumnas());
	}
	
	@Test
	public void testDeberiaObtenerCeldaDeUnaCoordenada(){
		Mapa unMapa = new Mapa(2,2);
		Celda unaCelda = unMapa.getCeldaEn(new Coordenada(3, 2));
		Assert.assertEquals(new Coordenada(3, 2), unaCelda.getCoordenada());
	}
	
	@Test
	public void testDeberiaSerInvalidaLaCoordenada(){
		Mapa unMapa = new Mapa (2,2);
		Coordenada unaCoordenada = new Coordenada (5,5);
		Assert.assertEquals (false, unMapa.coordenadaValida(unaCoordenada));
	}
	
	@Test(expected = UbicacionEnMapaException.class) 
	public void testDeberiaLanzarExcepcionSiPidoUnaCeldaEnUnaCoordenadaFueraDeRango(){
		Mapa unMapa = new Mapa (2,2);
		//La ubicacion (5,5) esta fuera del mapa, el mapa va de (0,0) a (4,4)
		Coordenada unaCoordenada = new Coordenada (5, 5);
		unMapa.getCeldaEn(unaCoordenada);
	}
	
	@Test(expected = UbicacionEnMapaException.class) 
	public void testDeberiaLanzarExcepcionSiPidoUnaCeldaEnUnaCoordenadaFueraDeRango2(){
		Mapa unMapa = new Mapa (2,2);
		//La ubicacion 4, 4 esta fuera del mapa, el mapa va de (0,0) a (3,3)
		Coordenada unaCoordenada = new Coordenada (-1, -1);
		unMapa.getCeldaEn(unaCoordenada);
	}
	
}