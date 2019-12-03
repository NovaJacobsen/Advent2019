$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'wire'

(a,b) = @input.map { |desc| Wire.new desc }

answer = a.intersections(b)
  .map{ |pos| a.timing(pos) + b.timing(pos) }
  .sort
  .first

answer  # => 27890
