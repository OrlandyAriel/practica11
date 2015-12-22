require 'spec_helper'
require 'referencia'
describe Referencia do
    context "# Clase Base -> ReferenciaBase" do
        before :each do
            @res=ReferenciaBase.new(["Pepe Perez"],"Las Pruebas de referencia","2014")
        end
        it "Existe la clase ReferenciaBase" do
            res=ReferenciaBase.new(["Pepe Perez"],"Las Pruebas de referencia","2014")
        end
    end
    context "# Clase -> Libro" do
        before :each do
            @libro = Libro.new(["George Martin"],"Juego de Tronos: Cancion de Hielo y Fuego","2006", "1","1ra","Tenerife","Gigamesh",["ISBN:9788496208377"])
        end
        it "Existe una clase libro" do
           lib = Libro.new(["George Martin"],"Juego de Tronos: Cancion de Hielo y Fuego","2006", "1","1ra","Tenerife","Gigamesh",["ISBN:9788496208377"])
        end
        it "Comprueba que debe existir uno o mas ISBN" do
            expect(@libro.m_isbn.length).not_to be 0
        end
        it "Comprueba que debe existir un titulo" do
            expect(@libro.m_titulo).not_to eq("")
        end
    end
    context "# Clase -> Revista" do
        before :each do
            @revista =  Revista.new(["Ellen tarantino"],"Busca del tesoro","2015","Aventuradores", "1","3", "50")
        end
        it "Existe una Clase Revista" do
            rev =  Revista.new(["Ellen tarantino"],"Busca del tesoro","2015","Aventuradores", "1","3", "50")
        end
        it "Comprueba que la Revista tiene un nombre" do
            expect(@revista.m_nombre_revista).not_to eq("")
        end

    end
    context "# Clase -> Documento Electronico" do
        before :each do
            @docElectornico=  DocumentoElectronico.new(["Rafael Vida"],"Blaster versus Welchi: Modelado del malware competitivo","07/05/2015","1ra","digital","Madrid","Chema Alonso","http://www.elladodelmal.com/2015/11/blaster-versus-welchi-modelado-del.html","07/05/2015")
        end
        it "Existe la clase DocumentoElectronico" do
            doc= DocumentoElectronico.new(["Rafael Vida"],"Blaster versus Welchi: Modelado del malware competitivo","07/05/2015","1ra","digital","Madrid","Chema Alonso","http://www.elladodelmal.com/2015/11/blaster-versus-welchi-modelado-del.html","07/05/2015")
        end
        it "Comprobar que existe una URL" do
            expect(@docElectornico.m_url).not_to eq("")
        end

    end
    context "# Clase -> Periodico" do
        before :each do
            @periodico = Periodico.new(["Risto Mejide"],"Un articulo de los de antes","2014","elPeriodico","1-1")
        end
        it "Existe una Clase Periodico" do
            per =  Periodico.new(["Risto Mejide"],"Un articulo de los de antes","2014","elPeriodico","1-1")
        end
        it "Comprueba que debe existir al menos un autor" do
           # expect(@periodico.m_autores.length).should_not be 0
           expect(@periodico.m_autores.length).not_to be 0
        end
        it "Comprueba que debe existir un Titulo" do
            expect(@periodico.m_titulo).not_to eq("")
        end
    end
    context " #Clase ->Lista" do
        before :each do
            @libro1 = Libro.new(["George Martin"],"Juego de Tronos: Cancion de Hielo y Fuego","2006", "1","1ra","Tenerife","Gigamesh",["ISBN:9788496208377"])
            @revista1 = Revista.new(["Ellen tarantino"],"Busca del tesoro","2015","Aventuradores", "1","3", "50")
            @periodico1 = Periodico.new(["Risto Mejide"],"Un articulo de los de antes","2014","elPeriodico","1-1")
            @docElectornico1 = DocumentoElectronico.new(["Rafael Vida"],"Blaster versus Welchi: Modelado del malware competitivo","07/05/2015","1ra","digital","Madrid","Chema Alonso","http://www.elladodelmal.com/2015/11/blaster-versus-welchi-modelado-del.html","07/05/2015")
            @lista = Lista.new()
        end
        it "Se puede crear una Lista" do
            li = Lista.new()
        end
        it "Se puede insertar un elemento al final" do
            @lista.insertar_final(@libro1)
        end
        it "Se puede insertar varios elemento al final" do
            @lista.insertar_final(@revista1,@docElectornico1)
        end
        it "Se puede insertar un elemento al principio" do
            @lista.insertar_inicio(@periodico1)
        end
        it "Se puede insertar varios elemento al principio" do
            @lista.insertar_inicio(@docElectornico1,@libro1)
        end
        it "La lista tiene una cola (inicio)" do
            expect(@lista.inicio.value).equal?@libro1
        end
        it "La lista tiene una cabeza (fin)" do
            expect(@lista.fin.value).equal?@docElectornico1
        end
    end
    context "# COMPROBACIÓN HERENCIA" do
        before :each do
            @res=ReferenciaBase.new(["Pepe Perez"],"Las Pruebas de referencia","2014")
            @libro = Libro.new(["George Martin"],"Juego de Tronos: Cancion de Hielo y Fuego","2006", "1","1ra","Tenerife","Gigamesh",["ISBN:9788496208377"])
            @revista = Revista.new(["Ellen tarantino"],"Busca del tesoro","2015","Aventuradores", "1","3", "50")
            @periodico = Periodico.new(["Risto Mejide"],"Un articulo de los de antes","2014","elPeriodico","1-1")
            @docElectornico = DocumentoElectronico.new(["Rafael Vida"],"Blaster versus Welchi: Modelado del malware competitivo","07/05/2015","1ra","digital","Madrid","Chema Alonso","http://www.elladodelmal.com/2015/11/blaster-versus-welchi-modelado-del.html","07/05/2015")
        end
        it "Comprobar que ReferenciaBase hereda de Object" do
            expect(@res.class.superclass).to eq(Object)
        end
        it "Comprobar que ReferenciaBase tambien hereda de BasicObject" do
            expect(@res.class.superclass.superclass).to eq(BasicObject)
        end
        #  it "Comprobar que ReferenciaBase hereda de Object" do
            #expect(@res.is_a?Object).to eq(true)
        #end
        it "Comprobar que Revista hereda de ReferenciaBase" do
            expect(@revista.class.superclass).to eq(@res.class)
        end
        it "Comprobar que @revista es de tipo Revista" do
            expect(@revista.class).to eq(@revista.class)
        end
        it "Comprobar que DocumentoElectronico hereda de ReferenciaBase" do
            expect(@docElectornico.class.superclass).to eq(@res.class)
        end
        it "Comprobar que @docElectornico es de tipo DocumentoElectronico" do
            expect(@docElectornico.class).to eq(@docElectornico.class)
        end
        it "Comprobar que Libro hereda de ReferenciaBase" do
            expect(@libro.class.superclass).to eq(@res.class)
        end
        it "Comprobar que @libro es de tipo Libro" do
            expect(@libro.class).to eq(@libro.class)
        end
        it "Comprobar que Periodico hereda de ReferenciaBase" do
            expect(@periodico.class.superclass).to eq(@res.class)
        end
        it "Comprobar que @periodico es de tipo Periodico" do
            expect(@periodico.class).to eq(@periodico.class)
        end
    end
    context "# MÓDULO COMPARABLE" do
         before :each do
            @res=ReferenciaBase.new(["Pepe Perez"],"Las Pruebas de referencia","2014")
            @libro = Libro.new(["George Martin"],"Juego de Tronos: Cancion de Hielo y Fuego","2006", "1","1ra","Tenerife","Gigamesh",["ISBN:9788496208377"])
            @revista = Revista.new(["Ellen tarantino"],"Busca del tesoro","2015","Aventuradores", "1","3", "50")
            @periodico = Periodico.new(["Risto Mejide"],"Un articulo de los de antes","2014","elPeriodico","1-1")
            @docElectornico = DocumentoElectronico.new(["Rafael Vida"],"Blaster versus Welchi: Modelado del malware competitivo","07/05/2015","1ra","digital","Madrid","Chema Alonso","http://www.elladodelmal.com/2015/11/blaster-versus-welchi-modelado-del.html","07/05/2015")
        end
        it "Comprobar <=> (<)" do
            expect(@libro < @revista).to eq(true)
        end
        it "Comprobar <=> (>)" do
            expect(@libro > @revista).to eq(false)
        end
        it "Comprobar <=> (<=)" do
            expect(@libro <= @revista).to eq(true)
        end
        it "Comprobar <=> (>=)" do
            expect(@libro >= @revista).to eq(false)
        end
    end
    context "# MÓDULO ENUMERABLE" do
         before :each do
            @libro1 = Libro.new(["George Martin"],"Juego de Tronos: Cancion de Hielo y Fuego","2006", "1","1ra","Tenerife","Gigamesh",["ISBN:9788496208377"])
            @revista1 = Revista.new(["Ellen tarantino"],"Busca del tesoro","2015","Aventuradores", "1","3", "50")
            @periodico1 = Periodico.new(["Risto Mejide"],"Un articulo de los de antes","2014","elPeriodico","1-1")
            @docElectornico1 = DocumentoElectronico.new(["Rafael Vida"],"Blaster versus Welchi: Modelado del malware competitivo","07/05/2015","1ra","digital","Madrid","Chema Alonso","http://www.elladodelmal.com/2015/11/blaster-versus-welchi-modelado-del.html","07/05/2015")
            @lista = Lista.new()
            @lista.insertar_final(@libro1,@revista1,@periodico1,@docElectornico1)
        end
        it "Comprobar min" do
            expect(@lista.min == @libro1).to eq(true)
        end
        #it "Comprobar max" do
         #   expect(@lista.max == @docElectornico1).to eq(true)
        #end
        it "Comprueba count " do
            expect(@lista.count).to eq(3)
        end
    end
    context "# Citas Referencias" do
        before :each do
            @lib1 = Libro.new(["George Martin"],"Juego de Tronos: Cancion de Hielo y Fuego","2006", "1","1ra","Tenerife","Gigamesh",["ISBN:9788496208377"])
            @periodico1 = Periodico.new(["Risto Mejide"],"Un artículo de los de antes","2014","elPeriódico","1-1")
            @docElectornico1 = DocumentoElectronico.new(["Orlandy Sanchez"],"Trucos de ruby","02/12/2015","1ra","digital","Carrel del CC","Responsable del cc","cc.etsii.ull.es","10/12/2015")
            @revista1 = Revista.new(["Ellen tarantino"],"Busca del tesoro","2015","Aventuradores", "1","3", "50")
            @lista = Lista.new
            @lista.insertar_final(@lib1,@periodico1,@docElectornico1,@revista1)
            @cita = CitasBibliograficas.new(@lista)
        end
        it "Comprobar que se puede crear una cita" do
            t_cita= CitasBibliograficas.new(@lista)
        end
         it "Comprobar que se puede obtener un string con toda la lista, to_s" do
            expect(@cita.respond_to?(:to_s)).to eq(true)
        end
        
        it "Comprueba que existe un metodo que ordene la lista de citas" do
            expect(@cita.respond_to?(:ordenarlista)).to eq(true)
        end
        
        it "Comprueba que existe un metodo que muestre las citas" do
            expect(@cita.respond_to?(:mostrar)).to eq(true)
        end
    end
    context "## DSL ##" do
        before :each do
            @revi=DslBibliografia.new("Prueba ","199") do
                autor   :apellido => "Sanchez",
                        :nombre => "Orlandy"
                revista :nombre_revista => "ruby",
                        :volumen => "1",
                        :numero => "5",
                        :paginas => "10"
                titulo "Prueba de Ruby"
            end
            @libr =DslBibliografia.new("Prueba libro","2015") do
                autor   :apellido => "sanchez",
                        :nombre => "orlandy"
                libro   :edicion => "Segunda",
                        :volumen => "5",
                        :lugar => "tenefife",
                        :isbn => "ISBN-1123123",
                        :editorial => "sanchez s.l"
                titulo "Libro de pruebas"
            end
            @peri =DslBibliografia.new("Periodico X","2000") do
                    autor       :apellido => "sanchez",
                                :nombre => "orlandy"
                    periodico   :nombre_periodico => "el dia",
                                :volumen =>"4",
                                :paginas => "10"
                    titulo "Noticia"
            end
            @docElec =DslBibliografia.new("Doc Digital", "2015") do
                autor :apellido => "sanchez",
                      :nombre => "orlandy"
                documentoElectronico :edicion => "Uno",
                                    :tipo_de_medio => "Digital",
                                    :editor => "Pepe Perez",
                                    :url => "www.ull.periodico.es",
                                    :fecha_de_acceso => "21/12/2015"
                titulo "Ruby Digital"
            end
        end
        it "Comprobar que existe una clase DslBibliografia" do 
            dsl = DslBibliografia.new("Prueba","2015")
        end
        it "Comprobar que se pueden añadir los atributos de una Revista" do
            rev =DslBibliografia.new("Prueba ","199") do
                autor   :apellido => "Sanchez",
                        :nombre => "Orlandy"
                revista :nombre_revista => "ruby",
                        :volumen => "1",
                        :numero => "5",
                        :paginas => "10"
                titulo "Prueba de Ruby"
            end
        end
        it "Comprobar que se pueden añadir los atributos de un Libro" do
            lib = DslBibliografia.new("Prueba libro","2015") do
                autor   :apellido => "sanchez",
                        :nombre => "orlandy"
                libro   :edicion => "Segunda",
                        :volumen => "5",
                        :lugar => "tenefife",
                        :isbn => "ISBN-1123123",
                        :editorial => "sanchez s.l"
                titulo "Libro de pruebas"
            end
        end
        it "Comprobar que se pueden añadir los atributos de un Periodico" do
            ped = DslBibliografia.new("Periodico X","2000") do
                    autor       :apellido => "sanchez",
                                :nombre => "orlandy"
                    periodico   :nombre_periodico => "el dia",
                                :volumen =>"4",
                                :paginas => "10"
                    titulo "Noticia"
            end
        end
        it "Comprobar que se pueden añadir los atributos de un Documento Electronico" do
            doc = DslBibliografia.new("Doc Digital", "2015") do
                autor :apellido => "sanchez",
                      :nombre => "orlandy"
                documentoElectronico :edicion => "Uno",
                                    :tipo_de_medio => "Digital",
                                    :editor => "Pepe Perez",
                                    :url => "www.ull.periodico.es",
                                    :fecha_de_acceso => "21/12/2015"
                titulo "Ruby Digital"
            end
        end
        it "Comprobar que se puede crear una lista Con las referencias" do 
            listah = ListaHija.new
            listah.insertar_final(@libr,@revi,@peri,@docElec)
        end
    end
end
