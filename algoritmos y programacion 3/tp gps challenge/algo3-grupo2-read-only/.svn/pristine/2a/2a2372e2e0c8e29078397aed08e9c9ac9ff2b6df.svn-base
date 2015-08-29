package fiuba.algo3.vista;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.util.Hashtable;

import javax.swing.ImageIcon;
import javax.swing.JPanel;

import fiuba.algo3.modelo.Nivel;
import fiuba.algo3.modelo.coordenadas.*;
import fiuba.algo3.modelo.mapa.*;
import fiuba.algo3.modelo.vehiculos.*;
import fiuba.algo3.modelo.objetosEncontrables.*;
import fiuba.algo3.vista.pintores.*;

public class PantallaDelNivel extends JPanel {
	
	private static final long serialVersionUID = 9158068573854911242L;
	private int MARGEN_IZQUIERDO = 8;
	private int MARGEN_SUPERIOR = 50;
	private int TAMANIO_ICONOS_MENU = 40;
	
	final int ANCHO_PANTALLA_NIVEL = 600 - MARGEN_IZQUIERDO;
	final int ALTO_PANTALLA_NIVEL = 600 - MARGEN_SUPERIOR;
	
	//Ya aparecen en Ventana, deberian juntarse
	final int RESOLUCIONX = 800;
	final int RESOLUCIONY = 600;
	
	private Nivel nivel;
	private int anchoCelda;
	private int altoCelda;
	private ImageIcon imagen;
	
	private Hashtable<Class<?>, Pintor> hash;
	
	public PantallaDelNivel(Nivel unNivel){
		/*
		 * Esto es lo que se ejecuta cuando se llama al constructor de la clase.
		 * Luego de llamarse al constructor, automaticamente se llama al metodo
		 * PAINT.
		 */
		
		this.hash = new Hashtable<Class<?>, Pintor>();
		this.hash.put(Auto.getInstancia().getClass(), new PintorConductor());
		this.hash.put(Moto.getInstancia().getClass(), new PintorConductor());
		this.hash.put(TodoTerreno.getInstancia().getClass(), new PintorConductor());
		this.hash.put((new Pozo()).getClass(), new PintorPozo2());
		this.hash.put((new Piquete()).getClass(), new PintorPiquete());
		this.hash.put((new ControlPolicial()).getClass(), new PintorControlPolicial());
		this.hash.put((new Snorlax()).getClass(), new PintorSnorlax());
		this.hash.put((new SorpresaFavorable()).getClass(), new PintorSorpresa());
		this.hash.put((new SorpresaDesfavorable()).getClass(), new PintorSorpresa());
		this.hash.put((new CambioDeVehiculo()).getClass(), new PintorSorpresa());
		this.hash.put((new Llegada()).getClass(), new PintorLlegada());
		
		this.actualizarParametrosGlobalesPara(unNivel);
	}
	
	public void actualizarParametrosGlobalesPara(Nivel unNivel){
		setBackground(Color.green);
		this.imagen = new ImageIcon(getClass().getResource("/imagenes/PantallaDeNivel_background.jpg"));
		this.nivel = unNivel;
		this.anchoCelda = ANCHO_PANTALLA_NIVEL / this.nivel.getMapa().getCantidadDeColumnas();
		this.altoCelda = ALTO_PANTALLA_NIVEL / this.nivel.getMapa().getCantidadDeFilas();
	}
	
	public Coordenada coordenadaModeloAVista(Coordenada unaCoordenada, int cantFilasMapa){
		return new Coordenada(unaCoordenada.getX()*anchoCelda, (cantFilasMapa-1-unaCoordenada.getY())*altoCelda);
	}

	public void pintarCalles(Graphics g){
		Mapa mapa = this.nivel.getMapa();
		int cantFilasMapa = mapa.getCantidadDeFilas();
		int cantColumnasMapa = mapa.getCantidadDeColumnas();
		
		//Pinta las CALLES
		for (int j = cantFilasMapa-1; j >= 0; j--) {
			for (int i = cantColumnasMapa-1; i >= 0; i--) {
				Coordenada coordenadaVista = this.coordenadaModeloAVista(new Coordenada(i,j), cantFilasMapa);
				new PintorCalle().pintar(g, coordenadaVista, anchoCelda, altoCelda);
			}
		}
	}
	
	public void pintarManzanas(Graphics g){
		Mapa mapa = this.nivel.getMapa();
		Conductor unConductor = this.nivel.getConductor();
		int cantFilasMapa = mapa.getCantidadDeFilas();
		int cantColumnasMapa = mapa.getCantidadDeColumnas();
		
		//Pinta las MANZANAS
		for (int j = cantFilasMapa-2; j >= 0; j-=2) {
			for (int i = cantColumnasMapa-2; i >= 0; i-=2) {
				Celda unaCelda = mapa.getCeldaEn(new Coordenada(i,j));
				if (unaCelda.esVisiblePara(unConductor)){
					Coordenada coordenadaVista = this.coordenadaModeloAVista(new Coordenada(i,j), cantFilasMapa);
					new PintorManzana().pintar(g, coordenadaVista, anchoCelda, altoCelda);
				}
			}
		}
	}
	
