package fiuba.algo3.modelo.objetosEncontrables;

import org.jdom2.Element;

import fiuba.algo3.modelo.mapa.ContenidoDeCelda;
import fiuba.algo3.modelo.vehiculos.Auto;
import fiuba.algo3.modelo.vehiculos.Conductor;
import fiuba.algo3.modelo.vehiculos.Moto;
import fiuba.algo3.modelo.vehiculos.TodoTerreno;
import fiuba.algo3.modelo.vehiculos.Vehiculo;

public class CambioDeVehiculo extends Sorpresa {

	public CambioDeVehiculo() {
		super();
	}
	
	@Override
	public void interactuarConMoto(Conductor unConductor) {
		Vehiculo unAuto =Auto.getInstancia();
		unConductor.cambiarDeVehiculo (unAuto);
		this.destruirse();
	}
	
	@Override
	public void interactuarConAuto(Conductor unConductor) {
		Vehiculo unTodoTerreno = TodoTerreno.getInstancia();
		unConductor.cambiarDeVehiculo (unTodoTerreno);
		this.destruirse();
	}
	
	@Override
	public void interactuarConTodoTerreno(Conductor unConductor){
		Vehiculo unaMoto = Moto.getInstancia();
		unConductor.cambiarDeVehiculo (unaMoto);
		this.destruirse();
	}

	 public Element serializar () {
			Element nodoCambio = new Element ("contenido");
			nodoCambio.setAttribute ("tipoDeEncontrable", "Cambio");
			return nodoCambio;                
	}
	 
	 public ContenidoDeCelda clonar() {
			return (new CambioDeVehiculo());
			
	}
	
}


