package fiuba.algo3.modelo.vehiculos;

import org.jdom2.Element;

import fiuba.algo3.modelo.objetosEncontrables.*;

public class TodoTerreno extends Vehiculo {
	
public static TodoTerreno instancia= null;
	
	private TodoTerreno(){
		
	}
	
	public static TodoTerreno getInstancia(){
		if (instancia==null){
			instancia=new TodoTerreno();
		}
		return instancia;
	}
	
	@Override
	public void interactuar(Interactuable unObjetoEncontrable,	Conductor unConductor) {
		unObjetoEncontrable.interactuarConTodoTerreno(unConductor);
	}

	@Override
	public boolean meDejanPasar(Interactuable unObjetoEncontrable) {
		return unObjetoEncontrable.dejaPasar(this);
	}

	public Element serializar () {
		Element nodoAuto = new Element ("Vehiculo");
		nodoAuto.setAttribute ("tipoDeVehiculo", "TodoTerreno");
		return nodoAuto;                
	}
}