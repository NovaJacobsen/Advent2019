$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'image'

module Day08
  image = Image.new(Input, w: 25, h: 6)

  puts image.render
end
# >> #  # #### #   # ##  #  #
# >> #  # #    #   ##  # # #
# >> #### ###   # # #  # ##
# >> #  # #      #  #### # #
# >> #  # #      #  #  # # #
# >> #  # #      #  #  # #  #
