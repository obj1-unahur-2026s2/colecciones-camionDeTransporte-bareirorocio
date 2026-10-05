object camion {
    const cosas = []
    method cargar(objetoACargar){
        cosas.add(objetoACargar)

    }
    method descargar(objetoADescargar){
        cosas.remove(objetoADescargar)
    }
    method peso(){
        return 1000 + cosas.sum{c => c.peso()}
    } 
    method todosLosPesosSonPares(){
        return cosas.all{ c => c.peso () % 2 == 0}
    }

    method tienePeso(pesoBuscado){
        return cosas.any{ c => c.peso() == pesoBuscado}
    }

    method objetoConPeligrosidad(nivelDePeligrosidad){
        return cosas.find{ c => c.peligrosidad() == nivelDePeligrosidad}
    } 

    method peligrosidadMayorA(nivelDePeligrosidad){
        return cosas.filter{ c => c.peligrosidad() > nivelDePeligrosidad}
    }

    method superanNivelDePeligrosidad(unObjeto){
        return cosas.filter{c => c.peligrosidad() > unObjeto.peligrosidad()}
    }
    method excesoDePeso(){
        return self.peso() > 2500
    }
    method puedeCircularEnRuta(nivelPeligrosidad){
        return !self.excesoDePeso() and !cosas.any{c => c.peligrosidad() > nivelPeligrosidad}
    }
    method pesaEntre(pesoMin,pesoMax){
        return cosas.any{c => c.peso() >= pesoMin and c.peso() <= pesoMax}
    }
    method objetoMasPesado(){
        return cosas.max{c => c.peso()}
    }


}
