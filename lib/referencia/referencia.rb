class ReferenciaBase
  include Comparable
  
  attr_reader :m_titulo, :m_anio, :m_autor_formato, :m_autores

  def <=>(other)
    return nil if other.nil? #Si el valor con el que se compara es nil, saldrá y retornara que lo es
    t_comparaciones=self.m_autor_formato <=> other.m_autor_formato
    if(t_comparaciones == 0)
      t_comparaciones=self.m_anio <=> other.m_anio
      if (t_comparaciones == 0)
        t_comparaciones=self.m_anio <=> other.m_titulo
        if(t_comparaciones == 0)
          t_comparaciones
        end
      end
    end
    t_comparaciones
  end

  def initialize(a_autores, a_titulo, a_anio)
    @m_autores,@m_titulo,@m_anio = a_autores,a_titulo,a_anio
    format_autor
    format_titulo
  end
  #coloca los nombres de los autores y se guarda el formato de dicho nombre
  def format_autor
    @m_autor_formato = []
    @m_autores.each do |autor|
      auxiliar=""
      autor = autor.split(" ")
      autor = autor.reverse
      autor.each_with_index do |aux, i|
        #auxiliar.clear
        if (i<1)
          auxiliar += aux.capitalize
          auxiliar += ","
        else
          auxiliar += aux[0].capitalize
          auxiliar += "."
        end
      end
      @m_autor_formato.push(auxiliar)
    end
    
    #para poner los autores, si son varios, separados por &
    t_aux =@m_autor_formato
    @m_autor_formato = ""
    t_aux.each_with_index do |aux,i|
      if i<@m_autores.size-1
        @m_autor_formato+=aux
        @m_autor_formato+=" & "
      else
        @m_autor_formato+=aux
      end
    end
  end
  
  
  #formato del titulo
  def format_titulo
    t_titulo_formateado = ""
    aux = @m_titulo.split". "
    aux.each do |aux1|
      t_titulo_formateado += aux1.capitalize
      t_titulo_formateado += ". "
    end
    @m_titulo = t_titulo_formateado
    @m_titulo=@m_titulo.chop.chop # de esta manera elimino las dos últimas posiciones ". " que se añaden al final
  end
end