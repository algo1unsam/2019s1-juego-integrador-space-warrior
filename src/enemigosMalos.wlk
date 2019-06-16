import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class EnemigoMalo inherits Enemigo{
	
	var property posicionFinal = 0
	var image = "enem2.png"
	
	override method desplazarse(){
		posicionFinal += 1		
		position = (self.position().down(1))
		if (posicionFinal == (game.height() - 2)) {
			self.perder()
			vida=0//esto no se si va
			game.removeVisual(self)
		}
	}
	
}


class EnemigoMuyMalo inherits Enemigo{
	
	var image = "ufo.png"
	
	override method desplazarse(){
		
		if (self.position() == game.at(5,9)){
			self.position(game.at(11,5))
		} else if (self.position() == game.at(11,5)){
			self.position(game.at(5,3))
		} else if (self.position() == game.at(5,3)){
			self.position(game.at(0,5))
		} else if (self.position() == game.at(0,5)){
			self.position(game.at(5,9))
}


}

}