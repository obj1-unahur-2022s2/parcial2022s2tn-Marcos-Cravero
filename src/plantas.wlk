class Planta {
	var property anioDeObtencion
	var property altura
	
	method tolerancia()
	
	method espacio()
	
	method esFuerte() {
		return self.tolerancia() > 10
	}
	
	method daSemillas() {
		return self.esFuerte()
	}
}

class Menta inherits Planta {
	
	override method espacio() = altura * 3
	
	override method tolerancia() = 6
	
	override method daSemillas() {
		return super() or altura > 0.4
	}	
}

class Soja inherits Planta {
	
	override method espacio() =  altura / 2
	
	override method tolerancia() {
		if (altura < 0.5) {
			return 6
		} else if (altura.between(0.5, 1)) {
			return 7
		} else {
			return 9
		}
	}
	
	override method daSemillas() {
		return super() or (anioDeObtencion > 2007 and altura > 1)
	}	
}

class Quinoa inherits Planta {
	var property tolerancia
	
	override method espacio() = 0.5
	
	override method daSemillas() {
		return super() or anioDeObtencion < 2005
	}	
}

class SojaTransgenica inherits Soja {
	
	override method daSemillas() = false
}

class Hierbabuena inherits Menta {
	
	override method espacio() = super() * 2
	
	override method tolerancia() = 6
	
	override method daSemillas() {
		return super() or altura > 0.4
	}	
}