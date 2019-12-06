$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'orbit_map'

describe OrbitMap do
  context 'using the example map' do
    let :example_map do
      OrbitMap.new( 'COM)B', 'B)C', 'C)D', 'D)E', 'E)F', 'B)G', 'G)H', 'D)I', 'E)J', 'J)K', 'K)L')
    end

    describe '#distance_to_com' do
      it 'is 0 for the COM itself' do
        expect(example_map.distance_to_com('COM')).to be 0
      end

      it 'is 1 for any object directly orbiting the COM' do
        expect(example_map.distance_to_com('B')).to be 1
      end

      it 'increases with distance to the COM' do
        expect(example_map.distance_to_com('L')).to be 7
      end
    end

    describe '#total_distance_to_com' do
      it 'sums all distances in the map' do
        expect(example_map.total_distance_to_com).to eq 42
      end
    end
  end
end
