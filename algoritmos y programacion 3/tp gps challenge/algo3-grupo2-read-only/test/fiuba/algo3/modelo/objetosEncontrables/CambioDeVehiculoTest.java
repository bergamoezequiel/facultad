package fiuba.algo3.modelo.objetosEncontrables;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.mapa.Celda;
import fiuba.algo3.modelo.mapa.Mapa;
import fiuba.algo3.modelo.objetosEncontrables.CambioDeVehiculo;
import fiuba.algo3.modelo.vehiculos.*;


public class CambioDeVehiculoTest {
	
	@Test
	public void ElCambioDeVehiculoDeberiaDejarPasarALasMotos(){
		CambioDeVehiculo unCambioDeVehiculo = new CambioDeVehiculo();
		Moto unaMoto = Moto.getInstancia();
		Assert.assertEquals(true,unCambioDeVehiculo.dejaPasar(unaMoto));
	}
	
	@Test
	public void ElCambioDeVehiculoDeberiaDejarPasarALosAutos(){
		CambioDeVehiculo unCambioDeVehiculo = new CambioDeVehiculo();
		Auto unAuto = Auto.getInstancia();
		Assert.assertEquals(true,unCambioDeVehiculo.dejaPasar(unAuto));
	}
	
	@Test
	public void ElCambioDeVehiculoDeberiaDejarPasarALosTodoTerreno(){
		CambioDeVehiculo unCambioDeVehiculo = new CambioDeVehiculo();
		TodoTerreno unTodoTerreno =TodoTerreno.getInstancia();
		Assert.assertEquals(true,unCambioDeVehiculo.dejaPasar(unTodoTerreno));
	}
	
	@Test
	public void testDeberiaCambiarAutoEnTodoTerreno(){
		Mapa unMapa = new Mapa(6,6);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = new Conductor(Auto.getInstancia(), new Arriba(), 4);		
		celdaInicial.agregarContenido(unConductor);
		
		CambioDeVehiculo unCambioDeVehiculo = new CambioDeVehiculo();
		Celda celdaDelCambio = unMapa.getCeldaEn(new Coordenada(0, 1));
		celdaDelCambio.agregarContenido(unCambioDeVehiculo);
		
		//Paso por el Cambio de Vehiculo.
		unConductor.avanzarEnDireccion(new Arriba());
		
		Assert.assertEquals(TodoTerreno.getInstancia(), unConductor.getVehiculo());
		}
	
	@Test
	public void testDeberiaCambiarMotoEnAuto(){
		
		Mapa unMapa = new Mapa(6,6);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = new Conductor(Moto.getInstancia(), new Arriba(), 4);		
		celdaInicial.agregarContenido(unConductor);
		
		CambioDeVehiculo unCambioDeVehiculo = new CambioDeVehiculo();
		Celda celdaDelCambio = unMapa.getCeldaEn(new Coordenada(0, 1));
		celdaDelCambio.agregarContenido(unCambioDeVehiculo);
		
		//Paso por el Cambio de Vehiculo.
		unConductor.avanzarEnDireccion(new Arriba());
		
		Assert.assertEquals( Auto.getInstancia(), unConductor.getVehiculo());
		}
	
	
	@Test
	public void testDeberiaCambiarTodoTerrenoEnMoto(){
		Mapa unMapa = new Mapa(6,6);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = new Conductor(TodoTerreno.getInstancia(), new Arriba(), 4);		
		celdaInicial.agregarContenido(unConductor);
		
		CambioDeVehiculo unCambioDeVehiculo = new CambioDeVehiculo();
		Celda celdaDelCambio = unMapa.getCeldaEn(new Coordenada(0, 1));
		celdaDelCambio.agregarContenido(unCambioDeVehiculo);
		
		//Paso por el Cambio de Vehiculo.
		unConductor.avanzarEnDireccion(new Arriba());
		
		Assert.assertEquals(Moto.getInstancia(), unConductor.getVehiculo());
		}
}