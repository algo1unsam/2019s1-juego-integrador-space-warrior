import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class EnemigoMalo inherits Enemigo {

	var property posicionFinal = 0
	var image = "enem2.png"

	override method desplazarse() {
		posicionFinal += 1
		position = (self.position().down(1))
		if (posicionFinal == (game.height() - 2)) {
			self.perder()
			game.removeVisual(self)
		}
	}

}

class EnemigoMuyMalo inherits Enemigo {

	var image = "ufo.png"

	override method desplazarse() {
		if (self.position() == game.at(5, 9)) {
			position = game.at(11, 5)
		} else if (self.position() == game.at(11, 5)) {
			position = game.at(5, 3)
		} else if (self.position() == game.at(5, 3)) {
			position = game.at(0, 5)
		} else if (self.position() == game.at(0, 5)) {
			position = game.at(5, 9)
		}
	}

}

