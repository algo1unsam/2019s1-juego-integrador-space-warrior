import wollok.game.*
import nave.*
import enemigos.*
import disparo.*

class Posicion{
	
	var desplazamiento = 0
	var posicion = 0
	//si la posicion es cero, cambia el sentido ?


	method devuelvePosicion(){
		self.moverEnX()
		return posicion
		//fijate si devuelve 1 o 0
}
		
	method moverEnX()

	method moverEnY(){}

	}



object posEnemigo inherits Posicion{

	override method moverEnX(){
		
		if (desplazamiento==0 or desplazamiento == 2)
		{
				posicion=1 
				desplazamiento+=1
			}
				else if (desplazamiento==1)
				{
					posicion=2
					desplazamiento-=1
				}
			
	}
	

}