class Emocion{
  var intensidad
  var eventosVividos = 0
  //debe salir de un objeto global (mundo de intensamente o algo asi)
  var valorIntensidadElevada

  method puedeLiberarse() {}
  method liberarse(evento) {
    self.reducirIntensidad(evento.impacto())
    self.aplicarEfectos(evento)
  }

  method reducirIntensidad(cantidad) {
    intensidad -= cantidad
  }
  method aplicarEfectos(evento) {}

  method cambiarIntensidad(nuevaIntensidad) {
    intensidad = nuevaIntensidad
  }

  method tieneIntensidadElevada() = intensidad > valorIntensidadElevada

  method vivioEventosPar() = eventosVividos % 2 == 0
}

class Furia inherits Emocion (intensidad = 100){
  const palabrotas = []

  override method puedeLiberarse() = palabrotas.any({palabra => palabra.size() > 7})

  override method aplicarEfectos(evento) {
    palabrotas.remove(palabrotas.first())
  }
}

class Alegria inherits Emocion {
  override method puedeLiberarse() = self.tieneIntensidadElevada() && self.vivioEventosPar()

  override method reducirIntensidad(cantidad) {
    intensidad -= cantidad
    if (intensidad < 0) {
      intensidad *= (-1)
    }    
  }

  method cambiarIntensidad(nuevaIntensidad) {
    intensidad = nuevaIntensidad
  }
}

class Tristeza inherits Emocion {
  const palabrotas = []
  var causa = "melancolia"
  override method puedeLiberarse() = self.tieneIntensidadElevada()

  override method reducirIntensidad(cantidad) {
  }

  method cambiarIntensidad(nuevaIntensidad) {
    intensidad = nuevaIntensidad
  }

  override method aplicarEfectos(evento) {
    causa = evento.descripcion()   
  } 
}

class Desagrado inherits Emocion {
  override method puedeLiberarse() = self.tieneIntensidadElevada() && eventosVividos > intensidad
}

class Temor inherits Desagrado {

}

class Ansiedad inherits Emocion {
  
}