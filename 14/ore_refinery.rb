module Day14
  class OreRefinery
    attr_reader :ore_cost

    def initialize(convertions = [])
      @ore_cost = 0
      convertions.map do |raw| 
        reagents = raw.scan(/(\d+) (\w+)/).map { |x,y| [x.to_i, y.downcase] }
        result = reagents.pop
        define_generator(reagents, result)
      end
    end

    def define_generator(reagents, result)
      q, r = result
      instance_variable_set "@#{r}", 0
      self.class.send(:define_method, :"generate_#{r}") do |to_make|
        stock = instance_variable_get "@#{r}"
        n = reactions(stock, to_make, q)
        new_stock = n*q + stock - to_make
        instance_variable_set "@#{r}", new_stock

        return if n.zero?
        reagents.each do |qty, reagent|
          public_send :"generate_#{reagent}", n*qty
        end
      end
    end

    def generate_ore(qty)
      @ore_cost += qty
    end

    # How many times do we need to do a reaction to go from stock to new_stock
    def reactions(stock, new_stock, reaction_increment)
      return 0 if new_stock <= stock

      out, remainder = (new_stock - stock).divmod reaction_increment
      out += 1 unless remainder.zero?
      out
    end
  end

end
