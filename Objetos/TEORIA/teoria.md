[IR A CODIGO](#CODIGO)
# CONCEPTOS
## ENCAPSULAMIENTO
El encapsulamiento es un mecanismo para reunir datos y métodos dentro de una estructura ocultando la implementación del objeto,
es decir, impidiendo el acceso a los datos por cualquier medio que no sean los servicios propuestos. Hay ciertos datos que son
accesible y otros que están encapsulados

## COMPOSICION
Un objeto tiene una cierta composición, lo que forma la INTERFAZ del objeto.

## MENSAJES
Los objetos interactúan entre sí por medio de mensajes. Cosas que le puedo pedir a unn objeto que haga.
1. Conocer al objeto.
2. Al concerlo se qué mensajes le puedo mandar.
3. No necesito saber cómo porque eso ME ACOPLA (me ata) al objeto.

Es importante la ABSTRACCIÓN. Concentrarse solo en lo que uno quiere resolver.
Si a un objeto se le pide una cosa debe hacer únicamente esa cosa. Simplificar al cliente.
Mensaje es lo que el objeto emisor le envía como orden al receptor.

Existen mensajes de consulta y mensajes de ordenes

## AMBIENTE / IMAGEN / VM
Es donde "viven" los objetos.

## REFERENCIAS 
Los objetos se conocen a través de referencias.
Una variable apunta o referencia un objeto.

## METODO
El emisor no sabe cómo se resuelve un mensaje, sólo pide que se resuelva. 
El receptor recibe el mensaje y se ejecuta un método (porción de código).

## MÉTODO LOOKUP
Para responder a un mensaje, se busca en la definición de la clase y se termina resolviendo para los atributos de la instancia.

## POLIMORFISMO
Para los objetos que comparte métodos, estos operan de distinta forma dependiendo del objeto que los llame

## ESTADO
Es el conjunto de referencias que tiene un objeto. El estado de un objeto solo puede ser manipulado por métodos definidos en el propio objeto a través de un mensaje. Cada referencia define un ATRIBUTO, que tiene un nombre, un valor y el objeto apuntado.

## ACCESORS
Es un tipo de mensaje cuyo fin es publicar la referencia (getter) o modificar dicha referencia (setter)

## GETTER vs SETTER
**Getter**: Método de una linea que devuelve algo.

**Setter**: Modifica el estado interno del objeto.

## REFERENCIAS
Variables (var)
Valores (const)

### INTERFAZ
Contrato que permite que otros objetos le hablen al objeto.

### IMPLEMENTACIÓN
Cómo termina trabajando el objeto el mensaje.

## IDENTIDAD
En el ambiente cada objeto tiene su propia identidad
Dos referencias son idénticas si apuntan a un mismo objeto
Cada objeto sabe que es es él y ningún otro objeto más, es el responsable de responder ante un mensaje

## COLECCIONES
Permite representar un conjunto de objetos relacionados. Ej: jugadores, cardumen, lista de productos
Existen dos tipos de colecciones

### CONJUNTOS
Modelan al conjunto matemático. No hay orden en los elementos y no puee haber repetidos
Se definen de la siguiente forma

### LISTAS
Los elementos tienen un orden y puede haber repetidos

## SELF
Dentro del contexto de un método es una referencia al propio objeto donde estamos ubicados.

## TESTEO UNITARIO AUTOMATIZADO
**UNITARIO**

	El tipo de testeo que abordamos se califica como "unitario", porque la estrategia, en vez de hacer una gran y extensa prueba de un programa completo, se basa en identificar unidades significativas del código y probar casos puntuales donde éstas intervengan

**AUTOMATICO**


	Se puede automatizar su ejecución y consecuentemente su validación

**INDEPENDENCIA**


	Cada uno de ellos se concibe de forma independiente de cualquier otro test
	Cada uno se corre a partir de la situación inicial del sistema. El ambiente se reinicia entre tests

**INFORMACIÓN SINTÉTICA Y PRECISA**


	Cuando se corre el test, la información que arroja es bien sintética, dice que funcionó si funcionó
	Ahora, si no funciono, advierte con mayor contundencia

## CLASES
Cuando se tienen objetos con el mismo comportamiento, es posible, a fin de no tener código duplicado crear una clase. 

## INSTANCIAS
A cada uno de lo objetos que se crearán a través de la clase se los llama instancia, los ejemplos concretos. Las instancias se crean con la palabra reservada **new**

## WKO vs OBJETOS ANONIMOS vs CLASES
- los objetos anónimos tienen un alcance acotado, por ejemplo un test, o la resolución de un requerimiento (un método y todo el encadenamiento de mensajes que sale de ese método). Lo mismo pasa cuando necesitamos construir un bloque para pasárselo a filter, o al map de una colección: el objeto que representa al bloque no tiene nombre y no nos importa que lo tenga, existe para resolver el requerimiento puntual.
- objetos autodefinidos o wko: son objetos conocidos, porque están representando un concepto de negocio dentro de la aplicación. Esto ocurre cuando un objeto tiene un comportamiento específico, y nos interesa modelarlo en forma separada de otros objetos. 
- por último, las clases son importantes cuando existen múltiples objetos que comparten comportamiento y no tiene sentido que los nombre por separado: el viaje que hice ayer en colectivo, se parece mucho al viaje de la semana pasada. Si solo difieren en la información que guardan las referencias, el comportamiento se debe ubicar en un solo lugar para no repetir la misma idea una y otra vez.

## EXCEPCIONES DE USUARIO Y DE PROGRAMA
### Excepciones de usuario o de dominio
Ocurren en el uso de la aplicación y son entendibles para el usuario final (“no hay saldo en la cuenta corriente”, “no hay stock del producto a facturar”, “no hay precio del producto a facturar”, etc.)
### Excepciones de programa
Se producen cuando se ejecuta código de la aplicación y las puede analizar un especialista técnico (“falló el acceso al motor de la base de datos”, “hubo división por cero”, “el objeto no entiende este mensaje”, etc.) 

## LOOKUP CON HERENCIA
1. primero se busca la definición en el objeto (en el wko)
2. si no se encuentra un método y el objeto hereda de una clase, se busca en esta clase
3. Se busca en la superclase hasta encontrarla o bien llegar a Object y fallar.


# CODIGO
## UN OBJETO
```
const juan = object {
   var mascota  = firulais;
	  method mascota(_mascota) { 
		 mascota = _mascota
		 mascota.duenio(self)
	}
}

object firulais {
	 var duenio = juan;
   method duenio(_duenio) { duenio = _duenio }
}
```
- Justo estos dos tienen relacion bidireccional
- Dos objetos pueden compartir valores

## NUMEROS
```
const a = 1
const b = a + 10   suma
b = b - 1        resta
b = b * 2        multiplicación
b = b / 2        división
b = b % 2        resto
b = b ** 3       elevado a (3 en este caso)
5.between(2, 7)  preguntamos si 5 está entre 2 y 7 ==> sí
3.min(6)         el menor número entre 3 y 6 ==> 3
3.max(6)         el mayor número entre 3 y 6 ==> 6
(3.1416).truncate(0)   la parte entera de 3.1416 ==> 3 -- (3.1416).truncate(2) 3.14
(3.1416).roundUp(0)    el primer entero mayor a 3.1416 ==> 4  -- (3.1416).roundUp(2)   3.15
*/
const hecho = true && true
const esTrue = true
const esFalse = false

const seraFalse = esTrue && esFalse

const seraTrue = esTrue || esFalse
const a = !false
```
## STRINGS
```
const unString = "hola"
const otroString = 'mundo'
const holaMundo = unString + " " + otroString + " !"
```
## FECHAS
```
const hoy = new Date()        // toma la fecha del día
const unDiaCualquiera = new Date(day = 24, month = 11, year = 2017)
							  // se ingresa en formato día, mes y año
hoy
hoy.plusYears(1)              // sumo un año
hoy.plusMonths(2)             // sumo 2 meses
hoy.plusDays(20)              // sumo 20 dias
hoy.isLeapYear()              // pregunto si el año es bisiesto
hoy.dayOfWeek()               // qué día de la semana es
hoy.month()                   //mes
hoy.year()                    //anio
const ayer = hoy.minusDays(1) // resto un día para obtener el día de ayer
ayer < hoy                    // comparo fechas
ayer - hoy                    // diferencia entre ayer y hoy
const haceUnMes = hoy.minusMonths(1)
ayer.between(haceUnMes, hoy)  // ayer está entre hace un mes y hoy
```
## CONJUNTOS
```
const numeros = #{1,2,3,4}
```
## LISTAS
```
const fila = ["albondigas", "fideos", "salsa"]
```

## TESTS
- import archivo.*
- describe "test" {}
- assert.equals(,)
- assert.that()
- assert.notThat()

## OBJETO ANONIMO
Se asignan a una referencia y se usan en el contexto en el que se los creó
```
	const pasajeroJoven = object {
		method esJoven() = true
	}
```
## PROPIEDADES
Una propiedad en Wollok permite explicitar un contrato específico para una referencia:
```
object dodge1500 {
	var property color = "bordó"
	const property patente = "RVM 363"
}
```
- si la referencia es variable (var), Wollok genera su getter y setter
- si la referencia es constante (const), Wollok genera el getter
Estos accessors terminan creandose implícitamente

## CLASES
### Una clase
```
class Libro {
	var property precio = 100
	method esCaro() = precio > 150
	method aumentar(aumento) { precio = precio + aumento }
}
```
### Crear instancia
```
const elPrincipito = new Libro()
```
## INSTANCIAR
Teniendo una clase
```
class Presentacion {
	var property lugar
	const property musicos
	var property valorEntrada
	var property entradasVendidas
	...
}
```
Es posible inicializar la instancia en la creación. **Se puede hacer en cualquier orden** 
```
	const seruEnLuna = new Presentacion(
	lugar = lunaPark, 
	musicos = [seruGiran], 
	valorEntrada = 2000, 
	entradasVendidas = 180)
```
- En caso que no se le envíe, mantiene en valor con que se inicializó.
- En caso que se envíe un valor por parámetro, se asigna éste en vez del definido en la inicialización.

## HERENCIA
```
object gollum  inherits Hobbit(5,22,"Anillo") {
	var kilometrosCaminados = 0 // variable extra
	override method poder() = return super()/2
}
```
### HERENCIA vs COMPOSICIÓN
La herencia marca una relación entre clases (es estática), la superclase tiene características más generales mientras que la subclase toma comportamiento específico y cuando es necesario lo redefine. En la composición no hay una jerarquía de clases, sino que intervienen dos instancias: una conoce a la otra y le envía mensajes.
Ejemplo:
```
class Descuento {
	method porcentaje() = self.descuento() / 100
	method descuento()
}
El método descuento no tiene cuerpo, es un método abstracto (solo sirve para forzar a que las subclases implementen dicha interfaz), y provoca entonces que la clase Descuento sea abstracta.
```
Luego para instanciar los descuentos
```
class DescuentoComun inherits Descuento{
	override method descuento() = 5
}

class DescuentoJubilados inherits Descuento{
	var aporte
	override method descuento() = aporte/2
}
Uso clases cuando hay comportamiento diferente (cuando el código es diferente). Sino objetos con diferente parametro

```
## CLASE ABSTRACTA
Tiene sentido como una forma de agrupar comportamiento y atributos para las subclases, no para generar instancias
En algunos lenguajes esta definición es explícita: no podés crear una instancia de Ave si dijiste que era una clase abstracta. Al hacer new Ave() el compilador chequea que Ave no sea abstracta y en ese caso se produce un error. En el caso de Wollok se asume que si no se utilizó new Ave() es una clase abstracta.

## MANEJO DE ERRORES
Lanzar una excepción por cada condición que salga del flujo normal
### ENVIANDO MENSAJE
```
self.error("Pasó tal cosa")
```
### INSTANCIANDO EXCEPCIÓN
```
throw new UserException(message = "Pasó tal cosa")
```
Por ejemplo:
```
method poner(cantidad) { 
  if (cantidad < 0) {
   throw new UserException(message = "La cantidad debe ser positiva")
} 
plata += cantidad
}
```
### TRY and CATCH
```
method compraDirecta() {
  try {
    const cliente = new Cliente()
    cliente.comprar(25)
    ...
    return 0
  } catch e : NoTengoUnMangoException	{
    return -1
  }
}
```