require_relative 'board.rb'
# for players to set the code and comuter guesses the code
class Computer
  attr_reader :set

  def initialize
    @board = Board.new
    @set = Board.colours.repeated_permutation(4).to_a
  end

  def set_code
    @board.code = input
  end

  def play
    10.times do |i|
      guess = i.zero? ? ['BLUE', 'BLUE', 'YELLOW', 'YELLOW'] : @set.sample
      @board.input_guess(guess)
      @board.display('computer')
      guess_code(guess, @board.key.last)
      break if @board.win?
    end
  end

  def guess_code(guess, clue)
    @set.select! do |code|
      temp_clue = @board.generate_clue(guess, code)
      clue.sort == temp_clue.sort
    end
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
    unless Board.colours.include?(guess)
      puts 'Error code colour not CORRECT, input proper colour'
      guess = generate_input
    end
    guess
  end

end