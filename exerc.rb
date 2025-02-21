class ADF
    def initialize(cadeia)
        @cadeia = cadeia
        @indice = 0
        @max = cadeia.size 
    end
  
  # pega apenas um caracter
  def proximo
    puts "Entre com o próximo símbolo:"
    if @indice == @max
        ""
    else
        @cadeia[@indice]
    end
  end
  
  def iniciar
    estado = "q0"
  
    puts "Máquina iniciou no estado: " + estado
  
    loop do
      case [proximo, estado]
      in ["b", "q0"]
        estado = "q0"
      in ["a", "q0"]
        estado = "q1"
      in ["b", "q1"]
        estado = "q0"
      in ["a", "q1"]
        estado = "q2"
      if ["a", "q2"]
        estado= "q3"
      if ["b", "q2"]
        estado= "q4"
      if ["b", "q3"]
        estado = "q4"
      if ["a", "q3"]
        estado = "q5"
      if ["a", "q5"]
        estado= "q5"
      if ["b", "q5"]
        estado= "q0"
      if ["a", "q4"]
        estado = "q4"
      if ["b", "q4"]
        estado = "q4" 
      in ["", "q2"] #verificar
        puts "Aceito 😀"
        break
      else
        puts "Erro"
        break
      end
  
      @indice += 1
      puts "Estado: " + estado
    end
  end
  end
  
  adf = ADF.new("aabb")
  adf.iniciar