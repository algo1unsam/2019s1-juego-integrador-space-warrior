import wollok.game.*
import nave.*
import enemigos.*
import disparo.*


object nave {
	var property position = game.at(6,1)
	var property vida = 15
	var property muertes = 0
	var property nivel = 1
	
	method image()= "player.png"
	
	method estaMuerto()= (vida == 0)
	
	method matarEnemigo() {
		if ((nivel == 1 and muertes < 6) or (nivel == 2 and muertes < 5) or (nivel == 3 and muertes < 3)) {
			muertes += 1
		}
	}
	
	method subirNivel() {
		nivel += 1
		if (nivel == 2) {
			vida += 10
		} else if (nivel == 3) {
			vida += 20
		}
	} 
	
	method recibeDisparo() {
		if (vida > 0 and nivel == 1) {
			vida -= 5
		} else if (vida > 0 and nivel == 2) {
			vida -= 10
		} else if (vida > 0 and nivel == 3) {
			vida -= 15
		} 
	} 
	
	method disparoInicial(){
		
			const disparo = new Disparo(position=self.position(),image="bullet.png")
			disparo.position(self.position().up(1))
			game.addVisual(disparo)
			disparo.avanzarEnTablero(self, 3000)
		
	} 
	
	method finDelJuego() {
		if (self.estaMuerto()){
			game.say(self, "OH NO! PERDISTE!")	
		}
		game.onTick(3000, "gameStop", { => game.stop()})
	}
	
	
		
}
	

