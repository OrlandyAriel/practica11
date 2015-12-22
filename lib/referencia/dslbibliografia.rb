class DslBibliografia
  include Comparable
  #Metodo que sirve para poder comparar objetos del mismo tipo
  def <=>(other)
    return nil if other.nil? #Si el valor con el que se compara es nil, saldr� y retornara que lo es
    t_comparaciones=self.m_autor <=> other.m_autor
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
  attr_accessor :m_titulo, :m_anio, :m_autor,:m_revista, :m_libro,:m_periodico,:m_doc_electronico

  def initialize(a_titulo, a_fecha, &block)
    self.m_titulo = a_titulo
    self.m_anio = a_fecha
    self.m_autor = []
    self.m_revista = []
    self.m_libro = []
    self.m_periodico = []
    self.m_doc_electronico =[]
    if block_given?
      if block.arity == 1
        yield self
      else
        instance_eval &block
      end
    end
  end
  #Método que muestra, según lo los atributos que tenga, la información del articulo
  def to_s
    salida = "\t#{m_titulo}\n"

    salida << "Autores: #{m_autor.join(', ')}\n"
    salida << "Año: #{m_anio}\n"
    if m_revista.size >0
      salida << "Articulo de Revista: #{m_revista}\n"

    elsif m_doc_electronico.size>0
      salida << "Documento Electronico: #{m_doc_electronico}\n\n"

    elsif m_libro.size>0
      salida << "Libro: #{m_libro}\n"

    elsif m_periodico.size>0
      salida << "Articulo de Periodico: #{}\n\n"
    end
    salida
 
  end

  #Metodo para definir el o los autores del articulo
  def autor (nombre, options={})
    autor = nombre
    autor << "#{options[:apellido]}" if options[:apellido]
    autor << "#{options[:nombre]}" if options[:nombre]
    m_autor << autor
  end
  
 
  
  #Definición de los atributos propios de una Revista
  def revista(arg,options={})
    revista= arg
    revista << "#{options[:nombre_revista]}" if options[:nombre_revista]
    revista << "#{options[:volumen]}" if options[:volumen]
    revista << "#{options[:numero]}" if options[:numero]
    revista << "#{options[:paginas]}" if options[:paginas]
    m_revista<<revista
  end
  
 
  
  #Definición del titulo
  def titulo(a_titulo)
    titulo = a_titulo
  end
end