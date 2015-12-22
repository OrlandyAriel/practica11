class Libro<ReferenciaBase

    attr_reader :m_edicion,:m_volumen,:m_lugar,:m_editorial, :m_isbn
    def initialize(a_autores,a_titulo,a_anio, a_edicion,a_volumen,a_lugar,a_editorial,a_isbn)
        super(a_autores,a_titulo,a_anio)
        @m_edicion,@m_volumen,@m_lugar,@m_editorial,@m_isbn =  a_edicion,a_volumen,a_lugar,a_editorial,a_isbn
    end
    def to_s
        "#{@m_autor_formato}(#{@m_anio}), #{@m_titulo}, (#{@m_edicion}), (#{@m_volumen}), #{@m_lugar}: #{@m_editorial}"
    end
end