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
		if (self.position() == game.at(6, 9)) {
			position = game.at(11, 5)
		} else if (self.position() == game.at(11, 5)) {
			position = game.at(5, 3)
		} else if (self.position() == game.at(5, 3)) {
			position = game.at(0, 5)
		} else if (self.position() == game.at(0, 5)) {
			position = game.at(6, 9)
		}
	}

}

