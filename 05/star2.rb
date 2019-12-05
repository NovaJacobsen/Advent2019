$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer05'

module Day05
  computer = Computer.new(*@input, input: [5]).run
  computer.output  # => [7161591]
end
