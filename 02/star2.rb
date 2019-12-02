$LOAD_PATH.unshift(File.expand_path("..", __FILE__))

require 'input'
require 'computer'

computer = Computer.new(*@input)

# This is a bit of a mess... We run until we find a program that works
# we most likely could create a new Computer every time but I chose to
# save some object allocation. Dont think its significant
# If you do file IO every time that might be slow though?

result = catch(:result) do
  100.times do |noun|
    100.times do |verb|
      begin
        computer.write(noun, to: 1)
        computer.write(verb, to: 2)
        output = computer.final_state
        throw(
          :result,
          (100*noun) + verb
        ) if output.first == 19690720
      rescue RuntimeError
        next
      end
    end
  end
end

result  # => 6577
