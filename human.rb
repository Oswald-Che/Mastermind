
class Human

  def initialize
    @board = Board.new
  end 

  def play
    10.times do |i|
      puts "please input code\n"
      player_input = input
      @board.input_guess(player_input)
      @board.display
      break if game_end(i)
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
    unless @board.colours.include?(guess)
      puts 'Error guess colour not CORRECT, input proper colour'
      guess = generate_input
    end
    guess
  end

  def game_end(num)
    if @board.win?
      puts 'Congratulations you guessed the secret code'
      puts 'Game Over!!!'
      true
    elsif num == 9
      puts 'You Were not able to guess the secret code'
      puts 'Game Over'
      true
    end
  end

end