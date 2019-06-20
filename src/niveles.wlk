import wollok.game.*
import nave.*
import enemigos.*
import enemigosMalos.*
import disparo.*
import otrosDisparos.*

class Nivel{
	
	method proximoNivel() = 2
	
	method muertesNivel() = 6
	
	method nivelCompleto() = (nave.muertes() == self.muertesNivel())
	
//	method setearVidaNave(){
//		var vida = nave.vida() + 10
//		nave.vida(vida)		
//	}
	
	method subirNivelNave(){
		nave.muertes(0)
		var vida = nave.vida() + 10
		nave.vida(vida)	
	}
	
}

object nivel1 inherits Nivel{

	const property enemigos = [ 
		new Enemigo(position = game.at(2,11), msegs = 2000),
		new Enemigo(position = game.at(3,11), msegs = 2000),
		new Enemigo(position = game.at(5,11), msegs = 2000),
		new Enemigo(position = game.at(7,11), msegs = 2000), 
		new Enemigo(position = game.at(9,11), msegs = 2000), 
		new Enemigo(position = game.at(10, 11), msegs = 2000)
	]
	
}


object nivel2 inherits Nivel{
	
	const property enemigos = [	
		new EnemigoMalo(position = game.at(2, 11), posiciones = 1, msegs = 1000),
		new EnemigoMalo(position = game.at(4, 11), posiciones = 2, msegs = 1000),
		new EnemigoMalo(position = game.at(6, 11), posiciones = 3, msegs = 1000),
		new EnemigoMalo(position = game.at(8, 11), posiciones = 2, msegs = 1000),
		new EnemigoMalo(position = game.at(10, 11), posiciones = 1, msegs = 1000)
	]

	override method proximoNivel() = 3

	override method muertesNivel() = 5
	
	override method subirNivelNave(){
		nave.muertes(0)
		var vida = nave.vida() + 10
		nave.vida(vida)	
	}
	
}


object nivel3 inherits Nivel{
	
	const property enemigos = [new EnemigoMuyMalo(position = game.at(6, 10), posiciones = 1, msegs = 1000)]
	
	override method muertesNivel() = 3
	
	override method proximoNivel() = 4
	
	override method subirNivelNave(){
		nave.muertes(0)
		var vida = nave.vida() + 15
		nave.vida(vida)	
	}
	
}


object finalDelJuego inherits Nivel {
	
	const property enemigos = [
		new EnemigoMalo(position = game.at(4, 11), posiciones = 2, msegs = 1000),
		new EnemigoMalo(position = game.at(8, 11), posiciones = 2, msegs = 1000)
	]
		
}




