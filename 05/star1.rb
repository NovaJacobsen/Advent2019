$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer05'

module Day05
  computer = Computer.new(*@input, input: [1]).run
  computer.output  # => [0, 0, 0, 0, 0, 0, 0, 0, 0, 5577461]
end
