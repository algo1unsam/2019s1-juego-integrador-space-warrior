import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

//Acordate que los objetos definidos en enemigos.wlk van a tener que heredar de alguno de estos dos s/ corresponda

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
	
	var property primeraPosicion = position
	var property segundaPosicion = game.at(8,5)
	var property terceraPosicion = game.at(6,6)
	var property cuartaPosicion = game.at(3,5)
	
	var image = "ufo.png"
	//una posicion arriba en el centro
	//una posicion abajo en el centro
	//una posicion a la izquierda en el centro
	//una posicion a la derecha en el centro
	
	override method desplazarse(){
		
		var nuevaPosicion = primeraPosicion
		
		if (nuevaPosicion == primeraPosicion){
			position = segundaPosicion
			nuevaPosicion = segundaPosicion
		} else if (nuevaPosicion == segundaPosicion){
			position = terceraPosicion
			nuevaPosicion = terceraPosicion
		} else if (nuevaPosicion == terceraPosicion){
			position = cuartaPosicion
			nuevaPosicion = cuartaPosicion
		} else if (nuevaPosicion == cuartaPosicion){
			position = primeraPosicion
			nuevaPosicion = segundaPosicion
	}
	
}




}