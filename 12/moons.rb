
module Day12
  class Moons
    def initialize(lines)
      @moons = lines.map do |line|
        Moon.for line
      end
    end

    def []index
      @moons[index]
    end

    def step(repeats = 1)
      repeats.times do
        @moons.permutation(2).each do |a,b|
          a.vx +=1 if b.x > a.x
          a.vx -=1 if b.x < a.x
          a.vy +=1 if b.y > a.y
          a.vy -=1 if b.y < a.y
          a.vz +=1 if b.z > a.z
          a.vz -=1 if b.z < a.z
        end
        @moons.each(&:move)
      end
    end

    def energy
      @moons.sum(&:energy)
    end
  end

  class Moon
    attr_accessor :x, :y, :z, :vx, :vy, :vz
    def self.for(raw)
      /<x=(?<x>.*), y=(?<y>.*), z=(?<z>.*)>/ =~ raw
      self.new(x.to_i, y.to_i, z.to_i)
    end

    def initialize(x,y,z)
      @x,@y,@z = x,y,z
      @vx, @vy, @vz = 0,0,0
    end

    def move
      @x += @vx
      @y += @vy
      @z += @vz
    end

    def ekin
      @vx.magnitude + @vy.magnitude + @vz.magnitude
    end

    def epot
      @x.magnitude + @y.magnitude + @z.magnitude
    end

    def energy
      epot * ekin
    end
  end
end
