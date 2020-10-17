/** First Wollok example */
object barrileteCosmico {
	const destinos = []
	const usuarios = []
	method obtenerDestinosImportantes() {
		return 
	}
	method aplicarDescuentos() {
		
	}
	method esExtrema() {
		return 
	}
	method cartaDestinos() {
		return destinos
	}
}

class Usuario {
	const property nombre
	const destinosConocidos = []
	var saldo
	const usuariosSeguidos = []
	const usuariosSeguidores = []
	
	method cargarSaldo(_saldo){
		saldo = saldo + _saldo
	}
	method saldo() {
		return saldo
	}
	method volarHaciaDestino(nuevoDestino){
		if ( self.puedeVolarA(nuevoDestino) ){
			saldo = saldo - nuevoDestino.precio()
			destinosConocidos.add(nuevoDestino)
		}
	}
	method obtenerKilometrosRecorridos(){
		return destinosConocidos.sum( {destino =>  destino.precio()*0.1 } )
	}
	method seguirUsuario(nuevoSeguido){
		usuariosSeguidos.add(nuevoSeguido)
	}
	method agregarSeguidor(nuevoSeguidor){
		usuariosSeguidores.add(nuevoSeguidor)
	}
	method puedeVolarA(nuevoDestino){
		return self.saldo() > nuevoDestino.precio()
	}
}
class Destino {
	
}