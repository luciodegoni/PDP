# WOLLOK GAME
Wollok-Game es una biblioteca que contiene el objeto game.
```
import wollok.game.*
```
### ATRIBUTOS DEL JUEGO
```
program PepitaGame {
    // Atributos del juego
    game.title("Pepita")
    game.height(10)
    game.width(10)
    game.cellSize(50)
    game.boardGround("fondoTablero.jpg")
    game.ground("fondoCeldo.jpg")
    game.start() // Sirve para iniciar el juego
}
```
### VISUALES
```
    game.addVisualCharacter(pepita) // Agrega a un objeto con métodos definidos para moverse, pero no pueden ser modificados
    game.addVisual(pepita) // Agregar un objeto visual
```
Agregar imagen a objeto, consulta constantemente
```
    method image() = "wollok.png"
```

### game.EVENTOS
```
    // onPress
        keyboard.right().onPressDo({ // Tecla flecha derecha
            pepita.position(pepita.position().right(1))
        })
    // onTick
        game.onTick(2000,"movimiento", {
        pepita.position(pepita.position(),down(1))
        })
    // removeTickEvent
        game.removeTickEvent(nombre del evento)
    // onCollide
        game.onCollideDo(pepita,game.say(pepita, "Ñam"))
    // whenCollide
        game.whenCollideDo(objeto, accionConColisionado)
    // schedule
        game.schedule(3000, { game.say(wollok, "¡Hola!") })
        game.start()
    // showAttributes(pepita)
        Al poner el mouse vemos el estado interno
    // hideAttributes(pepita)
        Esconder atributos
```
### TEXTOS
```
    game.say(pepita,
        if (pepita.estaCansada()) "Estoy cansada"
        else "Estoy para volar"
        )
    method text() = "¡Pepita!" // El objeto debe tener posicion
    method textColor() = "00FF00FF"
```
### POSICIONES
```
    game.at(2,3)
        game.at(2,3).x() // 2
        game.at(2,3).y() // 3
    game.origin() // (0,0)
    game.center()
```
Para objetos
```
    var position = game.at(18,8)

    method position() = position
    method position(newPos) {
        position = newPos
    }
```
### SONIDOS
```
   game.sound(audioFile)
        game.sound("water.mp3").play()
        game.sound("water.mp3").stop()
        game.sound("water.mp3").resume()
        game.sound("water.mp3").volume(0.5) // Mute con (0)
   game.sound(audioFile).shouldLoop(true) // Loop
```
### ERRORES
```
program ejemplo {
  //...
  game.errorReporter(caja)
  //...
}
```

### CHICHES
```
    0.randomUpTo(20) // Numero random de 0 a 20
```
