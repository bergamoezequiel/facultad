package fiuba.algo3.modelo.objetosEncontrables;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.objetosEncontrables.ControlPolicial;
import fiuba.algo3.modelo.vehiculos.*;

public class ControlPolicialTest {
	
	final double probabilidadDePararMoto = 0.8;
	final double probabilidadDePararAuto = 0.5;
	final double probabilidadDePararTodoTerreno = 0.3;
	
	@Test
	public void ElControlPolicialTendriaQuePenalizarCon3MovimientosALasMotosDependiendoDelNumeroAleatorio(){
		ControlPolicial unControl = new ControlPolicial();
		Moto unaMoto =Moto.getInstancia();
		Conductor unConductor = new Conductor(unaMoto, new Derecha() , 4);
		
		//Deberia penalizar
		NumeroAleatorio aleatorio = new NumeroAleatorioFalso(probabilidadDePararMoto);
		unControl.dejaPasar(unaMoto, aleatorio);
		unControl.interactuarConMoto(unConductor);
		Assert.assertEquals(3, unConductor.getMovimientos());
		Assert.assertEquals(false, unControl.dejaPasar(unaMoto, aleatorio));
		
		//No deberia penalizar
		aleatorio = new NumeroAleatorioFalso(probabilidadDePararMoto + 0.0000001);
		unControl.dejaPasar(unaMoto, aleatorio);
		unControl.interactuarConMoto(unConductor);
		Assert.assertEquals(3, unConductor.getMovimientos());
		Assert.assertEquals(true, unControl.dejaPasar(unaMoto, aleatorio));
	}
	
	@Test
	public void ElControlPolicialTendriaQuePenalizarCon3MovimientosALosAutosDependiendoDelNumeroAleatorio(){
		ControlPolicial unControl = new ControlPolicial();
		Auto unAuto = Auto.getInstancia();
		Conductor unConductor = new Conductor(unAuto, new Derecha(), 4);
		
		//Deberia penalizar
		NumeroAleatorio aleatorio = new NumeroAleatorioFalso(probabilidadDePararAuto);
		unControl.dejaPasar(unAuto, aleatorio);
		unControl.interactuarConAuto(unConductor);
		Assert.assertEquals(3, unConductor.getMovimientos());
		Assert.assertEquals(false, unControl.dejaPasar(unAuto, aleatorio));
		
		//No deberia penalizar
		aleatorio = new NumeroAleatorioFalso(probabilidadDePararAuto + 0.0000001);
		unControl.dejaPasar(unAuto, aleatorio);
		unControl.interactuarConAuto(unConductor);
		Assert.assertEquals(3, unConductor.getMovimientos());
		Assert.assertEquals(true, unControl.dejaPasar(unAuto, aleatorio));
	}
	
	@Test
	public void ElControlPolicialTendriaQuePenalizarCon3MovimientosALosTodoTerrenoDependiendoDelNumeroAleatorio(){
		ControlPolicial unControl = new ControlPolicial();
		TodoTerreno unTodoTerreno = TodoTerreno.getInstancia();
		Conductor unConductor = new Conductor(unTodoTerreno, new Derecha(), 4);
		
		//Deberia penalizar
		NumeroAleatorio aleatorio = new NumeroAleatorioFalso(probabilidadDePararTodoTerreno);
		unControl.dejaPasar(unTodoTerreno, aleatorio);
		unControl.interactuarConTodoTerreno(unConductor);
		Assert.assertEquals(3, unConductor.getMovimientos());
		Assert.assertEquals(false, unControl.dejaPasar(unTodoTerreno, aleatorio));

		//No deberia penalizar
		aleatorio = new NumeroAleatorioFalso(probabilidadDePararTodoTerreno + 0.0000001);
		unControl.dejaPasar(unTodoTerreno, aleatorio);
		unControl.interactuarConTodoTerreno(unConductor);
		Assert.assertEquals(3, unConductor.getMovimientos());
		Assert.assertEquals(true, unControl.dejaPasar(unTodoTerreno, aleatorio));
	}

}