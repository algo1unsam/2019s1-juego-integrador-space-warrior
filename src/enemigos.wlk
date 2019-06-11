import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class Enemigo {
	
	var descenso = 0
	var property umbral = game.height() - descenso
	
	//capaz precisas que sea property
	const property disparosEfectuados = []

	method position() = game.at(0,0)
	
	//PROBAR CON VAR PROPERTY POSITION

	method image()= "alien.png"

	method disparoInicial() {
		
		const disparo = new Disparo()
		
		disparo.position(self.position().down(1))
		disparosEfectuados.add(disparo)
		
		game.addVisual(disparo)
		disparo.bajarEnTablero(self)
		
		//4.times({i => game.onTick(5000, "bajarEnTablero", { => disparo.bajarEnTablero(self)})})
		//4.times({i => disparo.bajarEnTablero(self)})
	
		
		
		//game.onTick(5000, "bajarEnTablero", { => disparo.bajarEnTablero(self)})
			
			
		
			
		//el disparo comienza a descender por el tablero
			
	} 
	
	method acercarseAlUmbral() {
		var nuevoUmbral = (umbral-1)
		umbral = nuevoUmbral
		//if (umbral==1) {game.removeTickEvent("bajarEnTablero")} 
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

