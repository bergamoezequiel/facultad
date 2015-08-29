package fiuba.algo3.modelo.vehiculos;

import org.jdom2.Element;

import fiuba.algo3.modelo.objetosEncontrables.*;

public class Auto extends Vehiculo {
	
	public static Auto instancia= null;
	
	private Auto(){
		
	}
	public static Auto getInstancia(){
		if (instancia==null){
			instancia=new Auto();
		}
		return instancia;
	}
	@Override
	public void interactuar(Interactuable unObjetoEncontrable, Conductor unConductor) {
		unObjetoEncontrable.interactuarConAuto(unConductor);
	}

	@Override
	public boolean meDejanPasar(Interactuable unObjetoEncontrable) {
		return unObjetoEncontrable.dejaPasar(this);
	}

	 public Element serializar () {
		Element nodoAuto = new Element ("Vehiculo");
		nodoAuto.setAttribute ("tipoDeVehiculo", "Auto");
		return nodoAuto;                
	}
	
}
