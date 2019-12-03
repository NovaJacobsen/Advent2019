$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'wire'

(a,b) = @input.map { |desc| Wire.new desc }

a.intersections(b).sort_by(&:distance).first.distance  # => 2427
