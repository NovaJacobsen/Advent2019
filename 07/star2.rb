$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'amplifier'

module Day07
  best_setting = [5,6,7,8,9].permutation.max_by do |setting|
    Amplifier.new(setting).amplify
  end

  best_setting  # => [5, 9, 6, 8, 7]
  Amplifier.new(best_setting).amplify  # => 3321777
end
