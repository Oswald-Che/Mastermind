require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'computer.rb'
class Game

  def initialize() end

  def start_game
    introduction
    player = choose_player
    play_game(player)
  end

  def play_game(player)
    if player == 1
      computer = Computer.new
      computer.set_code
      computer.play
    elsif player == 2
      Human.new.play
    end
  end

  def choose_player
    puts 'Do you want set code or guess the code'
    puts 'select 1 to set code and 2 to guess the code'
    gets.chomp.to_i
  end

  def introduction
    puts 'Welcome to Mastermind'
    puts "Availabe Colours are \n#{Board.colours}"
    puts 'Please select four colours to guess the secret code, you have 10 tries'
  end


end

game = Game.new
game.start_game