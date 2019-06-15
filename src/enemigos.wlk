import wollok.game.*
import nave.*
import disparo.*


class Enemigo {

	var property posicionIzq = 1
	var property posicionDer = 1
	var property sentido = 0
	var property position
	var property vida=20
	var property nivel = 1
	var property msegs = 6000
	var property pasos = 2

	method image()= "alien.png"
	

	method disparoInicial() {
		
		const disparo = new Disparo()
		disparo.position(self.position().down(1))
//		console.println(position)
		game.addVisual(disparo)
		disparo.avanzarEnTablero(self, msegs)
		
	} 		
		
	method desplazarse(){
	
		if (sentido == 0 and posicionIzq==2){
			position = (self.position().left(1))
			posicionIzq=1
			sentido=1
						 
		} else if (sentido == 0 and posicionIzq==1){
			position =  (self.position().left(1))
			posicionIzq+=1
		
		} else if (sentido == 1 and posicionDer==1) {		
			position = (self.position().right(2))
			posicionDer=1
			sentido = 0
	
		} else if (sentido == 1 and posicionDer==1){
			position =  (self.position().right(1))
			posicionDer+=1
			
		}
	}
	
	method recibeDisparo(){
		if (vida > 0) {
			vida-=5
		} else {
			nave.matarEnemigo()
			game.removeVisual(self)
			}
		}
		
	method estaMuerto()= (vida<=0)
	
	method pasarDeNivel(){ nivel+=1	}	
		
} 

