$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'ore_refinery'

module Day14
  refinery = OreRefinery.new Input

  refinery.max_fuel(limit: 1_000_000_000_000) # => 2509120
end
