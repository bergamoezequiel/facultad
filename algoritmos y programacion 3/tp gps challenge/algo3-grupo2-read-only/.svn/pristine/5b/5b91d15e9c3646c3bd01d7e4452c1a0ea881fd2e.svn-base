package fiuba.algo3.modelo.coordenadas;

import org.junit.Assert;
import org.junit.Test;

public class CoordenadaTest {
	
	@Test
	public void testDeberiaDevolverSusParametrosCorrectamente(){
		Coordenada unaCoordenada = new Coordenada(2,1);
		Assert.assertEquals(2, unaCoordenada.getX());
		Assert.assertEquals(1, unaCoordenada.getY());
	}
	
	@Test
	public void testDeberiaSerIgualesDosObjetosCoordenadaDistintosConSusMismosParametros(){
		Coordenada unaCoordenada = new Coordenada(2,1);
		Coordenada otraCoordenada = new Coordenada(2,1);
		Assert.assertEquals(unaCoordenada, otraCoordenada);
	}
	
	@Test
	public void testDeberianSerDistintosDosObjetosCoordenadasSiTienenDistintosParametros(){
		Coordenada unaCoordenada = new Coordenada(2,1);
		Coordenada otraCoordenada = new Coordenada(4,4);
		Assert.assertFalse(unaCoordenada.equals(otraCoordenada));
	}
	
	@Test
	public void testDeberiaDevolverFalsoSiComparoCoordenadasConDirecciones(){
		Coordenada unaCoordenada = new Coordenada(2,1);
		Direccion arriba = new Arriba();
		
		Assert.assertFalse(unaCoordenada.equals(arriba));
		
	}
	
	@Test
	public void testSumarDosCoordenadas(){
		Coordenada unaCoordenada = new Coordenada(2,1);
		Coordenada otraCoordenada = new Coordenada(2,1);
		Coordenada sumaDeCoordenadas = unaCoordenada.sumar(otraCoordenada);
		Assert.assertEquals(new Coordenada(4, 2), sumaDeCoordenadas);
	}
	
	@Test
	public void testDeberiaCalcularSuDistanciaConOtraCoordenada(){
		Coordenada unaCoordenada = new Coordenada(0,0);
		Coordenada otraCoordenada = new Coordenada(0,0);
		Assert.assertTrue(unaCoordenada.calcularDistancia(otraCoordenada)==0);
		unaCoordenada = new Coordenada(0,0);
		otraCoordenada = new Coordenada(0,1);
		Assert.assertTrue(unaCoordenada.calcularDistancia(otraCoordenada)==1);
		unaCoordenada = new Coordenada(0,0);
		otraCoordenada = new Coordenada(1,1);
		Assert.assertTrue(unaCoordenada.calcularDistancia(otraCoordenada)==Math.sqrt(2));
	}
	
	@Test
	public void testLaDistanciaEntreEstasCoordenadasDeberiaSer4(){
		Coordenada unaCoordenada = new Coordenada(2,2);
		Coordenada otraCoordenada = new Coordenada(2,6);
		
		Assert.assertTrue(unaCoordenada.calcularDistancia(otraCoordenada)== 4);		
	}

}