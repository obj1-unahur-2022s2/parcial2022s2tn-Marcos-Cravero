import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	var property plantas = []
	
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
	
}

class UserException inherits Exception {}