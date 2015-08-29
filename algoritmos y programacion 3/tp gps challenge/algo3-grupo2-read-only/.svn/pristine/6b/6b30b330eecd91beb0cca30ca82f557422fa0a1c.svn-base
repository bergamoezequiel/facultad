package fiuba.algo3.modelo;

import org.jdom2.Element;

public class Usuario {

	private String nombre; 
	
	@Override
	public boolean equals (Object unObjeto) {
		boolean sonIguales = false;
		
		if (unObjeto instanceof Usuario) {
			Usuario unUsuario = (Usuario) unObjeto;
			if ( this.getNombre() == unUsuario.getNombre() ) {
				sonIguales = true;
			}
		}
		return sonIguales;
	}
	
	public Usuario (String unNombre) throws NombreDeUsuarioInvalidoException {
		if (unNombre == ""){
			throw new NombreDeUsuarioInvalidoException();
		}
		else{
			this.nombre = unNombre;
		}
	}
	
	public String getNombre(){
		return this.nombre;
	}
	
	
	public Element serializar(){
		Element nodoUsuario = new Element("usuario");
		nodoUsuario.setAttribute("nombre", this.nombre);
		return nodoUsuario;
		}
}
