class CitasBibliograficas
  include Enumerable
  attr_accessor :m_lista
  def initialize(a_lista)
    @m_lista = a_lista
    ordenarlista
  end
  
  def ordenarlista
    t_lista_aux= Lista.new

    a= self.m_lista.sort
    
    a.each do |aaaa|
      t_lista_aux.insertar_final(aaaa.to_s)
    end
    @m_lista=t_lista_aux
  end
  #Muestra la el orden de la lista formateada
  def mostrar
    @m_lista.mostar_inicio_fin
  end
  #devuelve en forma de string todo el contenido de la lista
  def to_s
    t_resultado = ""
    @m_lista.each do |elemento|
      t_resultado += elemento.to_s
    end
    t_resultado
  end
  def each
    aux = @m_lista.inicio
    while (aux != nil)
      yield aux.value
      aux = aux.next
    end
  end
  
end