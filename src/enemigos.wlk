import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class Enemigo {

	var property posicionFinalIzq = 0
	var property posicionFinalDer = 0
	var property position
	var property vida=20
	var property estaMuerto = false
	

	method image()= "alien.png"

	method disparoInicial() {
		
		const disparo = new Disparo()		
		disparo.position(self.position().down(1))
		game.addVisual(disparo)
		disparo.avanzarEnTablero(self)
		
	} 
	 
	method moverHaciaIzquierda(){
		posicionFinalDer = 0
		self.position(self.position().left(1))
		posicionFinalIzq += 1
		if (posicionFinalIzq == 4){
			self.moverHaciaDerecha()
		}
	}
	 
	
	
	method moverHaciaDerecha(){
		posicionFinalIzq = 0
		self.position(self.position().right(1))
		posicionFinalDer += 1
		if (posicionFinalDer == 4){
			self.moverHaciaIzquierda()		
		
		}
		}
		
		
		
	method recibeDisparo(){
		if (vida > 0) {
			vida-=5
		} else game.removeVisual(self)
		
	}	
		
		
} 



object enemigo1 inherits Enemigo{
	
	override method position() = game.at(2,11) 
	
	
}


object enemigo2 inherits Enemigo{
	
	override method position() = game.at(3,11) 
	
	
}

object enemigo3 inherits Enemigo{
	
	override method position() = game.at(4,11) 
	
	
}


object enemigo4 inherits Enemigo{
	
	override method position() = game.at(5,11) 
	
	
}



object enemigo5 inherits Enemigo{
	
	override method position() = game.at(6,11) 
	
	
}



object enemigo6 inherits Enemigo{
	
	override method position() = game.at(7,11) 
	
	
}




object enemigo7 inherits Enemigo{
	
	override method position() = game.at(8,11) 
	
	
}



object enemigo8 inherits Enemigo{
	
	override method position() = game.at(9,11) 
	
	
}

