package fiuba.algo3.modelo.mapa;

import java.util.Observable;
import org.jdom2.Element;
public abstract class ContenidoDeCelda extends Observable {
	
	protected Celda celda;
	
	public Celda getCelda(){
		return this.celda;
	}
	
	public abstract void setCelda(Celda unaCelda);
	public abstract ContenidoDeCelda clonar();
	
	public void setCeldaNull(){
		this.celda = null;
	}
	
	public abstract Element serializar();
}
