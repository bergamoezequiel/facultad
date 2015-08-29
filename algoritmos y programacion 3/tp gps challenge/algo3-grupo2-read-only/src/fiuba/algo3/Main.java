package fiuba.algo3;

import fiuba.algo3.modelo.Juego;
import fiuba.algo3.vista.VentanaInicial;

public class Main {
	public static void main(String args[]){		
		Juego unJuego = new Juego(); //Observado
		new VentanaInicial(unJuego);
		
	}
}