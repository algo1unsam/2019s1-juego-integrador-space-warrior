import wollok.game.*
import nave.*
import enemigos.*
import enemigosMalos.*
import disparo.*
import otrosDisparos.*

class Nivel{
	
	const property enemigos = []
	
	method proximoNivel()
		
	method velocidadDesplazamiento()
	
	method velocidadDisparo()
	
	method agregarDificultad()
	
	method nivelCompleto() = (enemigos.size() == 0)
	
	method nombreDelNivel()
	 
	method agregarEnemigos()
	
	method setearEnemigos(){
		self.agregarEnemigos()
		enemigos.forEach{ enemigo => enemigo.setearEnemigo() } 
	}
	
}

object nivel0 inherits Nivel{
		
	override method nombreDelNivel(){
		game.say(nave, "Usa las flechas para desplazarte y disparar!")
	}
		
	override method proximoNivel() = nivel1
		
	override method velocidadDesplazamiento() = 0
	
	override method velocidadDisparo() = 0
	
	override method agregarDificultad(){}
		
	override method agregarEnemigos(){}
	
	
	
}


object ganarJuego{
	
	method nombreDelNivel(){game.say(nave, "GANASTE!")
		game.say(nave, "CHAU!")
	} 
	
	method finDelJuego(){game.onTick(3000, "gameStop", { => game.stop()})}
}


object perderJuego{
		
	method nombreDelNivel(){game.say(nave, "OH NO!")
		game.say(nave, "Perdiste!")
	} 
	
	method finDelJuego(){
		nave.imagen("rip.png")
		game.onTick(4000, "gameStop", { => game.stop()})
	}
	
}

object nivel3 inherits Nivel{
	
	const property enemigosDificultad = [
		new EnemigoMalo(position = game.at(4, 11), posiciones = 1, msegs = 1000),
		new EnemigoMalo(position = game.at(8, 11), posiciones = 1, msegs = 1000)
	]
	
	override method agregarEnemigos(){
		enemigos.add(new EnemigoMuyMalo(position = game.at(6, 10), posiciones = 1, msegs = 1000))
	}
		
	override method proximoNivel() =  ganarJuego
	
	override method velocidadDisparo() = 4000
	
	override method velocidadDesplazamiento() = 4000
	
	override method agregarDificultad(){
	
		enemigosDificultad.forEach{ enemigo => enemigo.setearEnemigo()}
		game.onTick(self.velocidadDesplazamiento(), "comenzarDesplazamiento", { => enemigosDificultad.forEach{ enemigo => enemigo.desplazarse()}})
		game.onTick(self.velocidadDisparo(), "comenzarDisparos", { => enemigosDificultad.forEach{ enemigo => enemigo.disparoInicial()}})
		enemigosDificultad.forEach{ enemigo => game.whenCollideDo(enemigo, { disparo => disparo.impactar(enemigo)})}
		game.removeTickEvent("agregarDificultad")
		game.onTick(100, "quitarEnemigosDificultad", { => enemigosDificultad.removeAllSuchThat{ enemigo => (enemigo.vida() == 0)}})			
		
	}
	
	override method nombreDelNivel(){(game.say(nave, "NIVEL 3"))} 
	
	override method nivelCompleto() = (enemigos.size() == 0 and enemigosDificultad.size()==0)
	
}

object nivel2 inherits Nivel{
	
	override method agregarEnemigos(){
		enemigos.add(new EnemigoMalo(position = game.at(2, 11), posiciones = 1, msegs = 1000))
		enemigos.add(new EnemigoMalo(position = game.at(4, 11), posiciones = 2, msegs = 1000))
		enemigos.add(new EnemigoMalo(position = game.at(6, 11), posiciones = 3, msegs = 1000))
		enemigos.add(new EnemigoMalo(position = game.at(8, 11), posiciones = 2, msegs = 1000))
		enemigos.add(new EnemigoMalo(position = game.at(10, 11), posiciones = 1, msegs = 1000))
	}

	override method agregarDificultad(){}

	override method proximoNivel() = nivel3
	
	override method nombreDelNivel(){(game.say(nave, "NIVEL 2"))} 
	
	override method velocidadDisparo() = 5500
	
	override method velocidadDesplazamiento() = 5500
	
}


object nivel1 inherits Nivel{
	
	
	override method agregarEnemigos(){
		enemigos.add(new Enemigo(position = game.at(2,11), msegs = 2000))
		enemigos.add(new Enemigo(position = game.at(3,11), msegs = 2000))
		enemigos.add(new Enemigo(position = game.at(5,11), msegs = 2000))
		enemigos.add(new Enemigo(position = game.at(7,11), msegs = 2000))
		enemigos.add(new Enemigo(position = game.at(9,11), msegs = 2000))
		enemigos.add(new Enemigo(position = game.at(10, 11), msegs = 2000))
	}
	
	override method nombreDelNivel(){
		game.say(nave, "NIVEL 1")
	} 
	
	override method agregarDificultad(){}
	
	override method velocidadDesplazamiento() = 6000
	
	override method velocidadDisparo() = 5000
	
	override method proximoNivel() = nivel2
		
}

