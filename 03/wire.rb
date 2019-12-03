class Wire

  def initialize(instructions)
    @positions = {}
    x,y = 0,0
    steps = 0
    instructions.split(',').each do |step|
      repeats = step[1..-1].to_i
      repeats.times do
        case step[0]
        when /u/i
          y -= 1
        when /d/i
          y += 1
        when /r/i
          x += 1
        when /l/i
          x -= 1
        else
          raise "Invalid direction #{step[0,1]}"
        end
        steps +=1
        @positions[Pos.new(x,y)] ||= steps
      end
    end
  end

  def over?(pos)
    !!@positions[pos]
  end

  def timing(pos)
    @positions.fetch(pos)
  end

  def intersections(other)
    @positions.keys.select do |pos|
      other.over? pos
    end
  end

end

Pos = Struct.new(:x, :y) do
  def distance
    x.magnitude + y.magnitude
  end
end
