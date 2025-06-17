import mutual.*
class ClasesGimnasia inherits ActividadesMutual {
  override method idiomas(unIdioma) {
    if (unIdioma != "español"){
      throw new Exception(message= "El unico idioma aceptado es español")
    }
    idiomas.add(unIdioma) 
  }
  override method diasLleva() = 1
  override method implicaEsfuerzo() = true
  override  method sirveParaBroncearse() = false 
  override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)

}