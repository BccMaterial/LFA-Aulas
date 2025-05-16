require './turing_machine.rb'

input = "aabb"
tm = TuringMachine.new
puts "Entrada: #{input}"
puts "Decidiu? #{tm.processar(input)}"
puts "Fita #{tm.fita}"
puts "Cursor parou em #{tm.cursor}"
puts "Cursor no estado #{tm.estado}"
