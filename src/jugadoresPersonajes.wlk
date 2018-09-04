import armas.*
import elementos.*

//En cada momento del juego, `luisa` está manejando uno de sus personajes, 
//es el _personaje activo_. En este modelo reducido,
//el personaje activo de `luisa` puede ser o bien `floki` o bien `mario`. 
//El objeto `luisa` debe entender el mensaje `aparece(elemento)`. 
//Cuando le llega este mensaje, `luisa` le dice a su personaje activo que encuentre 
//al elemento. 
//Luisa no nace con ningún personaje activo, hay que asignarle uno.
object luisa {
	var property personajeActivo = noHayPersonaje
	
	method encontrar(elemento) {}
	method aparece(elemento) {}
}

//En el método `encontrar(elemento)` de `floki` vemos que pasan dos cosas: 
//el elemento recibe un ataque con un valor que es la potencia del arma, 
//y el arma registra que ha sido usada. Hay una condición: que el arma esté cargada.
//Veamos cómo debe reaccionar cada elemento al recibir un ataque:
//El `castillo` disminuye su nivel de defensa en la potencia del ataque 
//(p.ej. si recibe un ataque de 30, disminuye el nivel de defensa en 30). 
//`aurora` muere si la potencia del ataque es 10 o más; si no, no le pasa nada. 
// a `tipa` no le pasa nada.

object floki {
	var property arma = null
	
	method encontrar(elemento) {
	    if (arma.estaCargada()) {
	        elemento.recibirAtaque(arma.potencia()) 
	        arma.registrarUso()
	    }
	}
}

//Pasemos ahora al método `encontrar(elemento)` de `mario`. 
//Hay dos cosas definidas y una que tenés que definir vos.
//Las dos cosas definidas son: el valor recolectado por `mario` 
//aumenta en un valor que depende del elemento, y el elemento recibe el trabajo que hace 
//`mario` sobre él.

//Veamos cómo es cada elemento respecto del valor y del trabajo:
//El `castillo` otorga como valor el 20% de su defensa (o sea, su defensa / 5). 
//Al recibir un trabajo, aumenta su defensa en 20, hasta un tope de 200. 
//O sea, si tiene 192 no pasa a 212, queda en 200 (atención acá: se puede usar `min`).
//`aurora` otorga como valor 15 unidades. Al recibir un trabajo, no le pasa nada.
//La `tipa` otorga como valor el doble de su altura. Al recibir un trabajo, su altura crece en un metro (porque se supone que la riegan y le dan nitratos, ponele).

//Se le tiene que poder preguntar a `mario` si _es feliz_ o no. <br> 
//`mario` es feliz si: o bien recolectó en total al menos 50 unidades, 
//o bien el último elemento con el que se encontró mide al menos 10 metros de alto.
//La acción que falta en el método `encontrar(elemento)` es necesaria para
//poder evaluar esta segunda condición.
object mario {
	var valorRecolectado = 0
	var property esFeliz
	
	method encontrar(elemento) {
	    valorRecolectado += elemento.valorQueOtorga()
	    elemento.recibirTrabajo()
	    esFeliz = valorRecolectado >= 50 || elemento.altura() >= 10
	}
}

object noHayPersonaje {
	// no hace falta ponerle ningún método, es solamente para marcarle a Luisa que no tiene ningún personaje activo
}