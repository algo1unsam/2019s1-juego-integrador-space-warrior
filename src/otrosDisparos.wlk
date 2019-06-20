import wollok.game.*
import nave.*
import enemigos.*
import disparo.*


class DisparoEnemigo inherits Disparo {
		
	var property danio = 5
}


class DisparoMalo inherits Disparo{
	
	var image = "shootmalo.png"
	
	var property danio = 10 
	
} 

class DisparoMuyMalo inherits Disparo{
	
	var property danio = 15
	
	var image = "shootfinal.png"
	
	
}

class DisparoNave inherits Disparo {
	
	//var property danio = 5
	
	var image = "bullet.png"
	
}