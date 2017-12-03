class Strategy
  def sell_things(stalls)
    # stalls&.each do |stall|
    #   stall.sell
    # end
    stalls&.each do |stall|
      case stall
        when BookStall
          stall.sell
        when DrinkStall
          stall.sell
        when FoodStall
          stall.sell
      end
    end
  end
end

class BookStall
  def sell
    p "I sell Books"
  end
end

class DrinkStall
  def sell
    p "I sell Coffee"
  end
end

class FoodStall
  def sell
    p "I sell Food"
  end
end

Strategy.new.sell_things [BookStall.new, DrinkStall.new, FoodStall.new]