$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'star_map'

module Day10
  map = StarMap.new(Input)
  best = map.asteroids.max_by { |asteroid| map.visible_asteroids(asteroid).count }
  best  # => {:x=>8, :y=>16}
  bet_winner = map.visible_asteroids(best)[199]  # => {:x=>5, :y=>2}
  bet_winner[:x]*100 + bet_winner[:y]  # => 502
end
