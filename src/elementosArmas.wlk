object castillo {
	var nivelDeDefensa = 150
	method altura() { return 20 }
	
	method nivelDeDefensa() { return nivelDeDefensa }
	method recibirAtaque(potencia) { nivelDeDefensa -= potencia }
	
	method valorQueOtorga() { return nivelDeDefensa / 5 }
	method recibirTrabajo() { nivelDeDefensa = (nivelDeDefensa + 20).min(200) }	
}

object aurora {
	var estaViva = true
	
	method altura() { return 1 }
	method estaViva() { return estaViva }
	method morir() { estaViva = false }
	method recibirAtaque(potencia) { 
		if (potencia >= 10) { self.morir() }
	}	

	method valorQueOtorga() { return 15 }
	method recibirTrabajo() { }	
}

object tipa {
	var altura = 8
	
	method altura() { return altura }
	method recibirAtaque(potencia) { }	

	method valorQueOtorga() { return altura * 2 }
	method recibirTrabajo() { altura += 1 }	
}

object ballesta {
	var cantidadFlechas = 10
	
	method estaCargada() { return cantidadFlechas > 0 }
	method potencia() { return 4 }
	method registrarUso() { cantidadFlechas -= 1 }
	method cantidadFlechas() { return cantidadFlechas }
}

object jabalina {
	var estaCargada = true

	method estaCargada() { return estaCargada }
	method potencia() { return 30 }
	method registrarUso() { estaCargada = false }
}

