module Day11
  class PaintBot
    attr_reader :x, :y, :facing
    def initialize(computer)
      @x, @y = 0, 0
      @painting = {}
      @facing = Up

      computer.output = self
      computer.input = self
      @movement_data = computer
      computer.run
    end

    def pop
      @painting[{x: x, y: y}] || 0
    end

    def push(val)
      if @color
        paint @color
        @color = nil
        move val
      else
        @color = val
      end
    end

    def painted_tiles
      @painting.keys.size
    end

    def move(val)
      case val
      when 0
        @facing = facing.left
      when 1
        @facing = facing.right
      else
        raise "invalid command: #{val}"
      end
      @x += @facing.x
      @y += @facing.y
    end

    def paint(val)
      @painting[{x: x, y: y}] = val
    end

    Facing = Struct.new(:x, :y, :left, :right)
    Up = Facing.new(0, -1, nil, nil)
    Down = Facing.new(0, 1, nil, nil)
    Left = Facing.new(-1, 0, nil, nil)
    Right = Facing.new(1, 0, nil, nil)
    Up.right = Right
    Up.left = Left
    Down.right = Left
    Down.left = Right
    Right.right = Down
    Right.left = Up
    Left.right = Up
    Left.left = Down
  end
end
