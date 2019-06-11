import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	var property posicionFinal = 0
	
	method image()="shoot.png"
	
 	method avanzarEnTablero(){
 		
 		game.onTick(1000, "avanzarEnTablero"+self.identity(), { => self.bajarUnLugar()})
		//+self.identity()
}

	method subirEnTablero(){
		
		game.onTick(1000, "avanzarEnTablero"+self.identity(), { => self.subirUnLugar()})
		
	}

	method bajarUnLugar(){
		posicionFinal += 1
		game.removeVisual(self)
		position = position.down(1)
		game.addVisualIn(self,position)
		if (posicionFinal == (game.height() - 1)){					//emprolijar esto: usar valores de height de nave y tablero		
			self.terminarDisparo()
		}
	
	}
	
	method subirUnLugar(){
		posicionFinal += 1
		game.removeVisual(self)
		position = position.up(1)
		game.addVisualIn(self,position)
		if (posicionFinal == (game.height() - 1)){							
			self.terminarDisparo()
		}
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
		game.removeTickEvent("avanzarEnTablero"+self.identity())
		game.removeVisual(self)
	}
	
}