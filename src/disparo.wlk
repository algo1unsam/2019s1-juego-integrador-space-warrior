import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	
	method image()="player.png"
	
 	method bajarEnTablero(enemigo){
		
	
		game.removeVisual(self)
		position = position.down(1)
		game.addVisualIn(self,position)
		enemigo.acercarseAlUmbral()
		if (enemigo.umbral()==3) {game.removeTickEvent("bajarEnTablero")} 
		//probar con colision con la nave

}


}