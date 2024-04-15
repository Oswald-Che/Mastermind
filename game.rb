require_relative 'board.rb'
class Game

  def initialize
    @board = Board.new
  end

  def input
    guesses = []
    4.times do
      guesses.push(generate_input)
    end
    guesses
  end

  def generate_input
    guess = gets.chomp.upcase
    unless @board.colours.include?(guess)
      puts 'Error guess colour not CORRECT, input proper colour'
      guess = generate_input
    end
    guess
  end
end