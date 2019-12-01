$LOAD_PATH.unshift(File.expand_path("..", __FILE__))
require 'input'
require 'space_module'

@input.map {|mass| SpaceModule.new(mass).fuel_total}.sum # => 4825810
