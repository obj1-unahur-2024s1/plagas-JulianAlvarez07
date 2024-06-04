import plagas.*

class Hogar {
	var nivelMugre
	var property confort
	
	method nivelMugre(unaCantidad) {
 		nivelMugre = nivelMugre + unaCantidad
	}	
	method nivelMugre() = nivelMugre
	
	method esBueno(){
		return nivelMugre <= confort / 2
	}
	method recibirAtaqueDe(unaPlaga){
		self.nivelMugre(unaPlaga.nivelDanio())
		unaPlaga.efectoDeAtaque()
	}
}

class Huerta {
	var capacidadDeProduccion
	method capacidadDeProduccion(unaCantidad){
		capacidadDeProduccion = capacidadDeProduccion - unaCantidad
	}  
	method capacidadDeProduccion() = capacidadDeProduccion
	method esBueno(){
		return capacidadDeProduccion > nivelProduccion.nivelASuperar()
	}
	method recibirAtaqueDe(unaPlaga){
		const disminucion = unaPlaga.nivelDanio() * 0.1 + 
		if (unaPlaga.transmiteEnfermedades()){10} else {0}
		self.capacidadDeProduccion(disminucion)
		unaPlaga.efectoDeAtaque()
	}
}

object nivelProduccion {
	var property nivelASuperar
}

class Mascota {
	var nivelSalud
	method nivelSalud(unaCantidad) {
 		nivelSalud = nivelSalud - unaCantidad
	}	
	method nivelSalud() = nivelSalud
	method esBuena(){
		return nivelSalud > 250
	}
	method recibirAtaqueDe(unaPlaga){
		if(unaPlaga.transmiteEnfermedades()){
			self.nivelSalud(unaPlaga.nivelDanio())
			unaPlaga.efectoDeAtaque()
		}
	}
}


//barrios

class Barrio {
	var property elementos = []
	method agregarElemento(unElemento){
		elementos.add(unElemento)
	}
	method sacarElemento(unElemento){
		elementos.remove(unElemento)
	}
	method esCopado(){
		const elementosBuenos = self.cantidadElementosBuenos()
		return elementosBuenos > elementos.size() - elementosBuenos
	}
	method cantidadElementosBuenos(){
		return elementos.count{e => e.esBueno()}
	}
}















