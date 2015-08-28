package fiuba.algo3.modelo.objetosEncontrables;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;

import fiuba.algo3.modelo.vehiculos.Auto;
import fiuba.algo3.modelo.vehiculos.Moto;
import fiuba.algo3.modelo.vehiculos.TodoTerreno;

public class LlegadaTest {
	
	@Test
	public void LaLlegadaDeberiaDejarPasarALasMotos(){
		Llegada laLlegada=new Llegada();
		Moto unaMoto= Moto.getInstancia();
		Assert.assertEquals(false,laLlegada.dejaPasar(unaMoto));
	}

	@Test
	public void LaLLegadaNoDeberiaDejarPasarALosAutos(){
		Llegada laLlegada=new Llegada();
		Auto unAuto=Auto.getInstancia();
		Assert.assertEquals(false,laLlegada.dejaPasar(unAuto));
	}

	@Test
	public void laLlegadaNoDeberiaDejarPasarALosTodoTerreno(){
		Llegada laLlegada=new Llegada();
		TodoTerreno unTodoTerreno=TodoTerreno.getInstancia();
		Assert.assertEquals(false,laLlegada.dejaPasar(unTodoTerreno));
	}

}
