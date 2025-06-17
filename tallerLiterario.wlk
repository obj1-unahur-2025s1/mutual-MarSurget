import mutual.*
class TallerLiterario inherits ActividadesMutual {
  const libros 

  override method idiomas(unIdioma) {
    idiomas.addAll(self.idiomasUsados()) 
  }

  method idiomasUsados() =  libros.map({l=>l.idioma()})
  
  method agregarLibro(unLibro) {
    libros.add(unLibro)
  }
  method librosDelMismoAutor() = libros.map({l=>l.nombreAutor()}).asSet()
  
  override method diasLleva() = libros.size() + 1
  
  override method implicaEsfuerzo() = libros.any({l=>l.cantidadPaginas() > 500}) or (libros.size()>1 and self.librosDelMismoAutor().size() == 1)
  
  override  method sirveParaBroncearse() = false

  override method esRecomendadaPara(unSocio) = unSocio.idiomasQueHabla().size() > 1

}

class Libro {
  const idioma
  const cantidadPaginas
  const nombreAutor  

  method idioma() = idioma
  method cantidadPaginas() = cantidadPaginas
  method nombreAutor() = nombreAutor

}