import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class Enemigo {

	const property disparosEfectuados = []

	method position() = game.at(0,0)

	method image()= "alien.png"
	
	//como le pasas el disparo?

	method disparoInicial() {
		const disparo = new Disparo()
		//creo el objeto disparo1
		disparo.position(self.position().down(1))
		
		disparosEfectuados.add(disparo)
		//agrego el disparo a la lista de disparos efectuados

		game.addVisual(disparo)
	
		
		//agrego el disparo en el tablero
		
		game.onTick(5000, "bajarEnTablero", { => disparo.bajarEnTablero()})
		
			
	} 
	
	

	method disparoTrayecto(){
		
		//game.addVisualIn(disparo, disparo.position()) 	
		//bajar en el tablero
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

