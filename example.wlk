class Persona {
  var edad
  const emociones = []

  method esAdolescente() = edad.between(12, 19)

  method nuevaEmocion(emocion) {
    emociones.add(emocion)
  }

  method explotaEmocionalmente() = emociones.all({emocion => emocion.puedeLiberarse()})

  method vivirEvento(evento) {}
}

class Evento {
  var impacto
  var descripcion

}