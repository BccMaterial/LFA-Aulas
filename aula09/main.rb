class Pilha 
  def initialize
    @pilha = []
  end

  def push(e)
    if not e.nil?
      puts "Empilhou: " + e
      @pilha << e
    end
  end

  def pop
    @pilha.pop
  end
end

class APD
  # pega apenas um caracter
  def proximo
    puts "Entre com o próximo símbolo:"
    gets.chomp 
  end

  def iniciar
    estado = "q0"
    pilha = Pilha.new

    loop do
      case [proximo, estado, pilha.pop]
      in ["a", "q0", nil]
        estado = "q1"
        pilha.push("$")
      in ["a", "q1", topo]
        estado = "q1"
        pilha.push(topo)
        pilha.push("#")
      in ["b", "q1", topo]
        estado = "q2"
        pilha.push(topo)
        pilha.push("#")
      in ["b", "q2", topo]
        estado = "q2"
        pilha.push(topo)
        pilha.push("#")
      in ["b", "q2", "#"]
        estado = "q3"
      in ["c", "q3", "#"]
        estado = "q3"
      in ["d", "q3", "$"]
        estado = "q5"
      in ["d", "q4", "#"]
        estado = "q4"
      in ["d", "q4", "$"]
        estado = "q5"
      in ["", "q5", _]
        puts "Aceito"
        break
      else
        puts "Erro"
        break
      end

      puts "Estado: " + estado 
    end
  end
end

t = APD.new
t.iniciar
