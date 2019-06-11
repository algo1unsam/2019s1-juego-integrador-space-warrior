import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	var i = 0
	
	method image()="shoot.png"
	
 	method avanzarEnTablero(enemigo){
 		
 		game.onTick(5000, "avanzarEnTablero", { => self.avanzarUnLugar()})
		
		
		//enemigo.acercarseAlUmbral()
		
		//probar con colision con la nave

}

	method avanzarUnLugar(){
		i += 1
		game.removeVisual(self)
		position = position.down(1)
		game.addVisualIn(self,position)
		if (i == (game.width() - 2)){
			//si llego aca y no esta en la misma posicion que la nave, sigue uno mas y se elimina
			self.detenerDisparo()
		}
	
	}
	
	method detenerDisparo(){
		game.removeTickEvent("avanzarEnTablero")
	}
		
	
	
}