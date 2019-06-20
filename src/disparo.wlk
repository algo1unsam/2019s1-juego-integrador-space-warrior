import wollok.game.*
import nave.*
import enemigos.*


class Disparo {
	
	var property position
	var property posicionFinal = 0
	

	method image() = "shoot.png"

	method avanzarEnTablero(disparador, msegs) {
		game.onTick(500, "avanzarEnTablero" + self.identity(), { => disparador.desplazarDisparo(self)})
	}

	method impactar(disparador) {
		self.terminarDisparo()
		disparador.recibeDisparo()
	}

	method terminarDisparo() {
		game.removeTickEvent("avanzarEnTablero" + self.identity())
		game.removeVisual(self)
	}
	
}