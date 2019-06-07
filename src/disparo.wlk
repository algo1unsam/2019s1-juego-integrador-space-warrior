import wollok.game.*
import nave.*
import enemigos.*


class Disparo {

	var property position
	
	var property esInicial = 1 //revisar esto
	
	method image()="shoot.png"
	
	method bajarEnTablero(){
		position=(self.position().down(1))
		//o aca, aguantar unos segundos
		//remove visual
		}
		
}


