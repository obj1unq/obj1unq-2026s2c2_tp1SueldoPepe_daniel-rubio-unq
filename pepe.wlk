object pepe {


	var categoria = gerente
	var bonoDeResultado = bonoResultadoNulo
	var bonoDePresentismo = bonoPresentismoNulo
	var diasFaltado = 0
	
	method categoria () = categoria
	method categoria (_categoria){
		categoria = _categoria
	}
	
	method bonoDeResultado () = bonoDeResultado
	method bonoDeResultado(_bonoDeResultado){
		bonoDeResultado = _bonoDeResultado
	}
	
	method bonoDePresentismo(_bonoDePresentismo){
		bonoDePresentismo = _bonoDePresentismo
	}
	
	method diasFaltado() = diasFaltado
	method diasFaltado(_diasFaltado){
		diasFaltado = _diasFaltado
	}
	
	method sueldo() = 
		categoria.sueldoNeto() + 
		bonoDeResultado.calcularBono(categoria.sueldoNeto()) + 
		bonoDePresentismo.calcularBono(categoria.sueldoNeto(), diasFaltado)
}	

object cadete{
	const sueldoNeto = 20000
	method sueldoNeto() = sueldoNeto

}
object gerente{
	const sueldoNeto = 15000
	method sueldoNeto() = sueldoNeto
}


object bonoResultadoNulo{
	method calcularBono(sueldoNeto) = 0
}
object bonoResultadoMontoFijo{
	method calcularBono(sueldoNeto) = 800
}
object bonoResultadoPorcentaje{
	method calcularBono(sueldoNeto) = sueldoNeto * 0.1
}


object bonoPresentismoAjuste{
	method calcularBono(sueldoNeto, diasFaltado) = if(diasFaltado == 0){100}else{0}
}
object bonoPresentismoDemagogico{
	method calcularBono(sueldoNeto, diasFaltado) = if(sueldoNeto < 18000){500}else{300}
}
object bonoPresentismoNormal{
	method calcularBono(sueldoNeto, diasFaltado){
		return if(diasFaltado == 0){
					2000
				}else{
					if(diasFaltado == 1){
						1000
					}else{
						0
					}
				}
	}
}
object bonoPresentismoNulo{
	method calcularBono(sueldoNeto, diasFaltado) = 0
}