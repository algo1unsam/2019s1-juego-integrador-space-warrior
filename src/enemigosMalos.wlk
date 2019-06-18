import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class EnemigoMalo inherits Enemigo {

	var property posicionFinal = 0
	var image = "enem2.png"

override method desplazarse(){
	
	posicionFinal += 1
		self.position(self.position().down(1))
		
		if (posicionFinal == 1) {
			self.position(self.position().left(1))
		} else if (posicionFinal % 2 == 0) {
			self.position(self.position().right(2))
		} else {self.position(self.position().left(2))}
		if (posicionFinal == (game.height() - 2)) {
			nave.vida(0)
			nave.finDelJuego()
			game.removeVisual(self)
	
		}	

}
}

class EnemigoMuyMalo inherits Enemigo {

	var image = "ufo.png"

	override method desplazarse() {
		if (self.position() == game.at(6, 10)) {
			position = game.at(11, 8)
		} else if (self.position() == game.at(11, 8)) {
			position = game.at(6, 5)
		} else if (self.position() == game.at(6, 5)) {
			position = game.at(1, 8)
		} else if (self.position() == game.at(1, 8)) {
			position = game.at(6, 10)
		}
	}

}

