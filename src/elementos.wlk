//De cada elemento nos va a interesar el alto. El `castillo` mide 20 metros, 
//`aurora` mide 1 metro, la `tipa` arranca en 8 metros pero puede crecer (ya veremos cómo)
//debemos manejar el _nivel de defensa_ del `castillo` 
//(un valor numérico que arranca en 150), y si `aurora` _está viva_ o no (nace viva).

object castillo {
	const property altura = 20
	var property nivelDeDefensa = 150
	
	method recibirAtaque(potenciaDeAtaque) { nivelDeDefensa -= potenciaDeAtaque }
	method valorQueOtorga() = nivelDeDefensa / 5
	method recibirTrabajo() = {
		nivelDeDefensa = (nivelDeDefensa + 20).min(200) //min & max
	}
}

object aurora {
	const property altura = 1
	var property estaViva = true
	
	method morir() { estaViva = false }
	method recibirAtaque(potenciaDeAtaque) { 
		if (potenciaDeAtaque >= 10) {
			self.morir()
		}
	}
	method valorQueOtorga() = 15
	method recibirTrabajo() {}
}

object tipa {
	var property altura = 8
	
	method recibirAtaque(powerDamage) {}
	method valorQueOtorga() = altura*2
	method recibirTrabajo() { altura += 1 }
}
