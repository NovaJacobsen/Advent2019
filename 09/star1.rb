$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer09'

module Day09
  boost = Computer.new(*Input)
  boost.input = [1]
  boost.run.output  # => [3460311188]
end
