object barrileteCosmico {

	const destinos = []
	const usuarios = []

	method obtenerDestinosImportantes() {
		return destinos.filter({destino => destino.precio() > 2000})
	}

	method aplicarDescuentos(porcentaje) {
		destinos.forEach({destino => destino.aplicarDescuento(porcentaje)})
	}

	method esExtrema() {
		return destinos.any({destino => destino.esPeligroso()})
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

	// const property equipajeDeclarado = []
	method cargarSaldo(_saldo) {
		saldo = saldo + _saldo
	}

	method saldo() = saldo

	method volarHaciaDestino(nuevoDestino) {
		if (self.puedeVolarA(nuevoDestino)) {
			saldo = saldo - nuevoDestino.precio()
			destinosConocidos.add(nuevoDestino)
		}
	}

	method obtenerKilometrosRecorridos() = destinosConocidos.sum({ destino => destino.precio() * 0.1 })

	method seguirUsuario(nuevoSeguido) = usuariosSeguidos.add(nuevoSeguido)

	method agregarSeguidor(nuevoSeguidor) = usuariosSeguidores.add(nuevoSeguidor)

	method puedeVolarA(nuevoDestino) = self.saldo() > nuevoDestino.precio()

}

class Destino {

	const property nombre
	const equipajeImprescindible = []
	var property precio

	method sugerenciasViaje() = equipajeImprescindible
	
	method esPeligroso(){
		return equipajeImprescindible.any({elemento => elemento.substring(0,6) == "Vacuna"})
	}
	
	method aplicarDescuento(porcentaje){
		equipajeImprescindible.add("Certificado de descuento");
		precio = (precio / 100) * porcentaje;
	}

}

