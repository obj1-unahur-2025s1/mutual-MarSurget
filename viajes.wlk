import mutual.*

class Viajes inherits ActividadesMutual {
  method esInteresante() = idiomas.size() > 1
  override method esRecomendadaPara(unSocio) = self.esInteresante() and unSocio.leAtraeAlSocio(self) and !unSocio.actividadesRealizadas().contains(self)
}

class ViajesPlaya inherits Viajes{
  var largoPlaya
  override method diasLleva() = largoPlaya / 500
  override method implicaEsfuerzo() = largoPlaya > 1200 
  override  method sirveParaBroncearse() = true 
}

class ExcursionACiudad inherits Viajes {
  var cantidadAtracciones
  override method diasLleva() = cantidadAtracciones / 2
  override method implicaEsfuerzo() = cantidadAtracciones.between(5, 8) // implica si es 5,6,7,8 MAS O MENOS NO
  override  method sirveParaBroncearse() = false 
  override method esInteresante() = super() or cantidadAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
  override method diasLleva() = super() +1
  override  method sirveParaBroncearse() = true 

} 

class SalidaTrekking inherits Viajes{
  var kmSenderos
  var diasDeSolPorAñoLugar
  override method diasLleva() = kmSenderos / 50
  override method implicaEsfuerzo() = kmSenderos > 80
  override  method sirveParaBroncearse() = ((diasDeSolPorAñoLugar > 200) or (diasDeSolPorAñoLugar.between(100, 200)) and kmSenderos > 120)  
  override method esInteresante() = super() and diasDeSolPorAñoLugar > 140
}

