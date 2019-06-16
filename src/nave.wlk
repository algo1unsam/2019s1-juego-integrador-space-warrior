import wollok.game.*
import nave.*
import enemigos.*
import disparo.*


object nave {
	
	var property position = game.at(6,1)
	var property vida = 10
	var property muertes = 0
	var property nivel = 1
	
	method image()= "player.png"
	
	method matarEnemigo() {muertes+=1}
	
	method subirNivel() {nivel+=1} 
	
	method recibeDisparo() {vida-=5} //Agregar condicion perder juego
	
	method estaMuerto()= (vida<=0)
	
	method disparoInicial(){
		
			const disparo = new Disparo(position=self.position(),image="bullet.png")
			disparo.position(self.position().up(1))
			game.addVisual(disparo)
			disparo.avanzarEnTablero(self, 3000)
		
	} 
		
}
	

