import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	var posicionFinal = 0
	
	method image()="shoot.png"
	
 	method avanzarEnTablero(enemigo){
 		
 		game.onTick(5000, "avanzarEnTablero", { => self.avanzarUnLugar()})

}

	method avanzarUnLugar(){
		posicionFinal += 1
		game.removeVisual(self)
		position = position.down(1)
		game.addVisualIn(self,position)
		if (posicionFinal == 8){//emprolijar esto: usar valores de height de nave y tablero
			
			
			
			
			//si llego aca y no esta en la misma posicion que la nave, sigue uno mas y se elimina
			self.detenerDisparo()
		}
	
	}
	
	
	method impactarNave(){}
	
	method detenerDisparo(){
		game.removeTickEvent("avanzarEnTablero")
	}
		
	
	
}