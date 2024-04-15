require 'pry-byebug'
# class for board of the game mastermind
class Board

  def initialize
    @board = Array.new(10) { Array.new(4) }
    @colours = ['BLUE', 'YELLOW', 'GREEN', 'BROWN', 'RED', 'PURPLE']
    @code = 4.times.map { @colours.sample }
    # @code = ['GREEN', 'BLUE', 'BROWN', 'BLUE']
    @clue = []
  end

  def display
    @board.each.with_index do |item, i|
      next if item.all?(nil)

      puts "#{item} #{clue[i]}"
    end
  end

  # generate key in response to player input
  def generate_clue(guesses)
    count = Hash.new(0)
    guesses.each_with_index do |guess, i|
      next unless @code.include?(guess)

      count[guess] += 1 if guesses.count(guess) > @code.count(guess)

      if count[guess] > @code.count(guess)
        special_push(guesses, i)
        next
      end

      push(guesses, i)
    end
  end

  def special_push(guesses, i)
    return unless guesses[i] == @code[i]

    @clue.delete_at(@clue.index('WHITE') || @clue.length)
    @clue.push('BLACK')
  end

  def push(guesses, i)
    guesses[i] == @code[i] ? @clue.push('BLACK') : @clue.push('WHITE')
  end

end