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

  it 'has a fuel total, which includes fuel for the fuel' do
    expect(SpaceModule.new(14).fuel_total).to eq 2
    expect(SpaceModule.new(1969).fuel_total).to eq 966
    expect(SpaceModule.new(100756).fuel_total).to eq 50346
  end
end
