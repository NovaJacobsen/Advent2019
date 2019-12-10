$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'star_map'

module Day10
  describe StarMap do
    it 'has all the asteroids' do
      map = StarMap.new(<<EOF.chomp)
.#..#
.....
#####
....#
...##
EOF
      asteroid = {x: 3, y: 4}
      expect(map.asteroids.count).to eq 10
      expect(map.asteroids).to include asteroid
    end
    it 'knows the number of visible asteroids from any asteroid' do
      map = StarMap.new(<<EOF.chomp)
.#..#
.....
#####
....#
...##
EOF
      asteroid = {x: 3, y: 4}
      expect(map.visible_asteroids(asteroid).size).to eq 8
    end

    it 'returns visible asteroids in scan order' do
      map = StarMap.new(<<EOF.chomp)
####
####
####
EOF
      expect(map.visible_asteroids({x:1, y:1})).to eq [
        {x: 1, y: 0}, {x: 2, y: 0}, {x: 3, y: 0},
        {x: 2, y: 1}, {x: 3, y: 2}, {x: 2, y: 2},
        {x: 1, y: 2}, {x: 0, y: 2}, {x: 0, y: 1},
        {x: 0, y: 0}
      ]
    end
  end
end

