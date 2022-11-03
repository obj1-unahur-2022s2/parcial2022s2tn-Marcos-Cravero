/*
 * La condicion en planta self.cantidadMaxima() < plantas.size() debía ser == o en todo caso <=
 * Recordá que al lanzar un Excepción corta la ejecución del método y por eso no es necesario encadenar con el else
 * Quizaś el método seAsociaBien(unaPlanta) debía ser  abstracto de Parcela y sobreescribirlo en las clase heredadas, pero eso te obligaba a camibar los test
 * Comparar un método que retorna un boolano contra true o false no es buena practica y es innecesario .parcelaIdeal(self) == true 
 */
import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	const property plantas = []
	
	method superficie() = ancho * largo
	
	method cantidadMaxima() {
		if (ancho > largo) {
			return self.superficie() / 5
		} else {
			return self.superficie() / 3 + largo
		}
	}
	
	method tieneComplicaciones() {
		return plantas.any({
			p => p.tolerancia() < horasDeSol
		})
	}
	
	method plantar(unaPlanta) {
		
		if(self.cantidadMaxima() == plantas.size()) {
			throw new UserException(message = "No hay más espacio para plantar")  
		}
		if (unaPlanta.tolerancia() < horasDeSol - 2) {
			throw new UserException(message = "La planta no tolera las horas de calor")  
		}
		plantas.add(unaPlanta)
		
	}	
	
	method cantidadDePlantas() {
		return plantas.size()
	}
	
	method tieneMasDe4Plantas() {
		return self.cantidadDePlantas() > 4
	}
	
	method cantidadDeBienAsociadas() {
		return plantas.count({
			p => p.parcelaIdeal(self) 
		})
	}
	
	//method seAsociaBien(unaPlanta)
}

class ParcelaEcologica inherits Parcela {
	
	method seAsociaBien(unaPlanta) {
		return not self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self)
	} 
}

class ParcelaIndustrial inherits Parcela {
	
	method seAsociaBien(unaPlanta) {
		return self.cantidadMaxima() <= 2 and unaPlanta.esFuerte()
	}
}

class UserException inherits Exception {}