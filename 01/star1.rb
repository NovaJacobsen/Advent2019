$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'space_module'

@input.map {|mass| SpaceModule.new(mass).fuel_cost}.sum # => 3219099
