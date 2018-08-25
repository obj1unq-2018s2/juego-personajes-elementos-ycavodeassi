object luisa {
	var personajeActivo
	
	method asignarPersonajeActivo(personaje) { personajeActivo = personaje }
	method aparece(elemento) { personajeActivo.encontrar(elemento) }
}


object floki {
	var arma
	
	method darArma(unArma) { arma = unArma }
	method encontrar(elemento) {
	    if (arma.estaCargada()) {
	        elemento.recibirAtaque(arma.potencia()) 
	        arma.registrarUso()
	    }
	}
}


object mario {
	var valorRecolectado = 0
	var ultimoElementoEncontrado
	
	method encontrar(elemento) {
	    valorRecolectado += elemento.valorQueOtorga()
	    elemento.recibirTrabajo()
	    ultimoElementoEncontrado = elemento
	}
	
	method esFeliz() { 
		return valorRecolectado >= 50 or ultimoElementoEncontrado.altura() >= 10 
	}
	method valorRecolectado() { return valorRecolectado }
}

