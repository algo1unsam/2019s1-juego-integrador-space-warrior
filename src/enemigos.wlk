import wollok.game.*
import nave.*
import disparo.*

class Enemigo {

	var property position = game.at(0, 0)
	var property contador = 1
	var property sentido = -1
	var property vida = {
		
		20
	}
	
	var property msegs = 6000
	var property pasos = 2

	method image() = "alien.png"

	method estaMuerto() = (vida <= 0)

	method disparoInicial() {
		const disparo = new Disparo()
		disparo.position(self.position().down(pasos))
		game.addVisual(disparo)
		disparo.avanzarEnTablero(self, msegs)
	}

	method desplazarse() {
		if (sentido == -1 and contador == 1) {
			self.position((self.position().left(1)))
			contador += 1
		} else if (sentido == -1 and contador == 2) {
			self.position((self.position().right(3)))
			sentido = 1
			contador = 1
		} else if (sentido == 1 and contador == 1) {
			self.position((self.position().right(1)))
			contador += 1
		} else if (sentido == 1 and contador == 2) {
			self.position((self.position().left(3)))
			sentido = -1
			contador = 1
		}
	}

	method recibeDisparo() {
		if (vida > 0) {
			vida -= 5
		} else {
			nave.matarEnemigo()
			game.removeVisual(self)
		}
	}

	method perder() {
		game.say(nave, "OH NO! PERDISTE!")
	// a este metodo tambien hay que llamarlo cuando la nave se queda sin vida
	}

} 

