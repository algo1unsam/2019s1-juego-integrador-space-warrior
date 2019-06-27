import wollok.game.*
import nave.*
import enemigos.*
import disparo.*
import otrosDisparos.*

object nave {
		
	var property position = game.at(6,1)
	var property vida = 20
	var property danio = 0
	var property imagen = "player.png"
	var property imagenMuerte = "explosion.png"
	
	method image()= imagen
			
	method recibeDisparo() {
		vida -= danio
		if (vida <= 0) {
			imagen = imagenMuerte
		}
	}
	
	method subirNivel(){ vida += 10 }
	
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
		
	}
	


