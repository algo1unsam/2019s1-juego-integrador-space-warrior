import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position = game.at(3,4)
	
	//var property esInicial = 1 
	
	method image()="player.png"
	
	method bajarEnTablero(){
		
		game.onTick(5000, { => game.removeVisual(self)})
		//position=((self.position()).down(1))
		//game.onTick(5000, self, game.addVisualIn(self.image(),position))
		}
		
}


