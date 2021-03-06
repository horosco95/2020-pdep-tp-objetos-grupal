object barrileteCosmico {

	const destinos = []
	const mediosTransporte = [micro,combi,avion]

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
	
	method armarViaje(nuevoUsuario,nuevoDestino){ //TODO agregar eleccion aleatoria de medio de transporte
		const transporteAleatorio = mediosTransporte.anyOne() 
		nuevoUsuario.viajarHacia(nuevoDestino,transporteAleatorio)
	}

}

class Usuario {

	const property nombre
	const property destinosConocidos = []
	var saldo = 0
	const property usuariosSeguidos = []
	var property origen
	var kilometrosRecorridos = 0

	method cargarSaldo(_saldo) {
		saldo = saldo + _saldo
	}

	method saldo() = saldo

	method viajarHacia(nuevoDestino,medioDeTransporte) {
		if (self.puedeViajarA(nuevoDestino,medioDeTransporte)) {
			saldo = saldo - self.precioViaje(nuevoDestino,medioDeTransporte)
			kilometrosRecorridos += origen.calcularDistanciaAOtro(nuevoDestino)
			self.origen(nuevoDestino)
			destinosConocidos.add(nuevoDestino)
		}
	}

	method obtenerKilometrosRecorridos() = kilometrosRecorridos

	method seguirUsuario(nuevoSeguido){
		self.agregarAListaSeguidos(nuevoSeguido)
		nuevoSeguido.agregarAListaSeguidos(self)
	}
	
	method agregarAListaSeguidos(nuevoSeguido){
		usuariosSeguidos.add(nuevoSeguido)
	}

	method puedeViajarA(nuevoDestino,medioDeTransporte) = self.saldo() >= self.precioViaje(nuevoDestino,medioDeTransporte)

	method precioViaje(nuevoDestino,medioDeTransporte) = nuevoDestino.precio() + origen.calcularDistanciaAOtro(nuevoDestino) * medioDeTransporte.precioPorKilometro()

}

class Localidad {

	const property nombre
	const equipajeImprescindible = []
	var property precio
	const property kilometro
	
	method agregarEquipajeRequerido(equipaje){
		equipajeImprescindible.add(equipaje);
	}

	method sugerenciasViaje() = equipajeImprescindible
	
	method esPeligroso(){
		return equipajeImprescindible.any({elemento => elemento.words().contains("Vacuna")})
	}
	
	method aplicarDescuento(porcentaje){
		equipajeImprescindible.add("Certificado de descuento");
		precio = precio - ((precio / 100) * porcentaje);
	}
	
	method calcularDistanciaAOtro(nuevoDestino){
		const distancia = kilometro - nuevoDestino.kilometro()
		return distancia.abs()
	}

}

object micro {
	method precioPorKilometro() = 5
}

object avion {
	method precioPorKilometro() = 15
}

object combi {
	method precioPorKilometro() = 10
}

