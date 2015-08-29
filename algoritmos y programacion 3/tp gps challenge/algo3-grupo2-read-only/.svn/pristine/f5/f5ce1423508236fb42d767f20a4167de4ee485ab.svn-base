package fiuba.algo3.modelo.objetosEncontrables;

import org.jdom2.Element;

import fiuba.algo3.modelo.mapa.ContenidoDeCelda;
import fiuba.algo3.modelo.vehiculos.*;

public class Llegada extends ObjetoEncontrable implements Interactuable {
	
	@Override
	public void interactuarConMoto(Conductor unConductor) {
		unConductor.encontroLlegada();
	}
	
	@Override
	public void interactuarConAuto(Conductor unConductor) {
		unConductor.encontroLlegada();
	}
	
	@Override
	public void interactuarConTodoTerreno(Conductor unConductor){
		unConductor.encontroLlegada();
	}

	@Override
	public boolean dejaPasar(Moto unaMoto){
		return false;
	}
	
	@Override
	public boolean dejaPasar(Auto unAuto){
		return false;
	}
	
	@Override
	public boolean dejaPasar(TodoTerreno unTodoTerreno){
		return false;
	}
	
	 public Element serializar () {
			Element nodoLlegada = new Element ("contenido");
			nodoLlegada.setAttribute ("tipoDeEncontrable", "Llegada");
			return nodoLlegada;                
	}
	 
	 public ContenidoDeCelda clonar() {
			return (new Llegada());
			
	}
}

	
	

