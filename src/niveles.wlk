import wollok.game.*
import nave.*
import enemigos.*
import enemigosMalos.*
import disparo.*
import otrosDisparos.*

class Nivel{
	
	method proximoNivel()
	
	method muertesNivel()
	
	method velocidadDesplazamiento()
	
	method velocidadDisparo()
	
	method nivelCompleto() = (nave.muertes() == self.muertesNivel())
	
	method subirNivelNave(){
		nave.muertes(0)
		var vida = nave.vida() + 10
		nave.vida(vida)	
	}
	
}

object nivel3 inherits Nivel{
	
	const property enemigos = [new EnemigoMuyMalo(position = game.at(6, 10), posiciones = 1, msegs = 1000)]
	
	override method muertesNivel() = 1
	
	override method proximoNivel() = nivel2 // acordate de modificar esto
	
	override method velocidadDisparo() = 4000
	
	override method velocidadDesplazamiento() = 4000
		
	method nombreDelNivel() = "NIVEL 3"

	override method subirNivelNave(){
		nave.muertes(0)
		var vida = nave.vida() + 15
		nave.vida(vida)	
	}
	
}

object nivel2 inherits Nivel{
	
	const property enemigos = [	
		new EnemigoMalo(position = game.at(2, 11), posiciones = 1, msegs = 1000),
		new EnemigoMalo(position = game.at(4, 11), posiciones = 2, msegs = 1000),
		new EnemigoMalo(position = game.at(6, 11), posiciones = 3, msegs = 1000),
		new EnemigoMalo(position = game.at(8, 11), posiciones = 2, msegs = 1000),
		new EnemigoMalo(position = game.at(10, 11), posiciones = 1, msegs = 1000)
	]

	override method proximoNivel() = nivel3
	
	method nombreDelNivel() = "NIVEL 2"

	override method muertesNivel() = 5
	
	override method velocidadDisparo() = 5500
	
	override method velocidadDesplazamiento() = 5500
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
	
	method nombreDelNivel() = "NIVEL 1"
	
	override method velocidadDesplazamiento() = 6000
	
	override method velocidadDisparo() = 5000
	
	override method proximoNivel() = nivel2
	
	override method muertesNivel() = 6
	
}



//
//
//object finalDelJuego inherits Nivel {
//	
//	const property enemigos = [
//		new EnemigoMalo(position = game.at(5, 11), posiciones = 2, msegs = 1000),
//		new EnemigoMalo(position = game.at(9, 11), posiciones = 2, msegs = 1000)
//	]
//		
//}




