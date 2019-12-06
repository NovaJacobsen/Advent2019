$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'orbit_map'

om = OrbitMap.new(*@input)

om.total_distance_to_com  # => 314247
