$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'moons'

module Day12
  moons = Moons.new Input
  moons.repeat_time  # => 428_576_638_953_552
end
