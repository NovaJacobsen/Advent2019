$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'rspec'
require 'wire'

describe Pos do

  it 'knows its distance from the center' do
    pos = Pos.new(-4,9)
    expect(pos.distance).to eq 13
  end

end

describe Wire do

  it 'treats right as positive X' do
    right_wire = Wire.new('R1')
    left_wire = Wire.new('L1')
    expect(right_wire).to be_over(Pos.new(1,0))
    expect(right_wire).not_to be_over(Pos.new(-1,0))
    expect(left_wire).not_to be_over(Pos.new(1,0))
    expect(left_wire).to be_over(Pos.new(-1,0))
  end

  it 'treats down as positive Y' do
    down_wire = Wire.new('D1')
    up_wire = Wire.new('U1')
    expect(down_wire).to be_over(Pos.new(0,1))
    expect(down_wire).not_to be_over(Pos.new(0,-1))
    expect(up_wire).not_to be_over(Pos.new(0,1))
    expect(up_wire).to be_over(Pos.new(0,-1))
  end

  it 'runs instructions left to right' do
    wire = Wire.new('R2,D3')
    expect(wire).to be_over(Pos.new(2,3))
    expect(wire).not_to be_over(Pos.new(3,2))
  end

  it 'can return all positions of overlap' do
    a = Wire.new('R2,D3')
    b = Wire.new('D2,R3')

    expect(a.intersections(b)).to match_array [Pos.new(2,2)]
  end

end
