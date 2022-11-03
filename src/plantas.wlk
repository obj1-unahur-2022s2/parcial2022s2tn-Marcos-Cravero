/*
 * El método tolerancia() de Hierbabuena es innecesario, por es heredado de Menta y tiene le mismo código que el de Menta
 * El método daSemillas() de Hierbabuena tampoco debía estar, porque ademas de ser innesesario por es heredado de Menta, en este caso la hacer un super() esta llamando al de Menta y el de Menta esta llamando al de Plata.   
 */
import parcelas.*

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
	
	method parcelaIdeal(parcela)
}

class Menta inherits Planta {
	
	override method espacio() = altura * 3
	
	override method tolerancia() = 6
	
	override method daSemillas() {
		return super() or altura > 0.4
	}
	
	override method parcelaIdeal(parcela) {
		return parcela.superficie() > 6
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
	
	override method parcelaIdeal(parcela) {
		return parcela.horasDeSol() == self.tolerancia()
	}
}

class Quinoa inherits Planta {
	var property tolerancia
	
	override method espacio() = 0.5
	
	override method daSemillas() {
		return super() or anioDeObtencion < 2005
	}	
	
	override method parcelaIdeal(parcela) {
		return parcela.plantas().all({
			p => p.altura() < 1.5
		})
	}
}

class SojaTransgenica inherits Soja {
	
	override method daSemillas() = false
	
	override method parcelaIdeal(parcela) {
		return parcela.cantidadMaxima() == 1
	}
}

class Hierbabuena inherits Menta {
	
	override method espacio() = super() * 2
	
	override method tolerancia() = 6
	
	override method daSemillas() {
		return super() or altura > 0.4
	}	
}