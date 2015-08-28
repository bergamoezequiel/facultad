package fiuba.algo3.modelo.vehiculos;

import fiuba.algo3.modelo.objetosEncontrables.*;
import org.jdom2.Element;

public class Moto extends Vehiculo {
	
public static Moto instancia= null;
	
	private Moto(){
		
	}
	
	public static Moto getInstancia(){
		if (instancia==null){
			instancia=new Moto();
		}
		return instancia;
	}
	
	@Override
	public void interactuar(Interactuable unObjetoEncontrable, Conductor unConductor) {
		unObjetoEncontrable.interactuarConMoto(unConductor);
	}

	@Override
	public boolean meDejanPasar(Interactuable unObjetoEncontrable) {
		return unObjetoEncontrable.dejaPasar(this);
	}
	
	  public Element serializar () {
		Element nodoAuto = new Element ("Vehiculo");
		nodoAuto.setAttribute ("tipoDeVehiculo", "Moto");
		return nodoAuto;                
		}
	 
}
