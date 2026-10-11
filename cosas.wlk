object cosas {
    
}

object knightRider{
    method peso()= 500
    method peligrosidad()=10
    method bultoOcupado()= 1
    method consecuenciaDeCarga(){}

}

object bumblebee{
    var transformadoEn = auto
    method peso() = 800 
    method peligrosidad() = transformadoEn.peligrosidad()
    method cambiarTransformacion(transformarA){
        transformadoEn = transformarA 
    }
    method bultoOcupado()= 2
    method consecuenciaDeCarga() {
        self.cambiarTransformacion(robot)
    }
}

object auto{
    method peligrosidad() = 15
}

object robot{
    method peligrosidad() = 30
}

object paqueteDeLadrillos{
    var ladrillos = 2 
    method peso() = ladrillos * 2
    method peligrosidad()= 2
    method cantidadDeLadrillos(nuevaCantidad){
        ladrillos = nuevaCantidad
    }
    method bultoOcupado(){
        if(ladrillos == 100){
            return 1
        }
        else{
            if(ladrillos <= 300 && ladrillos >= 101){
                return 2
            }
            else{
                return 3
            }
        }
    }
    method consecuenciaDeCarga(){
        ladrillos = ladrillos + 12
    }
}

object arenaAGranel{
    var peso=20
    method peso() = peso
    method nuevoPeso(pesoNuevo){
        peso = pesoNuevo
    }
    method peligrosidad()=1
    method bultoOcupado()= 1
    method consecuenciaDeCarga(){
        peso = peso - 10
    }
}

object bateriaAntiAerea{
    var tieneMisiles = false
    method peso() {
        if(tieneMisiles){
            return 300
        }
        else{
            return 200
        }
    }
    method peligrosidad(){
        if(tieneMisiles){
            return 100
        }
        else{
            return 0 
        }
    }
    method cargarMisiles(){
        tieneMisiles = true
    }
    method bultoOcupado(){
        if(tieneMisiles){
            return 2
        }
        else{
            return 1
        }
    }
    method consecuenciaDeCarga() {
    self.cargarMisiles()
}
}

object contenedorPortuario{
    const cosas = []
    method agregarCosa(objetoACargar){
        cosas.add(objetoACargar)
    }
    method sacarCosa(objetoASacar){
        cosas.remove(objetoASacar)
    }
    method peso(){
        return 100 + cosas.sum{c => c.peso()}
    }
    method peligrosidad(){
        if(cosas.size() > 0){
            return cosas.max{c => c.peligrosidad()}.peligrosidad()
        }
        else{
             return 0
        }
       
    }
    method verLasCosas(){
        return cosas
    }
    method bultoOcupado(){
        return 1 + cosas.sum{c => c.bultoOcupado()}
    }
    method consecuenciaDeCarga() {
    cosas.forEach({ c => c.consecuenciaDeCarga() }) 
    // recorre la coleccion y cada uno de los elementos hace consecuencia de carga.
}
}

object residuosRadioactivos{
    var peso = 50
    method peso()= peso 
    method cambiarPeso(nuevoPeso){peso = nuevoPeso}
    method peligrosidad()=200
    method bultoOcupado()= 1
    method consecuenciaDeCarga() {
    peso += 15
}
}

object embalajeDeSeguridad{
    var cosa = paqueteDeLadrillos
    method peso() = cosa.peso()
    method cambiarCosa(nuevoObjeto){
        cosa = nuevoObjeto
    }
    method peligrosidad(){
        return cosa.peligrosidad() / 2
    }
    method bultoOcupado()= 2
    method consecuenciaDeCarga() {}
}

