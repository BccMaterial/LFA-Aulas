class ADF
  def initialize(cadeia)
    @cadeia = cadeia
    @indice = 0
    @max = cadeia.size 
  end
  
  # iteração sobre os caractéres da cadeia
  def proximo()
    if @indice == @max
      return ""
    else
      return @cadeia[@indice]
    end
  end
  
  # teste de validação
  def iniciar()
    estado = "q0"
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
      # validações
      in ["", "q2"] 
        return "✅"
      in ["", "q3"]
        return "✅"
      in ["", "q4"]
        return "✅"
      else
        return "❌"
      end
      @indice += 1
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
