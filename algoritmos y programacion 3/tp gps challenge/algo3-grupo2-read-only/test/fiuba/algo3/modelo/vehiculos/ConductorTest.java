package fiuba.algo3.modelo.vehiculos;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.mapa.Celda;
import fiuba.algo3.modelo.mapa.Mapa;
import fiuba.algo3.modelo.mapa.UbicacionEnMapaException;
import fiuba.algo3.modelo.objetosEncontrables.Llegada;

public class ConductorTest {
	
	private Conductor crearConductorValido(){
		return new Conductor(Auto.getInstancia(), new Derecha(), 4);
	}
	
	@Test(expected = UbicacionEnMapaException.class) 
	public void vehiculoDeberiaLanzarExcepcionSiSeCreaEnCoordenadaImpar(){
		Mapa unMapa = new Mapa(1,1);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(1, 0));
		Conductor unConductor = crearConductorValido();
		celdaInicial.agregarContenido(unConductor);
	}
	
	@Test
	public void vehiculoDeberiaTener0MovimientosAlCrearse(){
		Conductor unConductor = crearConductorValido();
		Assert.assertEquals(0, unConductor.getMovimientos());
	}
	
	@Test
	public void vehiculoDeberiaCrearseConUnTipoDeVehiculoAuto(){
		Auto unAuto = Auto.getInstancia();
		Conductor unConductor = crearConductorValido();
		Assert.assertEquals(unAuto, unConductor.getVehiculo());
	}
	
	@Test
	public void conductorDeberiaPoderCambiarDeVehiculo(){
		
		Conductor unConductor = crearConductorValido();
		Moto unaMoto= Moto.getInstancia();
		unConductor.cambiarDeVehiculo(unaMoto);
		Assert.assertEquals(unaMoto, unConductor.getVehiculo());
	}
	@Test
	public void vehiculoDeberiaCrearseConUnaPenalizacionDeAvanceIgualAUno(){
		Conductor unConductor = crearConductorValido();
		Assert.assertEquals(1, unConductor.getPenalizacionDeAvance());
	}

	@Test
	public void deberiaLanzarUnaExcepcionSiIntentoAvanzarAUnLugarFueraDelMapa(){
		Mapa unMapa = new Mapa (1,1);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = crearConductorValido();
		celdaInicial.agregarContenido(unConductor);
		
		//Avanzo a la derecha
		unConductor.avanzarEnDireccion(new Derecha());
		Assert.assertEquals(new Coordenada(2, 0), unConductor.getCelda().getCoordenada());
		
		//No Deberia Poder moverme y deberia lanzar la excepcion..
		unConductor.avanzarEnDireccion(new Derecha());
		
		//Deberia haberme quedado en el mismo lugar.
		Assert.assertEquals(new Coordenada(2, 0), unConductor.getCelda().getCoordenada());		
	}
	
	@Test
	public void vehiculoAlAvanzarDeberiaDesplazarseDosPosicionesSiNoSeEncuentraObstaculosOSorpresas(){
		Mapa unMapa = new Mapa(1,1);
		Celda celdaInicial = unMapa.getCeldaEn(new Coordenada(0, 0));
		Conductor unConductor = crearConductorValido();		
		celdaInicial.agregarContenido(unConductor);
		
		//Avanza (Porque ya estaba orientado hacia la derecha en su creacion)
		unConductor.avanzarEnDireccion(new Derecha());
		Assert.assertEquals(new Coordenada (2, 0) , unConductor.getCelda().getCoordenada());
		Assert.assertEquals(new Derecha(), unConductor.getDireccion());
		
		//Se re orienta hacia arriba
		unConductor.avanzarEnDireccion(new Arriba());
		//Avanza
		unConductor.avanzarEnDireccion(new Arriba());
		Assert.assertEquals(new Coordenada (2, 2), unConductor.getCelda().getCoordenada());
		Assert.assertEquals(new Arriba(), unConductor.getDireccion());
		
		//Se re orienta hacia izquierda
		unConductor.avanzarEnDireccion(new Izquierda());
		//Avanza
		unConductor.avanzarEnDireccion(new Izquierda());
		Assert.assertEquals (new Coordenada(0, 2) , unConductor.getCelda().getCoordenada());
		Assert.assertEquals(new Izquierda(), unConductor.getDireccion());

		//Se re orienta hacia abajo
		unConductor.avanzarEnDireccion(new Abajo());
		//Avanza
		unConductor.avanzarEnDireccion(new Abajo());
		Assert.assertEquals (new Coordenada(0, 0) , unConductor.getCelda().getCoordenada());
		Assert.assertEquals(new Abajo(), unConductor.getDireccion());

	}
	
	@Test
	public void deberiaEncontrarLaLlegadaCuandoInteractuaConLaLlegada(){
		Conductor unConductor = new Conductor(Moto.getInstancia(), new Arriba(), 2);
		Llegada unaLlegada = new Llegada();
		unConductor.getVehiculo().interactuar(unaLlegada, unConductor);
		Assert.assertTrue(unConductor.getEncontroLlegada());
	}
}