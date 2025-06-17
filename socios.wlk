import viajes.*
import clasesGimnasia.*
import mutual.*

class Socio {
  const actRealizadas 
  var maxActPuedeHacer
  var edad 
  const property idiomasQueHabla = #{}

  method actividadesRealizadas() = actRealizadas

  method edad() = edad

  method esAdoradorDelSol() = actRealizadas.all({a=>a.sirveParaBroncearse()})

  method actividadesEsforzadas() = actRealizadas.filter({a=>a.implicaEsfuerzo()})

  method registrarActividad(unaActividad) {
    if (actRealizadas.size() == maxActPuedeHacer){
        throw new Exception(message = "Alcanzaste el nivel maximo de actividades que podes realizar")
    }
    actRealizadas.add(unaActividad)  

  }
  method leAtraeAlSocio(unaActividad) {
    
  }
//   method eliminarActividad(unaActividad) { // metodo para corroborar el codigo
//     actRealizadas.remove(unaActividad)
//   }

}

class SocioTranquilo inherits Socio{
    override method leAtraeAlSocio(unaActividad) = unaActividad.diasLleva() >= 4
}

class SocioCoherente inherits Socio{
    // le atrae si sirve para broncearse o si la act implica esfuerzo
    override method leAtraeAlSocio(unaActividad) = unaActividad.sirveParaBroncearse() or unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio{
    override method leAtraeAlSocio(unaActividad) = !self.idiomasQueHabla().intersection(unaActividad.idiomas()).isEmpty()

}