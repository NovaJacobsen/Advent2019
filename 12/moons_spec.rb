
$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'moons'

module Day12
  describe Moons do
    it 'creates a moon for each input line' do
      moons = Moons.new([
        '<x=-1, y=0, z=2>',
        '<x=2, y=-10, z=-7>'
      ])
      expect([
        moons[0].x, moons[0].y, moons[0].z
      ]).to eq [-1, 0, 2]
      expect([
        moons[1].x, moons[1].y, moons[1].z
      ]).to eq [2, -10, -7]
    end

    it 'applies gravitational attraction to all moons every step' do
      moons = Moons.new([
        '<x=-1, y=0, z=2>',
        '<x=2, y=-10, z=-7>',
        '<x=4, y=-8, z=8>',
        '<x=3, y=5, z=-1>'
      ])
      moons.step
      moon = moons[0]
      expect([moon.vx, moon.vy, moon.vz]).to eq [3, -1, -1]
    end

    it 'calculates potential and kinetic energy for all moons' do
      moons = Moons.new([
        '<x=-1, y=0, z=2>',
        '<x=2, y=-10, z=-7>',
        '<x=4, y=-8, z=8>',
        '<x=3, y=5, z=-1>'
      ])
      moons.step(10)
      expect(moons[0].ekin).to eq 6
      expect(moons[2].epot).to eq 10
      expect(moons[3].energy).to eq 18
      expect(moons.energy).to eq 179
    end
  end
end
