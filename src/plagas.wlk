class Plagas {
	var property poblacion
	
	method transmiteEnfermedades(){
		return poblacion > 10
	}
	method efectoDeAtaque(){
		poblacion = poblacion * 1.1
	}
}

class Cucarachas inherits Plagas {
	var pesoPromedio
	method pesoPromedio(unaCantidad){
		pesoPromedio = pesoPromedio + unaCantidad
	}
	method pesoPromedio() = pesoPromedio
	
	method nivelDanio(){
		return poblacion / 2
	}
	
	override method transmiteEnfermedades(){
		return super() && pesoPromedio >= 10
	}
	
	override method efectoDeAtaque(){
		super() 
		self.pesoPromedio(2)
	}
}

class Pulgas inherits Plagas {
	method nivelDanio(){
		return poblacion * 2			//self.poblacion() * 2 tambien seria correcto
	}
}

class Garrapatas inherits Pulgas {
	override method efectoDeAtaque(){
		poblacion = poblacion * 1.2
	}
}

class Mosquitos inherits Plagas {
	method nivelDanio(){
		return poblacion 
	}
	
	override method transmiteEnfermedades(){
		return super() && poblacion % 3 == 0
	}
}



