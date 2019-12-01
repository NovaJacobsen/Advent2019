$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'rspec'
require 'space_module'

describe SpaceModule do
  it 'has a fuel cost based on its mass' do
    expect(SpaceModule.new(12).fuel_cost).to eq 2
    expect(SpaceModule.new(14).fuel_cost).to eq 2
    expect(SpaceModule.new(1969).fuel_cost).to eq 654
    expect(SpaceModule.new(100756).fuel_cost).to eq 33583
  end
end
