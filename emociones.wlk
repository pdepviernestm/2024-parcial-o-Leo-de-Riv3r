import example.*

class Emocion{
  var property intensidad
  //no interesa saber los eventos vividos, solo la cantidad
  var eventosVividos = 0

  method puedeLiberarse()
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

  method tieneIntensidadElevada() = intensidad > intensamente.valorIntensidadElevada()

  method vivioEventosPar() = eventosVividos % 2 == 0

  method vivirEvento(evento) {
    eventosVividos += 1
    if(self.puedeLiberarse()) {
      self.liberarse(evento)
    }
  }
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
}

class Tristeza inherits Emocion {
  //se considera causa como una cadena de caracteres
  var causa = "melancolia"
  override method puedeLiberarse() = self.tieneIntensidadElevada() && causa != "melancolia"

  override method reducirIntensidad(cantidad) {
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
  var nivelAnsiedad
  //Utilizando la herencia, las variables y los mensajes de la clase emocion forman parte de la clase ansiedad, pudiendo ser utilizadas
  //en la interfaz 
  
  override method puedeLiberarse() = eventosVividos > intensidad && nivelAnsiedad > 100

  override method aplicarEfectos(evento) {
    nivelAnsiedad = 0
  }
  //para que las personas puedan vivir un evento y tener consecuencias, es necesaro que cada una de las emociones
  //conozca el mensaje vivirEvento, dentro de vivirEvento se utiliza los mensajes puedeLiberarse y liberarse
  //aplicando polimorfismo, se logra que cada emocion tenga diferentes condiciones para poder liberarse
  //y existan diferentes consecuencias al liberarse.
}