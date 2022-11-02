import parcelas.*
import plantas.*

object inta {
	const property parcelas = []
	
	method agregarParcela(parcela) {
		return parcelas.add(parcela)
	}
	
	method promedioDePlantas() {
		return self.parcelasACantidadDePlantas().sum() / parcelas.size()
	}
	
	method parcelasACantidadDePlantas() {
		return parcelas.map({
			p => p.cantidadDePlantas()
		})
	}
	
	method parcelasQueTienenMasDe4Plantas() {
		return parcelas.filter({
			p => p.tieneMasDe4Plantas()
		})
	}
	
	method masAutosustentable() {
		return self.parcelasQueTienenMasDe4Plantas().map({
			p => p.cantidadDeBienAsociadas()
		}).max()
	}
}