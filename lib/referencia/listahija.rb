#Clase que hereda de la Lista doble y sobre escribe el metodo each, ya que se comporta ligeramente diferente al original
class ListaHija<Lista
  def initialize
    super
  end
  def each
    aux =self.inicio
    while aux != nil do
      yield aux.value.to_s
      aux = aux.next
    end
  end

end