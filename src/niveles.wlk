import wollok.game.*
import nave.*
import enemigos.*
import enemigosMalos.*
import disparo.*
import otrosDisparos.*

class Nivel{
	
	method muertesNivel() = 0
	
	method nivelCompleto() = (nave.muertes() == self.muertesNivel())
	
}

object nivel1 inherits Nivel{
	
	override method muertesNivel() = 6
	
}


object nivel2 inherits Nivel{

	override method muertesNivel() = 5
	
	
}


object nivel3 inherits Nivel{
	
	override method muertesNivel() = 3
	
}