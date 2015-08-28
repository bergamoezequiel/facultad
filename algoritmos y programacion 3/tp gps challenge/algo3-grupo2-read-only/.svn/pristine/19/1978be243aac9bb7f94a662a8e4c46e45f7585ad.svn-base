package fiuba.algo3.modelo;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

public class TestJuego {

	@Test
	public void testNoDeberiDejarPonerDosUsuariosConElMismoNombre(){
		Juego unJuego = new Juego();
		int cantidadDeUsuariosInicial = unJuego.getCantidadDeUsuarios();
				
		Usuario unUsuario = new Usuario("Rupert");
		Usuario otroUsuario = new Usuario("8871");
		Usuario tercerUsuario = new Usuario("Rupert");
		
		
		Assert.assertTrue(unJuego.agregarUsuario(unUsuario));
		Assert.assertTrue(unJuego.agregarUsuario(otroUsuario));
		Assert.assertFalse(unJuego.agregarUsuario(tercerUsuario));
		
		Assert.assertEquals(cantidadDeUsuariosInicial +2, unJuego.getCantidadDeUsuarios());	
	}
	
	@Test
	public void deberiaAvisarmeSiSePudoCrearUnUsuarioConElNombreDado(){
		Juego unJuego = new Juego();
		Assert.assertTrue(unJuego.agregarUsuario(new Usuario("asdasd123")));
		
		//Agrego un usuario que no existia antes.
		Assert.assertTrue( unJuego.agregarUsuario(new Usuario("jjjiii1")));
	}
	
	

}