package fiuba.algo3.modelo.objetosEncontrables;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.objetosEncontrables.Snorlax;
import fiuba.algo3.modelo.vehiculos.*;

public class SnorlaxTest {
	@Test
	public void SnorlaxNoTendriaQuePenalizarALasMotos(){
        Snorlax unSnorlax = new Snorlax();
        Moto unaMoto = Moto.getInstancia();
        Conductor unConductor = new Conductor(unaMoto, new Derecha(), 4);
        unSnorlax.interactuarConMoto(unConductor);
        Assert.assertEquals(0, unConductor.getMovimientos());
	}
	
	@Test
	public void SnorlaxNoTendriaQuePenalizarsALosAutos(){
        Snorlax unSnorlax = new Snorlax();
        Auto unAuto = Auto.getInstancia();
        Conductor unConductor = new Conductor(unAuto, new Derecha(), 4);
        unSnorlax.interactuarConAuto(unConductor);
        Assert.assertEquals(0, unConductor.getMovimientos());
	
	}
	
	@Test
	public void SnorlaxNoTendriaQuePenalizarALosTodoTerreno(){
        Snorlax unSnorlax = new Snorlax();
        TodoTerreno unTodoTerreno = TodoTerreno.getInstancia();
        Conductor unConductor = new Conductor(unTodoTerreno, new Derecha(), 4);
        unSnorlax.interactuarConTodoTerreno(unConductor);
        Assert.assertEquals(0, unConductor.getMovimientos());
	}
	
	@Test
	public void ElSnorlaxDeberiaDejarPasarALasMotos(){
		Snorlax unSnorlax = new Snorlax();
		Moto unaMoto = Moto.getInstancia();
		Assert.assertEquals(false, unSnorlax.dejaPasar(unaMoto));
	}
	
	@Test
	public void ElSnorlaxDeberiaDejarPasarALosAutos(){
		Snorlax unSnorlax = new Snorlax();
		Auto unAuto = Auto.getInstancia();
		Assert.assertEquals(false, unSnorlax.dejaPasar(unAuto));
	}
	
	@Test
	public void ElSnorlaxDeberiaDejarPasarALosTodoTerreno(){
		Snorlax unSnorlax = new Snorlax();
		TodoTerreno unTodoTerreno = TodoTerreno.getInstancia();
		Assert.assertEquals(false, unSnorlax.dejaPasar(unTodoTerreno));
	}

}