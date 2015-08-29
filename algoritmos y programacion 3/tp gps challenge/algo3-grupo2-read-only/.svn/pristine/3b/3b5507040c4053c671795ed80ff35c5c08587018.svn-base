package fiuba.algo3.modelo;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

public class TestUsuario {
	final String NOMBRE_VALIDO = "Juan";
	final String OTRO_NOMBRE_VALIDO = "Pedro";
	final String NOMBRE_INVALIDO = "";
	
	@Test
	public void testIngresarNombreValido(){
		Usuario unUsuario = new Usuario(NOMBRE_VALIDO);
		Assert.assertEquals(NOMBRE_VALIDO, unUsuario.getNombre());	
	}
	
	@Test(expected = NombreDeUsuarioInvalidoException.class)
	public void testDeberiaLanzarExcepcionAlIngresarUnNombreInvalido(){
		new Usuario(NOMBRE_INVALIDO);	
	}
	
	@Test
	public void testLosDosUsuariosDeberianSerIguales(){
		Usuario unUsuario = new Usuario("NOMBRE_VALIDO");
		Usuario otroUsuario = new Usuario("NOMBRE_VALIDO");
		Assert.assertEquals(unUsuario, otroUsuario);
	}
	
	@Test
	public void testLosDosUsuariosDeberianSerDistintos(){
		Usuario unUsuario = new Usuario("NOMBRE_VALIDO");
		Usuario otroUsuario = new Usuario("OTRO_NOMBRE_VALIDO");
		Assert.assertTrue(unUsuario != otroUsuario);
	}
}