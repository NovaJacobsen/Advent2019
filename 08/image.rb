module Day08
  class Image
    attr_accessor :width, :height, :layer_size
    def initialize(data, h: ,w:)
      @width = w
      @height = h
      @layer_size = width*height
      @layers = data.each_slice(layer_size).to_a
    end


    def color(index, depth = 0)
      val = @layers[depth][index]
      return '#' if val == 1
      return ' ' if val == 0
      color(index, depth + 1)
    end

    def render
      layer_size
      layer_size
        .times
        .map { |i| color(i) }
        .each_slice(width)
        .map { |line| line.join }
    end

  end
end
