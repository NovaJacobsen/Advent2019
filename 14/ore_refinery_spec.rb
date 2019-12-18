$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'ore_refinery'

module Day14
  describe OreRefinery do
    it 'Can calculate how many reactions are needed for producing an amount of a reagent' do
      refinery = OreRefinery.new
      # generate from 3 to 0 in increments of 1
      expect(refinery.reactions(3,0,1)).to eq 0

      # generate from 0 to 1 in increments of 2
      expect(refinery.reactions(0, 1, 2)).to eq 1

      # generate from 3 to 11 in increments of 4
      expect(refinery.reactions(3, 11, 4)).to eq 2
    end

    it 'can generate any resource made out of ore' do
      refinery = OreRefinery.new([
        '5 ORE => 2 FUEL'
        ])

      refinery.generate_fuel 1
      expect(refinery.ore_cost).to eq 5
    end

    it 'can use leftovers from a previous reaction' do
      refinery = OreRefinery.new([
        '5 ORE 2 A => 2 FUEL',
        '8 ORE => 8 A'
        ])

      refinery.generate_fuel 1 # costs 13 and leavs 6 A, 1 fuel
      refinery.generate_fuel 1 # in stock
      refinery.generate_fuel 1 # costs 5 and leaves 4 A
      expect(refinery.ore_cost).to eq 18
    end
  end
end

