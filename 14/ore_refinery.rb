module Day14
  class OreRefinery
    attr_reader :ore_cost

    def initialize(convertions = [])
      @ore_cost = 0
      @resources = {}
      convertions.map do |raw| 
        reagents = raw.scan(/(\d+) (\w+)/).map { |x,y| [x.to_i, y.downcase] }
        result = reagents.pop
        define_generator(reagents, result)
      end
    end

    def reset
      @ore_cost = 0
      @resources = {}
    end

    def stock(resource)
      @resources[resource] || 0
    end

    def set_stock(resource, to:)
      @resources[resource] = to
    end

    def define_generator(reagents, result)
      q, r = result
      self.class.send(:define_method, :"generate_#{r}") do |to_make|
        stock = stock("@#{r}")
        n = reactions(stock, to_make, q)
        new_stock = n*q + stock - to_make
        set_stock "@#{r}", to: new_stock

        return if n.zero?
        reagents.each do |qty, reagent|
          public_send :"generate_#{reagent}", n*qty
        end
      end
    end

    def generate_ore(qty)
      @ore_cost += qty
    end

    def cost_of_fuel(amt)
      generate_fuel(amt)
      @ore_cost
    ensure
      reset
    end

    def max_fuel(limit:)
      unsafe = 1
      while cost_of_fuel(unsafe) < limit
        unsafe *= 2
      end
      safe = unsafe / 2
      until safe + 1 == unsafe
        mid = safe + ((unsafe-safe)/2) # Difference is at least 2 so we always get closer
        if cost_of_fuel(mid) > limit
          unsafe = mid
        else
          safe = mid
        end
      end
      safe
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
