import wollok.game.*
import nave.*
import disparo.*
import otrosDisparos.*

class Enemigo{
	
	var property position = game.at(0,0)
	var property contador = 1
	var property sentido = -1
	var property vida = (20*nave.nivel())
	var property msegs = 6000
	var property posiciones = 2
	var property posicionFinal = 0

	method image() = "alien.png"

	method estaMuerto() = (vida <= 0)

	method disparoInicial() {
		const disparo = new DisparoEnemigo()
		nave.danio(disparo.danio())
		disparo.position(self.position().down(posiciones))
		game.addVisual(disparo)
		game.hideAttributes(disparo)
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


	method desplazarDisparo(disparo){
		posicionFinal += 1
		disparo.position(disparo.position().down(posiciones))
		if (posicionFinal == (game.height() - 1)) {
			disparo.terminarDisparo()}
	}

	method recibeDisparo() {
		if (vida > 0) {
			vida -= 5
		} else {
			nave.matarEnemigo()
			game.removeVisual(self)
		}
	}


} 

