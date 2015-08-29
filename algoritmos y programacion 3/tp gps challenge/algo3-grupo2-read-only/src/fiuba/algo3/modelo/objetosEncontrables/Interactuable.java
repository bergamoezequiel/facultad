package fiuba.algo3.modelo.objetosEncontrables;

import fiuba.algo3.modelo.vehiculos.Auto;
import fiuba.algo3.modelo.vehiculos.Conductor;
import fiuba.algo3.modelo.vehiculos.Moto;
import fiuba.algo3.modelo.vehiculos.TodoTerreno;

public interface Interactuable {
	void interactuarConAuto(Conductor unConductor);
	void interactuarConMoto(Conductor unConductor);
	void interactuarConTodoTerreno(Conductor unConductor);
	boolean dejaPasar(Auto unAuto);
	boolean dejaPasar(Moto unaMoto);
	boolean dejaPasar(TodoTerreno unTodoTerreno);
}
