# class for board of the game mastermind
class Board

  def initialize
    @board = Array.new(20) { Array.new(4) }
    @code = ['BLUE', 'YELLOW', 'GREEN', 'BROWN', 'RED', 'PURPLE'].sample(4)
    @clue = []
  end
end