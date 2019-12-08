$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'computer07'

module Day07
  describe Computer do
    it('can add numbers with opcode 1') do
      computer = Computer.new(
        1,0,0,0,
        99
      )
      computer.run
      expect(computer.program).to eq [
        2,0,0,0,
        99
      ]
    end

    it('can multiply numbers with opcode 2') do
      computer = Computer.new(
        2,0,0,1,
        99
      )
      computer.run
      expect(computer.program).to eq [
        2,4,0,1,
        99
      ]
    end

    it('can read input with opcode 3') do
      computer = Computer.new(
        3,2,
        1,
        input: [99]
      )
      computer.run
      expect(computer.program).to eq [
        3,2,
        99
      ]
    end

    it('can write to output with opcode 4') do
      computer = Computer.new(
        4,3,
        99,
        85
      )
      computer.run
      expect(computer.output).to eq [85]
    end

    it 'can jump if true using opcode 5' do
      computer = Computer.new(
        1105, 1, 10, 99,
        84,85,86,87,88,89,
        4, 6,
        99
      ).run
      expect(computer.output).to eq [86]
      computer.reset.write(0, to: 1).run
      expect(computer.output).to be_empty
    end

    it 'can jump if false using opcode 6' do
      computer = Computer.new(
        1106, 1, 10, 99,
        84,85,86,87,88,89,
        4, 6,
        99
      ).run
      expect(computer.output).to be_empty
      computer.reset.write(0, to: 1).run
      expect(computer.output).to eq [86]
    end

    it 'can produce less than using opcode 7' do
      computer = Computer.new(
        1107, -2, 3, 0,
        99
      ).run
      expect(computer.program.first).to eq 1
      computer.reset.write(3, to: 1).run
      expect(computer.program.first).to eq 0
      computer.reset.write(5, to: 1).run
      expect(computer.program.first).to eq 0
    end

    it 'can produce less than using opcode 8' do
      computer = Computer.new(
        1108, -2, 3, 0,
        99
      ).run
      expect(computer.program.first).to eq 0
      computer.reset.write(3, to: 1).run
      expect(computer.program.first).to eq 1
      computer.reset.write(5, to: 1).run
      expect(computer.program.first).to eq 0
    end

    it 'can read in immediate mode' do
      computer = Computer.new(
        1102, 7, 17, 0,
        99
      )
      computer.run
      expect(computer.program).to eq [
        119, 7 ,17, 0,
        99
      ]
    end

    it('can overwrite future operations') do
      computer = Computer.new(
        1,0,0,4,
        99,3,3,0,
        99
      )
      computer.run
      expect(computer.program).to eq [
        16,0,0,4,
        2,3,3,0,
        99
      ]
    end

    it('can run multiple times') do
      computer = Computer.new(
        1,0,0,0,
        99
      )
      computer.run
      computer.reset
      computer.write(2, to: 2)
      computer.run
      expect(computer.program).to eq [
        3,0,2,0,
        99
      ]
    end

    it('raises an error if reaching an invalid opcode') do
      computer = Computer.new(91)
      expect {computer.run}.to raise_error RuntimeError
    end

    it 'can use another computer as input' do
      source = Computer.new(
        104, 5,
        104, 8,
        99
      )
      computer = Computer.new(
        3, 0,
        3, 1,
        2, 1, 0, 1,
        4, 1,
        99
      )
      computer.input = source
      expect(computer.run.output.first).to eq 40
    end

    it 'can buffer input with #<<' do
      source = Computer.new(
        104, 8,
        99
      )
      computer = Computer.new(
        3,0,
        3,1,
        4,1,
        4,0,
        99,
        input: source
      )
      computer.push 65
      expect(computer.run.output).to eq [8, 65]
    end
  end
end
