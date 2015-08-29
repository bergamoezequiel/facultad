package fiuba.algo3.modelo.vehiculos;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.Coordenada;

public class VehiculoTest {

	@Test
	public void testEquals(){
		Auto unAuto =Auto.getInstancia();
		Auto otroAuto = Auto.getInstancia();
		Assert.assertEquals(unAuto, otroAuto);
	}
	
	@Test
	public void testNotEquals(){
		Auto unAuto =Auto.getInstancia();
		Moto unaMoto = Moto.getInstancia();
		Assert.assertFalse(unAuto.equals(unaMoto));
	}
	
	@Test
	public void testDeberiaDevolverFalsoSiComparoUnVehiculoConUnaCoordenada(){
		Auto unAuto = Auto.getInstancia();
		Coordenada unaCoorde = new Coordenada (1,1);
		
		Assert.assertFalse(unAuto.equals(unaCoorde));		
	}
}