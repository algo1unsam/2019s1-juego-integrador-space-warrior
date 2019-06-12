import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	var property posicionFinal = 0
	
	method image()="shoot.png"

	method avanzarEnTablero(disparador){
 		if (disparador == nave){ game.onTick(500, "avanzarEnTablero"+self.identity(), { => self.desplazarse(disparador)})}
 			else game.onTick(1000, "avanzarEnTablero"+self.identity(), { => self.desplazarse(disparador)})
 	}

	method desplazarse(disparador){
		
		posicionFinal += 1
		game.removeVisual(self)
		if (disparador==nave){self.position(self.position().up(1))} else {self.position(self.position().down(1))}
		game.addVisualIn(self,position)
		self.terminarDisparo()
		
	}
	
	
	method impactarNave(){
		self.terminarDisparo()
		nave.recibeDisparo()
		
	}
	
	
	method impactarEnemigo(enemigo){
		self.terminarDisparo()
		enemigo.recibeDisparo()
		
	}

		
	method terminarDisparo(){
		if (posicionFinal == (game.height() - 1)){							
			game.removeTickEvent("avanzarEnTablero"+self.identity())
			game.removeVisual(self)
		}
		
	}
	
}