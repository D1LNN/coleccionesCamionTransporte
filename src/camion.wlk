object camion {

	const property cosas = []

	method cargar(unaCosa) { cosas.add(unaCosa) }

	method descargar(unaCosa) { cosas.remove(unaCosa) }

	method todoPesoPar() = cosas.all{ cosa => cosa.peso() % 2 == 0 }

	method hayAlgunoQuePesa(peso) = cosas.any{ cosa => cosa.peso() == peso }

	method elDeNivel(nivel) = cosas.find{ cosa => cosa.nivelPeligrosidad() == nivel }

	method pesoTotal() = 1000 + cosas.sum{ cosa => cosa.peso() }

	method excedidoDePeso() = self.pesoTotal() > 2500

	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter{ cosa => cosa.nivelPeligrosidad() > nivel }

	method objetosMasPeligrososQue(unaCosa) = cosas.filter{ cosa => cosa.nivelPeligrosidad() > unaCosa.nivelPeligrosidad() }

	method puedeCircularEnRuta(nivelMaxPeligrosidad) = not self.excedidoDePeso() and not cosas.any{ cosa => cosa.nivelPeligrosidad() > nivelMaxPeligrosidad}

	method tieneAlgoQuePesaEntre(min, max) = cosas.any{ cosa => cosa.peso() <= max and cosa.peso() >= min }

	method cosaMasPesada() = cosas.max{ cosa => cosa.peso() }

	method pesos() = cosas.map{ cosa => cosa.peso() }

}

