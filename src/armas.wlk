//A su vez, respecto de las armas tenemos estas definiciones respecto de la potencia,
//el uso, y cuándo se consideran cargadas.
//La `ballesta` nace con 10 flechas. Cada vez que se usa, pierde una flecha. 
//Está cargada si tiene flechas. Su potencia es 4.
//La `jabalina` nace cargada. Se puede usar solamente una vez, o sea, 
//con el primer uso deja de estar cargada. Su potencia es 30.


object ballesta {
	const property potencia = 4
	var cargaDisponible = 10
	
	method estaCargada() = cargaDisponible > 0
	method registrarUso() { cargaDisponible -= 1 }
}

object jabalina {
	const property potencia = 30
	var cargaDisponible = 1
	
	method estaCargada() = cargaDisponible > 0
	method registrarUso() { cargaDisponible -= 1}
}
