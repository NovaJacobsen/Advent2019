module Day07
  class Computer

    attr_accessor :program, :input, :output

    def initialize(*program, input: [])
      @original_program = program
      @original_input = input
      reset
    end

    def run
      catch :complete do
        loop do
          step
        end
      end
      self
    end

    def pop
      while output.empty?
        step
      end
      output.pop
    end

    def push(input)
      @buffered_input.push input
    end

    def queue(input)
      @buffered_input.unshift input
    end

    def step
      o = nil
      case opcode
      when 99
        throw :complete
      when 1
        inst_size = 4
        o = operand(1)+operand(2)
      when 2
        inst_size = 4
        o = operand(1)*operand(2)
      when 3
        inst_size = 2
        if @buffered_input.empty?
          o = @input.pop
        else
          o = @buffered_input.pop
        end
      when 4
        inst_size = 2
        @output.push operand(1)
      when 5
        operand(1) # => 1
        operand(2)  # => 10
        inst_size = 3
        unless operand(1) == 0
          return @pc = operand(2)
        end
      when 6
        inst_size = 3
        return @pc = operand(2) if operand(1) == 0
      when 7
        inst_size = 4
        o = 0
        o = 1 if operand(1) < operand(2)
      when 8
        inst_size = 4
        o = 0
        o = 1 if operand(1) == operand(2)
      else
        raise "invalid opcode: #{opcode.inspect}"
      end
      write(o, to: @program[@pc+(inst_size - 1)]) if o
      @pc += inst_size
    end

    def opcode
      read(@pc) % 100
    end

    def mode(offset)
      (read(@pc) / 10) / 10**offset % 10
    end

    def operand(offset)
      case mode(offset)
      when 0
        return read read(@pc+offset)
      when 1
        return read(@pc+offset)
      else
        raise "Invalid read mode #{mode(offset.inspect)}"
      end
    end

    def read(index)
      @program[index]
    end

    def write(value, to:)
      @program[to] = value
      self
    end

    def reset
      @program = @original_program.dup
      @input = @original_input.dup
      @output = []
      @buffered_input = []
      @pc = 0
      self
    end

  end

end
