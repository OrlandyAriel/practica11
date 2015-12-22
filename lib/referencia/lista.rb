Node = Struct.new(:value,:next,:previus)
class Lista
  include Enumerable
  attr_accessor:inicio, :fin, :tamanio
  #Constructor
  def initialize
    @inicio = Node.new(nil)
    @fin = Node.new(nil)
    @tamanio = 0
  end
  #Inserta uno o varios elementos por el final (cabeza)
  def insertar_final(*a_elemento)
    a_elemento.each do |elemento|
      a_aux = Node.new(nil)
      a_aux.value = elemento

      if(@inicio.value == nil)
        @inicio = a_aux
        @fin = a_aux
      else
        a_aux.previus = @fin
        @fin.next = a_aux
        @fin = a_aux
      end
      @tamanio=@tamanio+1
    end
  end
  #Inserta uno o varios elementos por el principio (cola)
  def insertar_inicio(*a_elemento)
    a_elemento.each do |elemento|
      a_aux = Node.new(nil)
      a_aux.value=elemento

      if(@inicio.value == nil)
        @inicio = a_aux
        @fin = a_aux
        @tamanio=@tamanio+1
      else
        a_aux.next = @inicio
        @inicio.previus = a_aux
        @inicio = a_aux
      end
      @tamanio = @tamanio+1
    end
  end
  #Muestra la lista desde el inicio hasta el final
  def mostar_inicio_fin
    aux = @inicio
    p @inicio.value
    while aux.next  do
      aux = aux.next
      p aux.value
    end
  end
  #Muestra la lista desde el final hasta el principio
  def mostar_fin_inicio
    aux = @fin
    p @fin.value
    while aux.previus  do
      aux = aux.previus
      p aux.value
    end
  end
  #Extrae el primer elemento de la lista
  def extraerPrimerElemento
   @tamanio = @tamanio-1
    @inicio = @inicio.next

  end
  #Extrae el último elemento de la lista
  def extraerUltimoElemento
    @tamanio = @tamanio-1
    @fin = @fin.previus
    @fin.next = nil
  end
  def each
    aux =self.inicio
    while aux.next != nil do
      yield aux.value
      aux = aux.next
    end
  end
end
