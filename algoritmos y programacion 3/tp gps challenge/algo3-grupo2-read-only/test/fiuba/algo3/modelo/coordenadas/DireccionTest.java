package fiuba.algo3.modelo.coordenadas;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.Abajo;
import fiuba.algo3.modelo.coordenadas.Arriba;
import fiuba.algo3.modelo.coordenadas.Coordenada;
import fiuba.algo3.modelo.coordenadas.Derecha;
import fiuba.algo3.modelo.coordenadas.Direccion;
import fiuba.algo3.modelo.coordenadas.Izquierda;

public class DireccionTest {
	
	@Test
	public void testDeberiaSerIgualesEstosDosObjetosDireccion(){
		Direccion unaDireccion = new Derecha();
		Direccion otraDireccion = new Derecha();
		Assert.assertEquals(unaDireccion, otraDireccion);
	}
	
	@Test
	public void testDeberiaSerDistintosEstosDosObjetosDireccion(){
		Direccion unaDireccion = new Derecha();
		Direccion otraDireccion = new Izquierda();
		Assert.assertFalse(unaDireccion.equals(otraDireccion));
	}
	
	@Test
	public void testgetDireccionIzquierdaComoCoordenada(){
		Direccion unaDireccion = new Izquierda();
		Assert.assertEquals(new Coordenada(-1, 0), unaDireccion.getDireccionComoCoordenada());
	}

	@Test
	public void testgetDireccionDerechaComoCoordenada(){
		Direccion unaDireccion = new Derecha();
		Assert.assertEquals(new Coordenada(1, 0), unaDireccion.getDireccionComoCoordenada());
	}

	@Test
	public void testgetDireccionAbajoComoCoordenada(){
		Direccion unaDireccion = new Abajo();
		Assert.assertEquals(new Coordenada(0, -1), unaDireccion.getDireccionComoCoordenada());
	}
	
	@Test
	public void testgetDireccionArribaComoCoordenada(){
		Direccion unaDireccion = new Arriba();
		Assert.assertEquals(new Coordenada(0, 1), unaDireccion.getDireccionComoCoordenada());
	}
}