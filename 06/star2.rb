$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'orbit_map'

om = OrbitMap.new(*@input)

mid = om.highest_common_orbit('YOU','SAN')
 # => "KPS"

d_mid = om.distance_to_com(mid)
 # => 52

d_you = om.distance_to_com('YOU')
 # => 278

d_san = om.distance_to_com('SAN')
 # => 342

d_you + d_san - (2 * d_mid) - 2
 # => 514

# The last -2 is from YOU to its orbital center and from SAN to its orbital center
# As we only need to 'orbit the same object' we dont need to traverse these links
