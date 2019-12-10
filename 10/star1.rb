$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'star_map'

module Day10
  map = StarMap.new(Input)
  best = map.asteroids.max_by { |asteroid| map.visible_asteroids(asteroid).count }
  best  # => {:x=>8, :y=>16}
  map.visible_asteroids(best).count  # => 214
end
