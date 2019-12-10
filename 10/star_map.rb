module Day10
  class StarMap
    def initialize(raw)
      @data = raw.gsub("\n", '')
      @width = raw.split("\n").first.size
    end

    def asteroids
      @asteroids ||= @data.each_char.with_index.reject do |char, _|
        char != '#'
      end.map do |_, index|
        y,x = index.divmod(@width)
        {x: x, y: y}
      end
    end

    def visible_asteroids(origin)
      found = []
      asteroids.reject { |a| a == origin }
        .select do |a|
        dx = origin[:x] - a[:x]
        dy = origin[:y] - a[:y]
        gcd = dx.gcd dy
        angle = {x: dx/gcd, y: dy/gcd}
        unless found.include? angle
          found << angle
        end
      end
    end
  end
end
