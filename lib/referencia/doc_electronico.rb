class DocumentoElectronico<ReferenciaBase
    attr_reader :m_edicion, :m_tipo_medio, :m_lugar_publicacion, :m_editor, :m_url, :m_fecha_acceso
    def initialize(a_autores,a_titulo,a_anio,a_edicion,a_tipo_medio,a_lugar_publicacion,a_editor,a_url,a_fecha_acceso)
        super(a_autores,a_titulo,a_anio)
        @m_edicion,@m_tipo_medio,@m_lugar_publicacion,@m_editor,@m_url,@m_fecha_acceso= a_edicion,a_tipo_medio,a_lugar_publicacion,a_editor,a_url,a_fecha_acceso
    end
    def to_s
        "#{@m_autor_formato} (#{@m_anio}),#{@m_titulo}(#{@m_edicion}). [#{@m_tipo_medio}]. #{@m_lugar}:#{@m_editor}.Disponible en:#{@m_url} #{@m_fecha_acceso}"
    end
end