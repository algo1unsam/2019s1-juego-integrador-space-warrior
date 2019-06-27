import wollok.game.*
import nave.*
import disparo.*
import otrosDisparos.*
import niveles.*

class Enemigo{
	
	var property position = game.at(0,0)
	var property contador = 1
	var property sentido = -1
	var property vida = 20
	var property msegs = 6000
	var property posiciones = 2
	var property imagen = "alien.png"

	method image() = imagen
	
	method setearEnemigo(){
		game.addVisual(self)
		game.hideAttributes(self)
	}

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
		var posFinal = (disparo.posicionFinal() + 1)
		disparo.posicionFinal(posFinal)
		disparo.position(disparo.position().down(posiciones))
		if (disparo.posicionFinal() == (game.height() - 1)) {
			disparo.terminarDisparo()}
			
	}

	method recibeDisparo() {
		vida -= 5
		if (vida <= 0) {
			imagen = "explosion.png"
			game.onTick(200, "quitarImagen"+self.identity(), { =>
				game.removeVisual(self)
				game.removeTickEvent("quitarImagen"+self.identity())
			})
		}
	}


} 

