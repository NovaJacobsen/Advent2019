$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'

module Day08
  layer_size = 25*6
  layers = Input.each_slice(layer_size)
  l = layers.min_by { |layer| layer.count(0) }
  l.count(1)*l.count(2)  # => 2048
end
