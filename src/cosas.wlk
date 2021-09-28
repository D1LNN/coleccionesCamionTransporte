object knightRider {

	method peso() = 500
	
	method nivelPeligrosidad() = 10

}

object bumblebee {

	var transformadoEnAuto = true

	method peso() = 800

	method nivelPeligrosidad() = if (transformadoEnAuto) 15 else 30

	method transformar() { transformadoEnAuto = not transformadoEnAuto }

}

object paqueteDeLadrillos {

	var cantidad = 0

	method peso() = cantidad * 2

	method nivelPeligrosidad() = 2

	method cantidadLadrillos(cant) { cantidad = cant }

}

object arena {

	var peso = 0

	method peso() = peso

	method nivelPeligrosidad() = 1

	method pesa(unPeso) { peso = unPeso }

}

object bateria {

	var estaConMisiles = true

	method peso() = if (estaConMisiles) 300 else 200

	method nivelPeligrosidad() = if (estaConMisiles) 100 else 0

	method cambiarMisiles() { estaConMisiles = not estaConMisiles }

}

object contenedor {

	const property cosas = []

	method peso() = 100 + cosas.sum{ cosa => cosa.peso() }

	method nivelPeligrosidad() = if (not cosas.isEmpty()) cosas.max{ cosa => cosa.nivelPeligrosidad() }.nivelPeligrosidad() else 0

	method agregar(unaCosa) { cosas.add(unaCosa) }

}

object residuos {

	var peso = 0

	method peso() = peso

	method nivelPeligrosidad() = 200

	method pesa(unPeso) { peso = unPeso }

}

object embalaje {

	var envuelve

	method peso() = envuelve.peso()

	method nivelPeligrosidad() = envuelve.nivelPeligrosidad() / 2

	method envuelve(unaCosa) { envuelve = unaCosa }

}

