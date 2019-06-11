import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class Enemigo {
	
	//const enemigos = [enemigo1, enemigo2, enemigo3, enemigo4, enemigo5, enemigo6, enemigo7, enemigo8]

	var property posicionFinalIzq = 0
	var property posicionFinalDer = 0
	var property position	
	//method position() = game.at(0,0)
	
	//PROBAR CON VAR PROPERTY POSITION

	method image()= "alien.png"

	method disparoInicial() {
		
		const disparo = new Disparo()
		
		disparo.position(self.position().down(1))
		game.addVisual(disparo)
		disparo.avanzarEnTablero()
		
	} 
	 
	method moverHaciaIzquierda(){
		game.onTick(4000, "moverHaciaIzquierda"+self.identity(), { => self.position(self.position().left(1))})
		posicionFinalIzq += 1
		if (posicionFinalIzq == 4){
			game.removeTickEvent("moverHaciaIzquierda"+self.identity())
			self.moverHaciaDerecha()
		}
	}
	 
	
	
	method moverHaciaDerecha(){
		game.onTick(4000, "moverHaciaDerecha"+self.identity(), { => self.position(self.position().right(1))})
		posicionFinalDer += 1
		if (posicionFinalDer == 4){
		game.removeTickEvent("moverHaciaDerecha"+self.identity())
		self.moverHaciaIzquierda()		
		
		}
		
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

