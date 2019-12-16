$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'moons'

module Day12
  moons = Moons.new Input
  moons.step 1000
  moons.energy  # => 7179
end
