import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	
	method image()="player.png"
	
 	method bajarEnTablero(){
	
		game.removeVisual(self)
		position = position.down(1)
		game.addVisualIn(self,position)

}


}