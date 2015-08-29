package fiuba.algo3.controlador;

import java.awt.event.*;

import fiuba.algo3.modelo.Juego;
import fiuba.algo3.modelo.Nivel;
import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.vehiculos.Conductor;

public class ControlPorTeclado {

	private Juego juego;

	public ControlPorTeclado(Juego unJuego) {
		
		this.juego = unJuego;
	}
	
	public KeyListener getKeyListener(){
		return new KeyListener() {
			public void keyPressed(KeyEvent e) {  	    
			}

			@Override
			public void keyReleased(KeyEvent e) {
				int location = e.getKeyCode();	
				Nivel nivelActual = juego.getNivelActual();
				
				if (nivelActual != null){
					Conductor unConductor = nivelActual.getConductor();
					switch(location){
						case KeyEvent.VK_DOWN:
							unConductor.avanzarEnDireccion(new Abajo());
							break;

						case KeyEvent.VK_UP:
							unConductor.avanzarEnDireccion(new Arriba());
							break;

						case KeyEvent.VK_LEFT:
							unConductor.avanzarEnDireccion(new Izquierda());
							break;

						case KeyEvent.VK_RIGHT:
							unConductor.avanzarEnDireccion(new Derecha());
							break;
					}
				}
			}

			@Override
			public void keyTyped(KeyEvent e) {				
			}	
		};
	}
}
