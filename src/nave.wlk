import wollok.game.*
import nave.*
import enemigos.*
import disparo.*


object nave {
	
	var property position = game.at(5,1)
	var property vida = 10
	var property muertes = 0
	var property nivel = 1
	
	method image()= "player.png"
	
	method recibeDisparo(){
		vida-=5
	}
	
	method estaMuerto()= (vida<=0)
	
	method subirNivel() {nivel+=1} 
	
	method disparoInicial(){
		
			const disparo = new Disparo(position=self.position(),image="bullet.png")
			disparo.position(self.position().up(1))
			game.addVisual(disparo)
			disparo.avanzarEnTablero(self, 3000)
		
	} 
	
	method matarEnemigo(){
		muertes+=1
	}
	
	}
	

