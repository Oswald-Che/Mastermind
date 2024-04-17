require 'pry-byebug'
# class for board of the game mastermind
class Board
  attr_reader :colours, :key
  attr_writer :code

  def initialize
    @board = []
    # @code = 4.times.map { @colours.sample }
    @code = ['GREEN', 'BLUE', 'BROWN', 'BLUE']
    @key = []
  end

  def self.colours
    ['BLUE', 'YELLOW', 'GREEN', 'BROWN', 'RED', 'PURPLE']
  end

  def display(player)
    if player == 'human'
      @board.each_with_index do |item, i|
        next if item.all?(nil)

        puts "#{item} #{@key[i]}"
      end
    elsif player == 'computer'
      puts "#{@board.last} #{@key.last}"
    end
  end


  def input_guess(guesses)
    clue = generate_clue(guesses, @code)
    @board.push(guesses)
    @key.push(clue)
  end

  # generate key in response to player input
  def generate_clue(guesses, code, clue = [])
    count = Hash.new(0)
    guesses.each_with_index do |guess, i|
      next unless @code.include?(guess)

      count[guess] += 1 if guesses.count(guess) > code.count(guess)

      if count[guess] > code.count(guess)
        clue = special_push(guesses, code, clue, i)
        next
      end

      clue = push(guesses, code, clue, i)
    end
    clue
  end

  def special_push(guesses, code, clue, i)
    return clue unless guesses[i] == code[i]

    clue.delete_at(clue.index('WHITE') || clue.length)
    clue.push('BLACK')
    clue
  end

  def push(guesses, code, clue, i)
    guesses[i] == code[i] ? clue.push('BLACK') : clue.push('WHITE')
    clue
  end

  def win?
    @key.last.uniq == ['BLACK'] && @key.last.length == 4
  end

end