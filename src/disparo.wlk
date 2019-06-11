import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	var i = 0
	
	method image()="shoot.png"
	
 	method bajarEnTablero(enemigo){
 		
 		game.onTick(5000, "bajarEnTablero", { => self.bajar()})
		
		
		//enemigo.acercarseAlUmbral()
		
		//probar con colision con la nave

}

	method bajar(){
		i += 1
		game.removeVisual(self)
		position = position.down(1)
		game.addVisualIn(self,position)
		if (i == 2){
			//si llego aca y no esta en la misma posicion que la nave, sigue uno mas y se elimina
			self.finDelDisparo()
		}
	
	}
	
	method finDelDisparo(){
		game.removeTickEvent("bajarEnTablero")
	}
		
	
	
}