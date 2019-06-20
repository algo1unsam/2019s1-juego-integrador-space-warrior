import wollok.game.*
import nave.*
import enemigos.*
import enemigosMalos.*
import disparo.*
import otrosDisparos.*

class Nivel{
	
	method proximoNivel() = 2
	
	method muertesNivel() = 6
	
	method nivelCompleto() = (nave.muertes() == self.muertesNivel())
	
}

object nivel1 inherits Nivel{
	
	
}


object nivel2 inherits Nivel{

	override method proximoNivel() = 3

	override method muertesNivel() = 5
	
	
}


object nivel3 inherits Nivel{
	
	override method muertesNivel() = 3
	
}