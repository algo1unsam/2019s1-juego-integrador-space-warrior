import wollok.game.*
import nave.*
import enemigos.*
import disparo.*


object nave {
	
	var property position = game.at(6,2)
	var property vida = 10
	
	method image()= "player.png"
	
	method recibeDisparo(){vida-=5}
	
	method disparar(){
		
		const disparo = new Disparo()
		
		disparo.position(self.position().up(1))
		game.addVisual(disparo)
		disparo.subirEnTablero()
		
	} 
		
		
		
	}
	
}
