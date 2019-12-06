$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'amplifier'

module Day07
  describe Amplifier do
    it 'runs the program with phase as first input' do
      amplifier = Amplifier.new([2], program: [
        3,0,
        3,1,
        4,0,
        99
      ])
      expect(amplifier.amplify(1)).to eq 2
    end

    it 'runs the program with the signal as second input' do
      amplifier = Amplifier.new([2], program: [
        3,0,
        3,1,
        4,1,
        99
      ])
      expect(amplifier.amplify(1)).to eq 1
    end

    it 'solves the examples' do
      amplifier = Amplifier.new([4,3,2,1,0], program: [
        3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0
      ])
      expect(amplifier.amplify).to eq 43210
    end
  end
end
