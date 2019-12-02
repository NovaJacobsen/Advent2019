$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'computer'

describe Computer do
  it('can add numbers with opcode 1') do
    computer = Computer.new(
      1,0,0,0,
      99
    )
    expect(computer.final_state).to eq [
      2,0,0,0,
      99
    ]
  end

  it('can multiply numbers with opcode 2') do
    computer = Computer.new(
      2,0,0,1,
      99
    )
    expect(computer.final_state).to eq [
      2,4,0,1,
      99
    ]
  end

  it('can overwrite future operations') do
    computer = Computer.new(
      1,0,0,4,
      99,3,3,0,
      99
    )
    expect(computer.final_state).to eq [
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
    computer.final_state
    computer.write(2, to: 2)
    expect(computer.final_state).to eq [
      3,0,2,0,
      99
    ]
  end

  it('raises an error if reaching an invalid opcode') do
    computer = Computer.new(4,4,4,4)
    expect {computer.final_state}.to raise_error StandardError
  end

end
