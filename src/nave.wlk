import wollok.game.*
import nave.*
import enemigos.*
import disparo.*
import otrosDisparos.*

object nave {
		
	var property position = game.at(6,1)
	var property vida = 25
	var property muertes = 0
	var property danio = 0
	var property imagen = "player.png"
	
	method image()= imagen
	
	method estaMuerto()= (vida <= 0)
	
	method matarEnemigo() {
		muertes += 1
	}
	
	method recibeDisparo() {
		vida -= danio
		if (vida <= 0) {
			self.finDelJuego()
		}
	}
	
	method subirNivel(){
		muertes = 0
		vida += 10
	}
	
	method disparoInicial(){
		
			const disparo = new DisparoNave (position=self.position())
			disparo.position(self.position().up(1))
			game.addVisual(disparo)
			game.hideAttributes(disparo)
			disparo.avanzarEnTablero(self, 3000)
		
	} 
	
	method desplazarDisparo(disparo){
		var posFinal = (disparo.posicionFinal() + 1)
		disparo.posicionFinal(posFinal)
		disparo.position(disparo.position().up(1))
		if (disparo.posicionFinal() == (game.height() - 1)) {
			disparo.terminarDisparo()
		}
	}
	
	
	method finDelJuego() {
		
		if  (self.estaMuerto()){
			game.say(self, "OH NO! PERDISTE!")
		}	else {
			game.say(self, "GANASTE!")
		}
			game.onTick(3000, "gameStop", { => game.stop()})
		}
		
	}
	


