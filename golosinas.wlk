object bombon {
    const property precio = 5
    const property sabor = frutilla
    var property pesoGr = 15
    const property gluten = 0

    method comer(mordisco) {
      pesoGr = pesoGr - (((pesoGr * 0.2)+1)*mordisco)
      return pesoGr
    }
}
object alfajor {
    const property precio = 12
    const property sabor = chocolate
    var property pesoGr = 300
    const property gluten = 1

    method comer(mordisco) {
      pesoGr = pesoGr - ((pesoGr * 0.2)*mordisco)
      return pesoGr
    }
}
object caramelo {
    const property precio = 1
    const property sabor = frutilla
    var property pesoGr = 5
    const property gluten = 0

    method comer(mordisco) {
      pesoGr = pesoGr - mordisco
      return pesoGr
    }
}
object chupetin {
    const property precio = 2
    const property sabor = naranja
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
    const property sabor = vainilla
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
    const property gluten = 1
    var property sabor = chocolate
    var pesoGr = 0
    var pesoGr_inicial = 0
    var property precio = 0

    method peso() = pesoGr
    method peso(valor) {
        pesoGr = valor
        pesoGr_inicial = valor
        precio = valor * 0.5
    }


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
    var property cont = 0
    //const property sabores = ["frutilla","chocolate","naranja"]
    //tutti.sabores().get(0) para devolver "frutilla", o tutti.sabores().first()

    method comer(mordisco) {
        cont = mordisco
       // sabor = sabor.proximo()
        if (cont > 1){
          self.mordiscos(cont)
        }else if (cont == 1){
          sabor = sabor.proximo()
        }
        return sabor
    }

    method mordiscos(mordisco) {
      sabor = sabor.proximo()
      cont -= 1
      self.comer(cont)
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
object melon {
  
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

  method comprar(unaGolosina) {
    bolsa.add(unaGolosina)
    plata -= unaGolosina.precio()
  }
  method desechar(unaGolosina) {
    bolsa.remove(unaGolosina)
  }
  method probarGolosinas(mordisco) {
    bolsa.forEach{ golosina => golosina.comer(mordisco)}
  }
  method hayGolosinaSinTACC() {
    var nose = bolsa.any({golosina => golosina.gluten() == 0 })
    return nose
  }
  method barato() {
    var nose = bolsa.all({golosina => golosina.precio() <= 10 })
    return nose
  }
  method golosinaDeSabor(unSabor) {
    var nose = #{}
    nose = bolsa.find({golosina => golosina.sabor() == unSabor })
    return nose
  }
  method golosinasDeSabor(unSabor) {
    var nose = #{}
    nose = bolsa.filter({golosina => golosina.sabor() == unSabor })
    return nose
  }
  method sabores() {
    var sabrozo = #{}
    bolsa.forEach{ golosina => sabrozo.add(golosina.sabor())}
    return sabrozo
  }
  method golosinaMasCara() {
    var precios = #{}
    bolsa.forEach{ golosina => precios.add(golosina.precio())}
    var nose = precios.max()
    var nose2 = bolsa.find({golosina => golosina.precio() == nose })
    return nose2
  }
//  method golosinaMasCara() = bolsa.max{golosina => golosina.precio()}
  method pesoGolosinas(){
    var pesos = []
    bolsa.forEach{ golosina => pesos.add(golosina.pesoGr())}
    var nose = pesos.sum()
    return nose
  } 
  method golosinasFaltantes(golosinas_deseadas) {
  var nose= #{}
  nose = golosinas_deseadas.filter({golosina => !bolsa.contains(golosina)})
  return nose
 }
 method gustosFaltantes(gustos_deseados) {
  var nose= #{}
  nose = gustos_deseados.filter({golosina => !bolsa.contains(golosina.sabor())})
  return nose
 }
}
// mariano.comprar(bombon)
// mariano.desechar()
// mariano.probarGolosinas()
// mariano.hayGolosinaSinTACC()
// mariano.preciosCuidados()
// mariano.golosinaDeSabor(frutilla)
// mariano.golosinasDeSabor()
// mariano.sabores()