class ADF
  def initialize(cadeia)
    @cadeia = cadeia
    @indice = 0
    @max = cadeia.size 
  end
  
  # pega apenas um caracter
  def proximo()
    # puts "Índice  #{@indice}:"
    if @indice == @max
      ""
    else
      @cadeia[@indice]
    end
  end
  
  def iniciar
    estado = "q0"
    # puts "Máquina iniciou no estado: " + estado
    loop do
      case [proximo(), estado]
      in ["b", "q0"]
        estado = "q0"
      in ["a", "q0"]
        estado = "q1"
      in ["b", "q1"]
        estado = "q0"
      in ["a", "q1"]
        estado = "q2"
      in ["a", "q2"]
        estado= "q3"
      in ["b", "q2"]
        estado= "q4"
      in ["b", "q3"]
        estado = "q4"
      in ["a", "q3"]
        estado = "q5"
      in ["a", "q4"]
        estado= "q4"
      in ["b", "q4"]
        estado= "q4"
      in ["a", "q5"]
        estado = "q5"
      in ["b", "q5"]
        estado = "q0" 
      in ["", "q2"] # verificar
        puts "✅"
        break
      in ["", "q3"]
        return "✅"
      in ["", "q4"]
        return "✅"
      else
        return "❌"
      end
      @indice += 1
      # puts "Cadeia: #{@cadeia[0..@indice]}" 
      # puts "Estado: #{estado}"
      # puts "\n"
    end
  end
end

cadeias = [
  "aabb", 
  "ab", 
  "baab", 
  "baaaaabaaabbbbaaaa", 
  "aaaaa"
]

puts "Resultados:"
puts "----------------------------"
cadeias.each { |cadeia|
  adf = ADF.new(cadeia)
  resultado = adf.iniciar()
  puts "#{cadeia} #{resultado}"
}
puts "----------------------------"
