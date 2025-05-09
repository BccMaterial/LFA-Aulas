class TuringMachine
  attr_accessor :tape, :state, :head

  def initialize
    @estado = :q0
    @cursor = 0
  end

  def processar(entrada)
    @fita = "$" + entrada + "#"
    @estado = :q0
    @cursor = 0

    while true
      case [@estado, @fita[@cursor]]
      in [:q0, "$"] 
        operar("$", :q1, :D)


      # in [:q1, s] if not ["a", "b", "#"].include?(s)
        # operar(s, :q5, :E)
      in [:q1, "#"]
        operar("#", :q5, :E)
      in [:q1, "a"] 
        operar("_", :q2, :E)
      in [:q1, "_"] 
        operar("_", :q1, :D)
      in [:q1, "b"] 
        operar("b", :q1, :D)

      in [:q2, "$"]
        operar("$", :q3, :D)
      in [:q2, "_"] 
        operar("_", :q2, :E)
      in [:q2, "b"] 
        operar("b", :q2, :E)

      in [:q3, "b"] 
        operar("_", :q4, :D)
      in [:q3, "_"] 
        operar("_", :q3, :D)
      in [:q3, "a"] 
        operar("a", :q3, :D)

      in [:q4, "$"]
        operar("$", :q1, :D)
      in [:q4, "#"]
        operar("#", :q4, :E)
      in [:q4, "b"]
        operar("b", :q4, :E)
      in [:q4, "_"]
        operar("_", :q4, :E)
      in [:q4, "a"]
        operar("a", :q4, :E)

      in [:q5, "_"]
        operar("_", :q5, :D)
      in [:q5, "$"]
        operar("$", :q5, :D)
      in [:q5, "#"]
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

  def fita
    @fita
  end

  def cursor
    @cursor
  end

  def estado
    @estado
  end
end

input = "ababab"
tm = TuringMachine.new
puts "Entrada: #{input}"
puts "Aceito? #{tm.processar(input)}"
puts "Fita #{tm.fita}"
puts "Cursor #{tm.cursor}"
puts "Estado #{tm.estado}"
