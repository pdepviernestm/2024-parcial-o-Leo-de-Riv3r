class Persona {
  var edad
  const emociones = []

  method esAdolescente() = edad.between(12, 19)

  method nuevaEmocion(emocion) {
    emociones.add(emocion)
  }

  method puedeExplotarEmocionalmente() = emociones.all({emocion => emocion.puedeLiberarse()})

  method vivirEvento(evento) {
    emociones.forEach({emocion => emocion.vivirEvento(evento)})
  }

  //metodos creados para usar en los tests
  method intensidadEmociones () = emociones.sum({emocion => emocion.intensidad()})
}

class Grupo {
  const personas = []

  method vivirEvento (evento) {
    personas.forEach({persona => persona.vivirEvento(evento)})
  }
}

class Evento {
  var property impacto
  var descripcion
}

object intensamente{
  var property valorIntensidadElevada = 200
}