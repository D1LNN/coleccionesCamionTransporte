object knightRider {

	method peso() = 500

	method nivelPeligrosidad() = 10

	method cantBultos() = 1

	method sufrirCambios() {
	}

}

object bumblebee {

	var transformadoEnAuto = true

	method peso() = 800

	method nivelPeligrosidad() = if (transformadoEnAuto) 15 else 30

	method transformar() {
		transformadoEnAuto = not transformadoEnAuto
	}

	method cantBultos() = 2

	method sufrirCambios() {
		if (transformadoEnAuto) self.transformar()
	}

}

object paqueteDeLadrillos {

	var cantidad = 0

	method peso() = cantidad * 2

	method nivelPeligrosidad() = 2

	method cantidadLadrillos(cant) {
		cantidad = cant
	}

	method cantBultos() = if (cantidad < 101) 1 else if (cantidad > 100 and cantidad < 301) 2 else 3

	method sufrirCambios() {
		cantidad += 12
	}

}

object arena {

	var peso = 0

	method peso() = peso

	method nivelPeligrosidad() = 1

	method pesa(unPeso) {
		peso = unPeso
	}

	method cantBultos() = 1

	method sufrirCambios() {
		peso += 20
	}

}

object bateria {

	var estaConMisiles = true

	method peso() = if (estaConMisiles) 300 else 200

	method nivelPeligrosidad() = if (estaConMisiles) 100 else 0

	method cambiarMisiles() {
		estaConMisiles = not estaConMisiles
	}

	method cantBultos() = if (not estaConMisiles) 1 else 2

	method sufrirCambios() {
		if (not estaConMisiles) self.cambiarMisiles()
	}

}

object contenedor {

	const property cosas = []

	method peso() = 100 + cosas.sum{ cosa => cosa.peso() }

	method nivelPeligrosidad() = if (not cosas.isEmpty()) cosas.max{ cosa => cosa.nivelPeligrosidad() }.nivelPeligrosidad() else 0

	method agregar(unaCosa) {
		cosas.add(unaCosa)
	}

	method cantBultos() = 1 + cosas.sum{ cosa => cosa.cantBultos() }

	method sufrirCambios() {
		cosas.forEach{ cosa => cosa.sufrirCambios()}
	}

}

object residuos {

	var peso = 0

	method peso() = peso

	method nivelPeligrosidad() = 200

	method pesa(unPeso) {
		peso = unPeso
	}

	method cantBultos() = 1

	method sufrirCambios() {
		peso += 15
	}

}

object embalaje {

	var envuelve

	method peso() = envuelve.peso()

	method nivelPeligrosidad() = envuelve.nivelPeligrosidad() / 2

	method envuelve(unaCosa) {
		envuelve = unaCosa
	}

	method cantBultos() = 2

	method sufrirCambios() {
	}

}

