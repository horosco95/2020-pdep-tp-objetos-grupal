object barrileteCosmico {

	const destinos = []

	method agregarDestino(destino){
		destinos.add(destino);
	}

	method obtenerDestinosImportantes() {
		return destinos.filter({destino => destino.precio() > 2000})
	}

	method aplicarDescuento(porcentaje) {
		destinos.forEach({destino => destino.aplicarDescuento(porcentaje)})
	}

	method esExtrema() {
		return destinos.any({destino => destino.esPeligroso()})
	}

	method cartaDestinos() {
		return destinos.map({destino => destino.nombre()})
	}

}

class Usuario {

	const property nombre
	const property destinosConocidos = []
	var saldo
	const property usuariosSeguidos = []

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

	method seguirUsuario(nuevoSeguido){
		self.agregarAListaSeguidos(nuevoSeguido)
		nuevoSeguido.agregarAListaSeguidos(self)
	}
	
	method agregarAListaSeguidos(nuevoSeguido){
		usuariosSeguidos.add(nuevoSeguido)
	}

	method puedeVolarA(nuevoDestino) = self.saldo() > nuevoDestino.precio()

}

class Destino {

	const property nombre
	const equipajeImprescindible = []
	var property precio
	
	method agregarEquipajeRequerido(equipaje){
		equipajeImprescindible.add(equipaje);
	}

	method sugerenciasViaje() = equipajeImprescindible
	
	method esPeligroso(){
		return equipajeImprescindible.any({elemento => elemento.substring(0,6) == "Vacuna"})
	}
	
	method aplicarDescuento(porcentaje){
		equipajeImprescindible.add("Certificado de descuento");
		precio = precio - ((precio / 100) * porcentaje);
	}

}

