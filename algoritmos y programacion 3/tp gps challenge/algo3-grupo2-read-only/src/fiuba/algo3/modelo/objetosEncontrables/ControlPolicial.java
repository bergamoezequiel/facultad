package fiuba.algo3.modelo.objetosEncontrables;

import org.jdom2.Element;

import fiuba.algo3.modelo.mapa.ContenidoDeCelda;
import fiuba.algo3.modelo.vehiculos.*;

public class ControlPolicial extends ObjetoEncontrable {
	/*
	 * Se deberia llamar siempre primero al metodo dejarPasar antes que al
	 * interactuar, ya que el dejarPasar es el que determina por probabilidad
	 * si el control esta activo o no.
	 * 
	 * */
	
	int penalizacion;
	/*Probabilidad de quedar demorados por el control policial*/
	final double probabilidadDePararMoto = 0.8;
	final double probabilidadDePararAuto = 0.5;
	final double probabilidadDePararTodoTerreno = 0.3;
	private boolean controlActivo = false;
	
	public ControlPolicial() {
		super();
		this.penalizacion = 3;
	}

	public int obtenerPenalizacion(){
		return this.penalizacion;
	}
	public static ControlPolicial crearInstancia(){
		return (new ControlPolicial());
	}
	
	public void interactuarConMoto(Conductor unConductor) {
		if (this.controlActivo){
			unConductor.variarMovimientosEn(this.obtenerPenalizacion());
		}
	}
	
	public void interactuarConAuto(Conductor unConductor) {
		if (this.controlActivo){
			unConductor.variarMovimientosEn(this.obtenerPenalizacion());
		}
	}
	
	public void interactuarConTodoTerreno(Conductor unConductor) {
		if (this.controlActivo){
			unConductor.variarMovimientosEn(this.obtenerPenalizacion());
		}
	}

	@Override
	public boolean dejaPasar(Moto unaMoto) {
		NumeroAleatorio aleatorio = new NumeroAleatorio();
		return this.dejaPasar(unaMoto, aleatorio);		
	}
	
	public boolean dejaPasar(Moto unaMoto, NumeroAleatorio aleatorio){
		this.controlActivo = false;
		if (aleatorio.obtenerNumero()<=this.probabilidadDePararMoto){
			this.controlActivo = true;
		}
		return !this.controlActivo;
	}
	
	@Override
	public boolean dejaPasar(Auto unAuto) {
		NumeroAleatorio aleatorio = new NumeroAleatorio();
		return this.dejaPasar(unAuto, aleatorio);		
	}
	
	public boolean dejaPasar(Auto unAuto, NumeroAleatorio aleatorio){
		this.controlActivo = false;
		if (aleatorio.obtenerNumero()<=this.probabilidadDePararAuto){
			this.controlActivo = true;
		}
		return !this.controlActivo;
	}
	
	@Override
	public boolean dejaPasar(TodoTerreno unTodoTerreno) {
		NumeroAleatorio aleatorio = new NumeroAleatorio();
		return this.dejaPasar(unTodoTerreno, aleatorio);		
	}
	
	public boolean dejaPasar(TodoTerreno unTodoTerreno, NumeroAleatorio aleatorio){
		this.controlActivo = false;
		if (aleatorio.obtenerNumero()<=this.probabilidadDePararTodoTerreno){
			this.controlActivo = true;
		}
		return !this.controlActivo;
	}
	
	 public Element serializar () {
			Element nodoControl = new Element ("contenido");
			nodoControl.setAttribute ("tipoDeEncontrable", "Control");
			nodoControl.setAttribute("penalizacion", Integer.toString(this.penalizacion));
			nodoControl.setAttribute("penalizacion", Integer.toString(this.penalizacion));
			return nodoControl;                
	}
	
	public ContenidoDeCelda clonar() {
		return (new ControlPolicial());	
	}
	
}