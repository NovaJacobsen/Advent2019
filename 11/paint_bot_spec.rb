$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'rspec'
require 'computer11'
require 'paint_bot'

module Day11
  describe PaintBot do

    let :computer_mock do
      c = double
      allow(c).to receive :run
      allow(c).to receive :output=
      allow(c).to receive :input=
      c
    end

    it 'starts in 0,0 pointing up' do
      bot = PaintBot.new(computer_mock)
      expect(bot.facing).to eq PaintBot::Up
      expect([bot.x, bot.y]).to eq [0, 0]
    end

    it 'reads 0 when over a black tile' do
      bot = PaintBot.new(computer_mock)
      expect(bot.pop).to eq 0
    end

    it 'reads 1 when over a white tile' do
      bot = PaintBot.new(computer_mock)
      bot.paint 1
      expect(bot.pop).to eq 1
    end

    it 'turns and moves right when given a 1 command' do
      bot = PaintBot.new(computer_mock)
      bot.move(0)
      expect(bot.facing).to eq PaintBot::Left
      expect([bot.x, bot.y]).to eq [-1, 0]
      bot.move(0)
      expect(bot.facing).to eq PaintBot::Down
      expect([bot.x, bot.y]).to eq [-1, 1]
    end

    it 'turns and moves right when given a 1 command' do
      bot = PaintBot.new(computer_mock)
      bot.move(1)
      expect(bot.facing).to eq PaintBot::Right
      expect([bot.x, bot.y]).to eq [1, 0]
      bot.move(1)
      expect(bot.facing).to eq PaintBot::Down
      expect([bot.x, bot.y]).to eq [1, 1]
    end

    it 'knows how many tiles have been painted' do
      bot = PaintBot.new(computer_mock)
      bot.paint 0 #1
      bot.paint 1
      bot.move 1
      bot.paint 0 #2
      bot.move 0
      bot.paint 1 #3
      expect(bot.painted_tiles).to eq 3
    end

    it 'runs with its computer brain' do
      computer = Computer.new(
        3, 0, # read black
        104, 1, # paint 0,0 white
        104, 1, # go to 1,0
        3, 1, # read black
        104, 1, # paint 1,0 white
        104, 1, # go to 1,1
        3, 2, # read black
        104, 0, # paint 1,0 black
        104, 1, # go to 0,1
        3, 3, # read black
        104, 0, # paint 0,1 black
        104, 1, # go to 0,0
        3, 4, # read white
        104, 0, # paint 0,0 black
        104, 0, # go to -1,0
        99
      )
      bot = PaintBot.new(computer)
      expect(bot.facing).to eq PaintBot::Left
      expect([bot.x, bot.y]).to eq [-1,0]
      expect(bot.painted_tiles).to eq 4
      expect(computer.program.first(5)).to eq [0,0,0,0,1]
    end
  end
end
