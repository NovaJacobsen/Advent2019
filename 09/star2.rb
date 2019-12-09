$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer09'

module Day09
  boost = Computer.new(*Input)
  boost.input = [2]
  boost.run.output  # => [42202]
end
