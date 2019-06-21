import wollok.game.*
import nave.*
import enemigos.*
import disparo.*
import otrosDisparos.*

object nave {
	
	
	var property position = game.at(6,1)
	var property vida = 15
	var property muertes = 0
	var property danio = 0
	var property imagen = "player.png"
	var property imagenColision = "skull.png"
	
	method image()= imagen
	
	method estaMuerto()= (vida <= 0)
	
	method matarEnemigo() {
		muertes += 1
	}
	
	method recibeDisparo(){
		imagen = imagenColision
		if (vida>0){
			vida -= danio
		}
	}
	
	method imagenOriginal(){
		imagen="player.png"
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
			imagen="skull.png"
			game.say(self, "OH NO! PERDISTE!")
		}	
			game.onTick(3000, "gameStop", { => game.stop()})
		}
		
	}
	


