object cosas {
    
}

object knightRider{
    method peso()= 500
    method peligrosidad()=10

}

object bumblebee{
    var transformadoEn = auto
    method peso() = 800 
    method peligrosidad() = transformadoEn.peligrosidad()
    method cambiarTransformacion(transformarA){
        transformadoEn = transformarA 
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
}

object arenaAGranel{
    var peso=20
    method peso() = peso
    method nuevoPeso(pesoNuevo){
        peso = pesoNuevo
    }
    method peligrosidad()=1
}

object bateriaAntiAerea{
    var tieneMisiles = true
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
    method noTieneMisiles(){
        tieneMisiles = false
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
}

object residuosRadioactivos{
    var peso = 50
    method peso()= peso 
    method cambiarPeso(nuevoPeso){peso = nuevoPeso}
    method peligrosidad()=200
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
}

