package fiuba.algo3.modelo.objetosEncontrables;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.objetosEncontrables.Pozo;
import fiuba.algo3.modelo.vehiculos.*;

public class PozoTest {
	@Test
	public void ElPozoTendriaQuePenalizarCon3MovimientosALasMotos(){
        Pozo unPozo= new Pozo();
        Moto unaMoto=Moto.getInstancia();
        Conductor unConductor= new Conductor(unaMoto, new Derecha(), 4);
        unPozo.interactuarConMoto(unConductor);
        Assert.assertEquals(3,unConductor.getMovimientos());
	}
	
	@Test
	public void ElPozoTendriaQuePenalizarCon3MovimientosALosAutos(){
        Pozo unPozo= new Pozo();
        Auto unAuto=Auto.getInstancia();
        Conductor unConductor= new Conductor(unAuto, new Derecha(), 4);
        unPozo.interactuarConAuto(unConductor);
        Assert.assertEquals(3,unConductor.getMovimientos());
	
	}
	
	@Test
	public void ElPozoNoTendriaQuePenalizarALosTodoTerreno(){
        Pozo unPozo= new Pozo();
        TodoTerreno unTodoTerreno=TodoTerreno.getInstancia();
        Conductor unConductor= new Conductor(unTodoTerreno, new Derecha(), 4);
        unPozo.interactuarConTodoTerreno(unConductor);
        Assert.assertEquals(0,unConductor.getMovimientos());
	}
	
	@Test
	public void ElPozoDeberiaDejarPasarALasMotos(){
		Pozo unPozo= new Pozo();
		Moto unaMoto= Moto.getInstancia();
		Assert.assertEquals(true,unPozo.dejaPasar(unaMoto));
	}
	
	@Test
	public void ElPozoDeberiaDejarPasarALosAutos(){
		Pozo unPozo= new Pozo();
		Auto unAuto= Auto.getInstancia();
		Assert.assertEquals(true,unPozo.dejaPasar(unAuto));
	}
	
	@Test
	public void ElPozoDeberiaDejarPasarALosTodoTerreno(){
		Pozo unPozo= new Pozo();
		TodoTerreno unTodoTerreno= TodoTerreno.getInstancia();
		Assert.assertEquals(true,unPozo.dejaPasar(unTodoTerreno));
	}

}