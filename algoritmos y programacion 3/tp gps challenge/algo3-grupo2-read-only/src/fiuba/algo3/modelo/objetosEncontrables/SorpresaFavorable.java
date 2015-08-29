package fiuba.algo3.modelo.objetosEncontrables;

import org.jdom2.Element;

import fiuba.algo3.modelo.mapa.ContenidoDeCelda;
import fiuba.algo3.modelo.vehiculos.Conductor;

public class SorpresaFavorable extends Sorpresa {
	double penalizacion;
	
	public SorpresaFavorable() {
		super();
		this.penalizacion = -0.2;
	}

	public void aplicarPenalizacion(Conductor unConductor){
		int penalizacionAAgregar = ((int) Math.floor(unConductor.getMovimientos()*this.penalizacion));
		unConductor.variarMovimientosEn(penalizacionAAgregar);
	}
	
	@Override
	public void interactuarConMoto(Conductor unConductor) {
		aplicarPenalizacion(unConductor);
		this.destruirse();
	}
	
	@Override
	public void interactuarConAuto(Conductor unConductor) {
		aplicarPenalizacion(unConductor);
		this.destruirse();
	}
	
	@Override
	public void interactuarConTodoTerreno(Conductor unConductor){
		aplicarPenalizacion(unConductor);
		this.destruirse();
	}

	public Element serializar () {
		Element nodofavorable = new Element ("contenido");
		nodofavorable.setAttribute ("tipoDeEncontrable", "favorable");
		return nodofavorable;                
	}
	public ContenidoDeCelda clonar() {
		return (new SorpresaFavorable());
		
	}
	
}


