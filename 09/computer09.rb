module Day09
  class Computer

    attr_accessor :program, :input, :output, :relative

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
        operand(1)
        operand(2)
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
      when 9
        inst_size = 2
        @relative += operand(1)
      else
        raise "invalid opcode: #{opcode.inspect}"
      end
      destination(o, inst_size-1)
      @pc += inst_size
    end

    def opcode
      read(@pc) % 100
    end

    def mode(offset)
      (read(@pc) / 10) / 10**offset % 10
    end

    def destination(val, offset)
      return unless val
      case mode(offset)
      when 0
        write(val, to: read(@pc + offset))
      when 1
        raise 'Immediate mode not valid for write'
      when 2
        write(val, to: relative + read(@pc + offset))
      end
    end

    def operand(offset)
      case mode(offset)
      when 0
        return read read(@pc+offset)
      when 1
        return read(@pc+offset)
      when 2
        return read(relative + read(@pc + offset))
      else
        raise "Invalid read mode #{mode(offset.inspect)}"
      end
    end

    def read(index)
      @program[index] || 0
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
      @relative = 0
      self
    end

  end

end
