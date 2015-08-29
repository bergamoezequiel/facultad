package fiuba.algo3.modelo.objetosEncontrables;

import org.jdom2.Element;

import fiuba.algo3.modelo.mapa.ContenidoDeCelda;
import fiuba.algo3.modelo.vehiculos.Conductor;

public class SorpresaDesfavorable extends Sorpresa {
	double penalizacion;
	
	public SorpresaDesfavorable() {
		super();
		this.penalizacion = 0.25;
	}
	
	public void aplicarPenalizacion(Conductor unConductor){
		int penalizacionAAgregar = ((int) Math.ceil(unConductor.getMovimientos()*this.penalizacion));
		unConductor.variarMovimientosEn(penalizacionAAgregar);
	}

	@Override
	public void interactuarConAuto(Conductor unConductor) {
		aplicarPenalizacion(unConductor);
		this.destruirse();;
	}

	@Override
	public void interactuarConMoto(Conductor unConductor) {
		aplicarPenalizacion(unConductor);
		this.destruirse();
	}

	@Override
	public void interactuarConTodoTerreno(Conductor unConductor) {
		aplicarPenalizacion(unConductor);
		this.destruirse();
	}

	 public Element serializar () {
			Element nodoDesfavorable = new Element ("contenido");
			nodoDesfavorable.setAttribute ("tipoDeEncontrable", "Desfavorable");
			return nodoDesfavorable;                
		}
	 public ContenidoDeCelda clonar() {
			return (new SorpresaDesfavorable());
			
		}
}


