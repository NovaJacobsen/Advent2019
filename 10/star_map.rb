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
      asteroids.reject { |a| a == origin }.each do |a|
        los = LineOfSight.new(a, origin)
        found << los unless found.any? { |existing| existing.colinear?(los) }
      end

      found.sort.map { |los| los.a }
    end
  end

  class LineOfSight
    attr_reader :gcd, :dx, :dy, :a, :b

    def initialize(a,b)
      @dx = b[:x] - a[:x]
      @dy = b[:y] - a[:y]
      @a = a
      @b = b
      @gcd = dx.gcd dy
    end

    def rx
      dx/gcd
    end

    def ry
      dy/gcd
    end

    def colinear?(other)
      self.ry == other.ry && self.rx == other.rx
    end

    def <=>(other)
      return angle <=> other.angle unless colinear?(other)
      gcd <=> other.gcd
    end

    def angle
      return -5 if dy.positive? && dx.zero? # Because straight up should be first, not last
      Math.atan2(dx.to_f, -dy.to_f)
    end
  end
end
