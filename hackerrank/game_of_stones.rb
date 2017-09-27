# https://www.hackerrank.com/challenges/game-of-stones-1
class GameOfStones
  def mainProcess()
    arr = []
    n = gets.chomp().to_i
    (1..n).each do
      arr << gets.chomp().to_i
    end
    arr&.each do |number|
      if (number%7) >= 2
        puts "First"
      else
        puts "Second"
      end
    end
  end
end

GameOfStones.new.mainProcess()