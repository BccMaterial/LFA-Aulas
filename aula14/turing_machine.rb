require 'colorize'

class TuringMachine
  attr_accessor :fita, :estado, :cursor

  def initialize
    @estado = :q0
    @cursor = 0
  end

  def processar(entrada)
    @fita = "$" + entrada + " "*20 # fita semi-infinita, virtual

    while true
      print(fita_colorida + "Q: #{@estado}, leitura: #{@fita[@cursor]}\r")
      sleep(0.1)
      
      case [@estado, @fita[@cursor]]
      in [:q0, "$"] 
        operar("$", :q1, :D)

      in [:q1, "a"]
        operar("a", :q1, :D)
      in [:q1, " "]
        operar(" ", :q1, :D)
      in [:q1, "b"]
        operar(" ", :q2, :D)
        
      in [:q2, "b"]
        operar("b", :q3, :E)
      in [:q2, " "]
        operar(" ", :q5, :E)
      
      in [:q3, " "]
        operar(" ", :q3, :E)
      in [:q3, "a"]
        operar(" ", :q4, :E)
      
      in [:q4, "a"]
        operar("a", :q1, :D)
      in [:q4, "$"]
        operar("$", :q8, :D)

      in [:q5, " "]
        operar(" ", :q5, :E)
      in [:q5, "a"]
        operar(" ", :q6, :E)

      in [:q6, "a"]
        operar("c", :q6, :E)
      in [:q6, "$"]
        operar("$", :q7, :D)
        return true

      in [:q8, " "]
        operar(" ", :q8, :D)
      in [:q8, "b"]
        operar("b", :q9, :D)

      in [:q9, "b"]
        operar("b", :q9, :D)
      in [:q9, " "]
        operar(" ", :q10, :E)

      in [:q10, "b"]
        operar("d", :q10, :E)
      in [:q10, " "]
        operar(" ", :q11, :E)
        return true

      else
        return false
      end
    end
  end

  def operar(escrever, estado, movimento = :D)
    @fita[@cursor] = escrever
    @estado = estado
    if movimento == :D 
      @cursor += 1
    else
      @cursor -= 1
    end
  end

  def lendo
    fita_colorida[tm.cursor]
  end

  def fita_colorida
    fita_colorida = @fita.clone
    fita_colorida[cursor] = fita_colorida[cursor].colorize(:red)
    fita_colorida
  end

  def fita
    @fita
  end

  def cursor
    @cursor
  end
end
