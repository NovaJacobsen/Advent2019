
module Day12
  class Moons
    def initialize(lines)
      @moons = lines.map do |line|
        Moon.for line
      end
      @known_states = []
      @current_step = 0
      save_state
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
        @current_step += 1
        save_state
      end
    end

    def energy
      @moons.sum(&:energy)
    end

    def repeat_time
      generate_repeat_data
      @xr.lcm(@yr).lcm(@zr)
    end

    def generate_repeat_data
      until @xr && @yr && @zr do
        step
        @xr ||= @current_step if current_state[:x] == @known_states.first[:x] && current_state[:vx] == @known_states.first[:vx]
        @yr ||= @current_step if current_state[:y] == @known_states.first[:y] && current_state[:vy] == @known_states.first[:vy]
        @zr ||= @current_step if current_state[:z] == @known_states.first[:z] && current_state[:vz] == @known_states.first[:vz]
      end
    end

    def save_state
      @known_states[@current_step] = current_state
    end

    def current_state
    {
        x: @moons.map(&:x), 
        y: @moons.map(&:y), 
        z: @moons.map(&:z), 
        vx: @moons.map(&:vx), 
        vy: @moons.map(&:vy), 
        vz: @moons.map(&:vz) 
      }
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
