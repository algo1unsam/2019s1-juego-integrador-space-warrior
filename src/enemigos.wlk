import wollok.game.*

class Enemigo {

	method position() = game.at(0,0)

	method image () = "alien.png"
	
	
}






object enemigo1 inherits Enemigo{
	
	override method position() = game.at(2,11) 
	
	
}