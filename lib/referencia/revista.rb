class Revista<ReferenciaBase
    attr_reader :m_nombre_revista, :m_volumen, :m_paginas, :m_numero
    def initialize(a_autores,a_titulo,a_anio,a_nombre_revista, a_volumen,a_numero, a_paginas)
        super(a_autores,a_titulo,a_anio)
        @m_nombre_revista,@m_volumen,@m_numero, @m_paginas = a_nombre_revista, a_volumen,a_numero, a_paginas
    end
    def to_s
         "#{@m_autor_formato}(#{@m_anio}). #{@m_titulo}. #{@m_nombre_revista}, #{@m_volumen}(#{@m_numero}),#{@m_paginas}"
    end
end