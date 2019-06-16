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
	
	method matarEnemigo() {muertes+=1} //las condiciones son necesarias?
	
	method subirNivel() { nivel+=1 } //las condiciones son necesarias? cuando sube nivel gana vida
	
	method recibeDisparo() { if (vida >= 0) vida-=5} //Agregar condicion perder juego -- Tambien tiene que perder vida s/quien le dispare
	
	method estaMuerto()= (vida<=0)
	
	method disparoInicial(){
		
			const disparo = new Disparo(position=self.position(),image="bullet.png")
			disparo.position(self.position().up(1))
			game.addVisual(disparo)
			disparo.avanzarEnTablero(self, 3000)
		
	} 
	
	
		
}
	

