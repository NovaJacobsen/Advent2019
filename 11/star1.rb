$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer11'
require 'paint_bot'

module Day11
  brain = Computer.new(*Input)
  bot = PaintBot.new(brain)

  bot.painted_tiles  # => 2064
end
