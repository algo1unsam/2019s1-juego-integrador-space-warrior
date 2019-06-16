import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

//Acordate que los objetos definidos en enemigos.wlk van a tener que heredar de alguno de estos dos s/ corresponda

class EnemigoMalo inherits Enemigo{
	
	var image = "enem2.png"
	
	override method desplazarse(){
		position = (self.position().down(1))
	}
	
	
	
}


class EnemigoMuyMalo inherits Enemigo{
	
	var image = "ufo.png"
	//una posicion arriba en el centro
	//una posicion abajo en el centro
	//una posicion a la izquierda en el centro
	//una posicion a la derecha en el centro
	
	override method desplazarse(){}
	
}