	public void pintarObjetosEncontrables(Graphics g){
		Mapa mapa = this.nivel.getMapa();
		Conductor unConductor = this.nivel.getConductor();
		int cantFilasMapa = mapa.getCantidadDeFilas();
		int cantColumnasMapa = mapa.getCantidadDeColumnas();
		
		for (int j = cantFilasMapa-1; j >= 0; j--) {
			for (int i = cantColumnasMapa-1; i >= 0; i--) {
				Coordenada coordenadaVista = this.coordenadaModeloAVista(new Coordenada(i,j), cantFilasMapa);
				Celda unaCelda = mapa.getCeldaEn(new Coordenada(i,j));
				if (unaCelda.esVisiblePara(unConductor)){
					//Hardcodeo de objetos, pasar a hash cuando se pueda.
					
					
					if (unaCelda.getContenido() != null){
						if (unaCelda.getContenido() instanceof Conductor)
							new PintorConductor().pintar(g, unConductor, coordenadaVista, anchoCelda, altoCelda);
						else
							this.hash.get(unaCelda.getContenido().getClass()).pintar(g, coordenadaVista, anchoCelda, altoCelda);
					}
				}
				else{
					new PintorZonaNoVisible().pintar(g, coordenadaVista, anchoCelda, altoCelda);
				}
			}
		}
	}

	public void pintarPanelDerecho(Graphics g){
		g.setFont(new Font("Verdana", Font.BOLD, 14));
		g.setColor(Color.BLUE);
		g.drawString(this.nivel.getJuegoActual().getUsuarioActual().getNombre(), ANCHO_PANTALLA_NIVEL, 25);
		g.drawString("Tienes "+(String)Integer.toString(this.nivel.getJuegoActual().getPuntajeAcumulado()) + " puntos!", ANCHO_PANTALLA_NIVEL, 50);
		g.drawString("Cuidado, te quedan ", ANCHO_PANTALLA_NIVEL, 75);
		g.drawString((String)Integer.toString(nivel.getMovimientosRestantes()) + " movimientos!", ANCHO_PANTALLA_NIVEL, 100);
		
		g.setColor(Color.black);
		int yVehiculo = 140;
		g.drawString("Vehiculo Actual: ", ANCHO_PANTALLA_NIVEL, yVehiculo);
		g.fillRect(600-2, yVehiculo+10-2, TAMANIO_ICONOS_MENU+4, TAMANIO_ICONOS_MENU+4);
		new PintorCalle().pintar(g, new Coordenada(600, yVehiculo+10), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
		new PintorConductor().pintar(g, this.nivel.getConductor(), new Coordenada(600, yVehiculo+10), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
		g.drawString(this.nivel.getConductor().getVehiculo().getClass().getSimpleName(), ANCHO_PANTALLA_NIVEL + TAMANIO_ICONOS_MENU + 16 , yVehiculo+30);

		g.drawString("Bonus de nivel: " + (String)Integer.toString(nivel.getPuntajePorMovimientoSobrante()) + "x", ANCHO_PANTALLA_NIVEL, 230);
		g.setFont(new Font("Verdana", Font.BOLD, 16));
		int yBaseEnReferencias = 300;
		int yRelativaEnReferencias = 40;
		int posicionXreferencias = RESOLUCIONX - TAMANIO_ICONOS_MENU - 15;
		g.drawString("REFERENCIAS: ", ANCHO_PANTALLA_NIVEL, yBaseEnReferencias - 20);
		g.setFont(new Font("Verdana", Font.BOLD, 12));
		g.drawString("Llegada: ", ANCHO_PANTALLA_NIVEL, 20 + yBaseEnReferencias + yRelativaEnReferencias * 0);
		new PintorLlegada().pintar(g, new Coordenada (posicionXreferencias, yBaseEnReferencias + yRelativaEnReferencias * 0), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
		g.drawString("Sorpresa: ", ANCHO_PANTALLA_NIVEL, 20+ yBaseEnReferencias + yRelativaEnReferencias * 1);
		new PintorSorpresa().pintar(g, new Coordenada (posicionXreferencias, yBaseEnReferencias + yRelativaEnReferencias * 1), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
		g.drawString("Pozo: ", ANCHO_PANTALLA_NIVEL, 20 + yBaseEnReferencias + yRelativaEnReferencias * 2);
		new PintorPozo2().pintar(g, new Coordenada (posicionXreferencias, yBaseEnReferencias + yRelativaEnReferencias * 2), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
		g.drawString("Control Policial: ", ANCHO_PANTALLA_NIVEL, 20 + yBaseEnReferencias + yRelativaEnReferencias * 3);
		new PintorControlPolicial().pintar(g, new Coordenada (posicionXreferencias, yBaseEnReferencias + yRelativaEnReferencias * 3), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
		g.drawString("Piquete: ", ANCHO_PANTALLA_NIVEL, 20 + yBaseEnReferencias + yRelativaEnReferencias * 4);
		new PintorPiquete().pintar(g, new Coordenada (posicionXreferencias, yBaseEnReferencias + yRelativaEnReferencias * 4), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
		g.drawString("Snorlax: ", ANCHO_PANTALLA_NIVEL, 20 + yBaseEnReferencias + yRelativaEnReferencias * 5);
		new PintorSnorlax().pintar(g, new Coordenada (posicionXreferencias, yBaseEnReferencias + yRelativaEnReferencias * 5), TAMANIO_ICONOS_MENU, TAMANIO_ICONOS_MENU);
				
	}
	
	public void paint(Graphics g) {
		g.drawImage(this.imagen.getImage(), 0 , 0, 800, 600, null);
		
		this.pintarCalles(g);
		this.pintarManzanas(g);
		this.pintarObjetosEncontrables(g);	
		this.pintarPanelDerecho(g);
	}
}