import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	var property posicionFinal = 0
	
	method image()="shoot.png"

/*	
 	method avanzarEnTablero(){
 		
 		game.onTick(1000, "avanzarEnTablero"+self.identity(), { => self.bajarUnLugar()})
		//+self.identity()
}

	method subirEnTablero(){
		
		game.onTick(500, "avanzarEnTablero"+self.identity(), { => self.subirUnLugar()})
		
	}

*/

		method avanzarEnTablero(disparador){
 		if (not disparador == nave){
 				game.onTick(1000, "avanzarEnTablero"+self.identity(), { => self.bajarUnLugar()})
 			} else game.onTick(500, "avanzarEnTablero"+self.identity(), { => self.subirUnLugar()})
 		}

	method bajarUnLugar(){
		posicionFinal += 1
		game.removeVisual(self)
		self.position(self.position().down(1))
		game.addVisualIn(self,position)
		self.terminarDisparo()
	}
	
	method subirUnLugar(){
		posicionFinal += 1
		game.removeVisual(self)
		self.position(self.position().up(1))
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