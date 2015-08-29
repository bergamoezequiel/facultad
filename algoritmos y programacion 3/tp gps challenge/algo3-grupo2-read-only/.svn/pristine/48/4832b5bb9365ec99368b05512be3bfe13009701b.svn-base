package fiuba.algo3.modelo;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

public class TestElementoTablaDePuntuacion {
	final int PUNTAJE_VALIDO = 145;
	final int PUNTAJE_MAYOR_VALIDO = 200;
	final int PUNTAJE_INVALIDO = -15;
	final Usuario USUARIO_VALIDO = new Usuario("Juan");
	
	@Test
	public void testCreacionValidaDeElementoTablaDePosicion(){
		ElementoTablaDePuntuacion unElementoTablaDePuntuacion = new ElementoTablaDePuntuacion(USUARIO_VALIDO, PUNTAJE_VALIDO);
		Assert.assertEquals(USUARIO_VALIDO.getNombre(), unElementoTablaDePuntuacion.getNombre());	
		Assert.assertEquals(PUNTAJE_VALIDO, unElementoTablaDePuntuacion.getPuntaje());
	}
	
	@Test
	public void testElemento1DeberiaSerMayorAElemento2(){
		ElementoTablaDePuntuacion elemento1 = new ElementoTablaDePuntuacion(USUARIO_VALIDO, PUNTAJE_MAYOR_VALIDO);
		ElementoTablaDePuntuacion elemento2 = new ElementoTablaDePuntuacion(USUARIO_VALIDO, PUNTAJE_VALIDO);
		Assert.assertTrue(elemento1.compareTo(elemento2) > 0);
	}
	
	@Test
	public void testElemento1DeberiaSerIgualAElemento2(){
		ElementoTablaDePuntuacion elemento1 = new ElementoTablaDePuntuacion(USUARIO_VALIDO, PUNTAJE_VALIDO);
		ElementoTablaDePuntuacion elemento2 = new ElementoTablaDePuntuacion(USUARIO_VALIDO, PUNTAJE_VALIDO);
		Assert.assertTrue(elemento1.compareTo(elemento2) == 0);
	}
	
	@Test
	public void testElemento1DeberiaSerMenorAElemento2(){
		ElementoTablaDePuntuacion elemento1 = new ElementoTablaDePuntuacion(USUARIO_VALIDO, PUNTAJE_VALIDO);
		ElementoTablaDePuntuacion elemento2 = new ElementoTablaDePuntuacion(USUARIO_VALIDO, PUNTAJE_MAYOR_VALIDO);
		Assert.assertTrue(elemento1.compareTo(elemento2) < 0);
	}
	
}