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
	
	method agregarDificultad()
	
	method nivelCompleto() = (nave.muertes() == self.muertesNivel())
	
	method nombreDelNivel()
	
}

object nivel0{
	 
	method nombreDelNivel(){
		game.say(nave, "Hola!")
		game.say(nave, "Usa las flechas")
		game.say(nave, "para desplazarte y disparar")
		game.say(nave, "Presiona la barra espaciadora para comenzar!")
	}
}


object ganarJuego{
	
	method nombreDelNivel(){game.say(nave, "GANASTE!")
		game.say(nave, "CHAU!")
	} 
}


object perderJuego{
		
	method nombreDelNivel(){game.say(nave, "OH NO!")
		game.say(nave, "Perdiste!")
	} 
	
}

object nivel3 inherits Nivel{
	
	const property enemigos = [new EnemigoMuyMalo(position = game.at(6, 10), posiciones = 1, msegs = 1000)]
	
	const property enemigosDificultad = [
		new EnemigoMalo(position = game.at(4, 11), posiciones = 1, msegs = 1000),
		new EnemigoMalo(position = game.at(8, 11), posiciones = 1, msegs = 1000)
	]
	
	override method muertesNivel() = 3
	
	override method proximoNivel() =  ganarJuego
	
	override method velocidadDisparo() = 4000
	
	override method velocidadDesplazamiento() = 4000
	
	override method agregarDificultad(){
	
		enemigosDificultad.forEach{ enemigo => enemigo.setearEnemigo()}
		game.onTick(self.velocidadDesplazamiento(), "comenzarDesplazamiento", { => enemigosDificultad.forEach{ enemigo => enemigo.desplazarse()}})
		game.onTick(self.velocidadDisparo(), "comenzarDisparos", { => enemigosDificultad.forEach{ enemigo => enemigo.disparoInicial()}})
		game.onTick(500, "quitarEnemigosMuertos", { => enemigosDificultad.removeAllSuchThat{ enemigo => enemigo.estaMuerto()}})
		enemigosDificultad.forEach{ enemigo => game.whenCollideDo(enemigo, { disparo => disparo.impactar(enemigo)})}
		game.removeTickEvent("agregarDificultad")
	}
	
	override method nombreDelNivel(){(game.say(nave, "NIVEL 3"))} 
	
}

object nivel2 inherits Nivel{
	
	const property enemigos = [	
		new EnemigoMalo(position = game.at(2, 11), posiciones = 1, msegs = 1000),
		new EnemigoMalo(position = game.at(4, 11), posiciones = 2, msegs = 1000),
		new EnemigoMalo(position = game.at(6, 11), posiciones = 3, msegs = 1000),
		new EnemigoMalo(position = game.at(8, 11), posiciones = 2, msegs = 1000),
		new EnemigoMalo(position = game.at(10, 11), posiciones = 1, msegs = 1000)
	]

	override method agregarDificultad(){}

	override method proximoNivel() = nivel3
	
	override method nombreDelNivel(){(game.say(nave, "NIVEL 2"))} 

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
	
	override method nombreDelNivel(){(game.say(nave, "NIVEL 1"))} 
	
	override method agregarDificultad(){}
	
	override method velocidadDesplazamiento() = 6000
	
	override method velocidadDisparo() = 5000
	
	override method proximoNivel() = nivel2
	
	override method muertesNivel() = 6
	
}

