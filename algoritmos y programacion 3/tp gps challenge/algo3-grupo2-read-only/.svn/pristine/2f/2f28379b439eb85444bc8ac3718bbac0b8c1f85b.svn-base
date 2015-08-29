package fiuba.algo3.modelo.objetosEncontrables;

import fiuba.algo3.modelo.vehiculos.Auto;
import fiuba.algo3.modelo.vehiculos.Moto;
import fiuba.algo3.modelo.vehiculos.TodoTerreno;

public abstract class Sorpresa extends ObjetoEncontrable {
	
	public Sorpresa(){
		super();

	}
	
	protected void destruirse(){
		this.getCelda().quitarContenido();
	}
	
	@Override
	public boolean dejaPasar(Moto unaMoto) {
		return true;
	}

	@Override
	public boolean dejaPasar(Auto unAuto) {
		return true;
	}

	@Override
	public boolean dejaPasar(TodoTerreno unTodoTerreno) {
		return true;
	}
}
