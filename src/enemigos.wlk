import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class Enemigo {
	
	const property disparosEfectuados = []

	method position() = game.at(0,0)
	
	//PROBAR CON VAR PROPERTY POSITION

	method image()= "alien.png"

	method disparoInicial() {
		
		const disparo = new Disparo()
		
		disparo.position(self.position().down(1))
		disparosEfectuados.add(disparo)	
		game.addVisual(disparo)
		disparo.avanzarEnTablero(self)
		
	} 
	
	//intentar reducir este metodo porque tambien disparo usa algo parecido
	method finDelDisparo(){
		game.removeTickEvent("avanzarEnTablero")
		game.removeVisual(self)
		//eliminar disparo de la lista - buscar forma de hacerlo sin crear 
		//una variable auxiliar para guardar disparo
		
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

