require_relative 'board.rb'
require_relative 'human.rb'
class Game

  def initialize
    @board = Board.new
  end

  def choose_player
    puts 'Do you want set code or guess the code'
    puts 'select 1 to set code and 2 to guess the code'
    answer = gets.chomp.to_i
    if answer == 2
      Human.new.play
    end
  end

  def introduction
    puts 'Welcome to Mastermind'
    puts "Availabe Colours are \n #{@board.colours}"
    puts 'Please select four colours to guess the secret code, you have 10 tries'
  end


end

game = Game.new
game.introduction
game.choose_player