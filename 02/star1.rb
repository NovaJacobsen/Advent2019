$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer'

program = @input
program[1] = 12
program[2] = 2

computer = Computer.new *program

computer.final_state.first  # => 3790645
