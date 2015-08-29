package fiuba.algo3.modelo.objetosEncontrables;

import org.jdom2.Element;

import fiuba.algo3.modelo.mapa.ContenidoDeCelda;
import fiuba.algo3.modelo.vehiculos.Auto;
import fiuba.algo3.modelo.vehiculos.Conductor;
import fiuba.algo3.modelo.vehiculos.Moto;
import fiuba.algo3.modelo.vehiculos.TodoTerreno;

public class Snorlax extends ObjetoEncontrable{
	
	public Snorlax(){
		super();
	}

	@Override
	public void interactuarConAuto(Conductor unConductor) {	
	}

	@Override
	public void interactuarConMoto(Conductor unConductor) {		
	}

	@Override
	public void interactuarConTodoTerreno(Conductor unConductor) {
		
	}

	@Override
	public boolean dejaPasar(Auto unAuto) {
		return false;
	}

	@Override
	public boolean dejaPasar(Moto unaMoto) {
		return false;
	}

	@Override
	public boolean dejaPasar(TodoTerreno unTodoTerreno) {
		return false;
	}
	
	 public Element serializar () {
			Element nodoSnorlax = new Element ("contenido");
			nodoSnorlax.setAttribute ("tipoDeEncontrable", "Snorlax");
			return nodoSnorlax;                
		}
	
	 public ContenidoDeCelda clonar() {
			return (new Snorlax());
			
		}

}
