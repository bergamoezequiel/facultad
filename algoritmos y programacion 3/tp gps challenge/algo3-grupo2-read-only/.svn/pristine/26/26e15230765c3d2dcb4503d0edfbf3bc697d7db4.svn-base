package fiuba.algo3.modelo.objetosEncontrables;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.mapa.Celda;
import fiuba.algo3.modelo.mapa.Mapa;
import fiuba.algo3.modelo.objetosEncontrables.SorpresaDesfavorable;
import fiuba.algo3.modelo.vehiculos.*;

public class SorpresaDesfavorableTest {

	@Test
	public void deberiaAumentarLosMovimientosDeLaMotoAlPasarPorUnaSorpresa(){
		Mapa unMapa = new Mapa(5,5);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = new Conductor( Moto.getInstancia(), new Derecha(), 4);		
		celdaInicial.agregarContenido(unConductor);
		
		Direccion derecha= new Derecha();
		SorpresaDesfavorable unaSorpresaDesfavorable = new SorpresaDesfavorable();
		Celda celdaFinal = unMapa.getCeldaEn(new Coordenada(3, 0));
		celdaFinal.agregarContenido(unaSorpresaDesfavorable);
		
		//No agarra la sorpresa desfavorable todavia.
		unConductor.avanzarEnDireccion(derecha);
		//Agarra la sopresa desfavorable.
		unConductor.avanzarEnDireccion(derecha);
		
		assertEquals(3, unConductor.getMovimientos());
	}
	
	@Test
	public void deberiaAumentarLosMovimientosDelAutoAlPasarPorUnaSorpresa(){
		Mapa unMapa = new Mapa(5,5);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = new Conductor(Auto.getInstancia(), new Derecha(), 4);		
		celdaInicial.agregarContenido(unConductor);
		
		Direccion derecha = new Derecha();
		SorpresaDesfavorable unaSorpresaDesfavorable = new SorpresaDesfavorable();
		Celda celdaFinal = unMapa.getCeldaEn(new Coordenada(3, 0));
		celdaFinal.agregarContenido(unaSorpresaDesfavorable);
		
		//No agarra la sorpresa desfavorable todavia.
		unConductor.avanzarEnDireccion(derecha);
		
		//Agarra la sopresa desfavorable.
		unConductor.avanzarEnDireccion(derecha);
		
		assertEquals(3, unConductor.getMovimientos());
	}
	
	@Test
	public void deberiaAumentarLosMovimientosDeLaTodoTerrenoAlPasarPorUnaSorpresa(){
		Mapa unMapa = new Mapa(5,5);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = new Conductor(TodoTerreno.getInstancia(), new Derecha(), 4);		
		celdaInicial.agregarContenido(unConductor);
		
		Direccion derecha = new Derecha();
		SorpresaDesfavorable unaSorpresaDesfavorable = new SorpresaDesfavorable();
		Celda celdaFinal = unMapa.getCeldaEn(new Coordenada(3, 0));
		celdaFinal.agregarContenido(unaSorpresaDesfavorable);
		
		//No agarra la sorpresa desfavorable todavia.
		unConductor.avanzarEnDireccion(derecha);
		
		//Agarra la sopresa desfavorable.
		unConductor.avanzarEnDireccion(derecha);
		
		assertEquals(3, unConductor.getMovimientos());
	}

	@Test
	public void testLaSorpresaDesfavorableDeberiaDejarPasarALasMotos(){
		SorpresaDesfavorable unaSorpresaDesfavorable = new SorpresaDesfavorable();
		Moto unaMoto = Moto.getInstancia();
		Assert.assertEquals(true, unaSorpresaDesfavorable.dejaPasar(unaMoto));
	}
	
	@Test
	public void testLaSorpresaDesfavorableDeberiaDejarPasarALosAutos(){
		SorpresaDesfavorable unaSorpresaDesfavorable = new SorpresaDesfavorable();
		Auto unAuto = Auto.getInstancia();
		Assert.assertEquals(true, unaSorpresaDesfavorable.dejaPasar(unAuto));
	}
	
	@Test
	public void testLaSorpresaDesfavorableDeberiaDejarPasarALosTodoTerreno(){
		SorpresaDesfavorable unaSorpresaDesfavorable = new SorpresaDesfavorable();
		TodoTerreno unTodoTerreno = TodoTerreno.getInstancia();
		Assert.assertEquals(true, unaSorpresaDesfavorable.dejaPasar(unTodoTerreno));
	}

}