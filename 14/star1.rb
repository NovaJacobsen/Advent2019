$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'ore_refinery'

module Day14
  refinery = OreRefinery.new Input

  refinery.generate_fuel 1
  refinery.ore_cost # => 612880
end
