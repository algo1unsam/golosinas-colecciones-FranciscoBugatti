object bombon {
    const property precio = 5
    const property sabor = "frutilla"
    var property pesoGr = 15
    const property gluten = 0

    method comer(mordisco) {
      pesoGr = pesoGr - (((pesoGr * 0.2)+1)*mordisco)
      return pesoGr
    }
}
object alfajor {
    const property precio = 12
    const property sabor = "chocolate"
    var property pesoGr = 300
    const property gluten = 1

    method comer(mordisco) {
      pesoGr = pesoGr - ((pesoGr * 0.2)*mordisco)
      return pesoGr
    }
}
object caramelo {
    const property precio = 1
    const property sabor = "frutilla"
    var property pesoGr = 5
    const property gluten = 0

    method comer(mordisco) {
      pesoGr = pesoGr - mordisco
      return pesoGr
    }
}
object chupetin {
    const property precio = 2
    const property sabor = "naranja"
    var property pesoGr = 7
    const property gluten = 0

    method comer(mordisco) {
      if(pesoGr > 2){
        pesoGr = pesoGr - ((pesoGr * 0.1)*mordisco)
      }
      return pesoGr
    }
}
object oblea {
    const property precio = 5
    const property sabor = "vainilla"
    var property pesoGr = 250
    const property gluten = 1

    method comer(mordisco) {
      if(pesoGr > 70){
        pesoGr = pesoGr - ((pesoGr * 0.5)*mordisco)
      }else{
      pesoGr = pesoGr - ((pesoGr * 0.25)*mordisco)
      }
      return pesoGr
    }
}
object choco {
    var property precio = (0.5 * self.pesoGr())
    const property sabor = "chocolate"
    var property pesoGr = 0
    const property gluten = 1

    method comer(mordisco) {
      pesoGr = pesoGr - (mordisco * 2)
      return pesoGr
    }


}
object banada {
    var property precio = null
    var property sabor = null
    var property pesoGr = null
    var property gluten = null
    var property base = null

    method banar(golo) {
        precio = golo.precio() + 2
        sabor = golo.sabor()
        pesoGr = golo.pesoGr() + 4
        gluten = golo.gluten()
        base = golo
    }

    method comer(mordisco) {
      pesoGr = base.comer(mordisco)
      if(mordisco == 1){
        pesoGr -= 2
      }else{
        pesoGr -= 4
      }
      return pesoGr
    }

}
object tutti {
    var property precio = (7 + (3 * self.gluten()))
    var property sabor = naranja
    const property pesoGr = 5
    var property gluten = 0
    //const property sabores = ["frutilla","chocolate","naranja"]
    //tutti.sabores().get(0) para devolver "frutilla", o tutti.sabores().first()

    method morder() {
        sabor = sabor.proximo()
        return sabor
    }
}
object frutilla {
    method proximo () = chocolate
}
object chocolate {
    method proximo () = naranja
}
object naranja {
    method proximo () = frutilla
}
object vainilla {
    method proximo () = self
}


//PARTE2//////////////////
//map() transforma
//personas.map({persona => persona.edad()})
//en este caso transforma de lista de "objetos" a una 
//lista de numeros con susm respectivas edades
//.asSet() combierte a conjunto una lista
//.asList() combierte a lista un conjunto

object mariano {
  var property bolsa = []
  var property plata = 99999

  method comprar(unaGolosina) {}
  method desechar(unaGolosina) {}
  method probarGolosinas() {}
  method hayGolosinaSinTACC() {}
  method preciosCuidados() {}
  method golosinaDeSabor(unSabor) {}
  method golosinasDeSabor(unSabor) {}
  method sabores() {}
}
