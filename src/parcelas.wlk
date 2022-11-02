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
		
		if(self.cantidadMaxima() < plantas.size()) {
			throw new UserException(message = "No hay más espacio para plantar")  
		} else if (unaPlanta.tolerancia() < horasDeSol - 2) {
			throw new UserException(message = "La planta no tolera las horas de calor")  
		} else {
			plantas.add(unaPlanta)
		}
	}	
	
	method cantidadDePlantas() {
		return plantas.size()
	}
	
	method tieneMasDe4Plantas() {
		return self.cantidadDePlantas() > 4
	}
	
	method cantidadDeBienAsociadas() {
		return plantas.count({
			p => p.parcelaIdeal(self) == true
		})
	}
}

class ParcelaEcologica inherits Parcela {
	
	method seAsociaBien(unaPlanta) {
		return not self.tieneComplicaciones() and unaPlanta.parcelaIdeal(self)
	} 
}

class ParcelaIndustrial inherits Parcela {
	
	method seAsociaBien(unaPlanta) {
		return self.cantidadMaxima() == 2 and unaPlanta.esFuerte()
	}
}

class UserException inherits Exception {}