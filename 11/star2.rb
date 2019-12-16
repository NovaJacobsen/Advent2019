$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer11'
require 'paint_bot'

module Day11
  brain = Computer.new(*Input)
      bot = PaintBot.new(brain, initial: {{x: 0, y: 0} => 1})

  puts bot.render
  'LPZKLGHR'
end
# >>  #    ###  #### #  # #     ##  #  # ###
# >>  #    #  #    # # #  #    #  # #  # #  #
# >>  #    #  #   #  ##   #    #    #### #  #
# >>  #    ###   #   # #  #    # ## #  # ###
# >>  #    #    #    # #  #    #  # #  # # #
# >>  #### #    #### #  # ####  ### #  # #  #
