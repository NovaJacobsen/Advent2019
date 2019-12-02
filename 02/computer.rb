class Computer

  attr_accessor :program

  def initialize(*program)
    @original_program = program
    reset
  end

  def final_state
    until opcode == 99 do
      case opcode
      when 1
        a = read operand(1)
        b = read operand(2)
        write(a+b, to: operand(3))
        @pc += 4
      when 2
        a = read operand(1)
        b = read operand(2)
        write(a*b, to: operand(3))
        @pc += 4
      else
        raise "invalid opcode: #{opcode}"
      end
    end
    program
  ensure
    reset
  end

  def opcode
    operand 0
  end

  def operand(number)
    read(@pc+number)
  end

  def read(index)
    @program[index]
  end

  def write(value, to:)
    @program[to] = value
  end

  def reset
    @program = @original_program.dup
    @pc = 0
  end

end
