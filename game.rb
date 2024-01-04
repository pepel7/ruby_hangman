require './computer_actions'
require './human_actions'
require './displayable'
require './savable'

class Game
  include ComputerActions
  include HumanActions
  include Displayable
  include Savable

  def play
    if !loaded
      return if ask_new_or_continue_game
    end
    until guess_word == secret_word || try_count == 10
      return if guess_letter(secret_word, guess_word)
    end
    game_results
  end

  attr_accessor :loaded

  private
  attr_reader :secret_word, :guess_word
  attr_accessor :try_count, :incorrect_letters

  def initialize
    @try_count = 0
    @secret_word = set_secret_word
    @guess_word = Array.new(secret_word.length)
    @incorrect_letters = Array.new(10)
    @loaded = false
  end

  def game_results
    if guess_word == secret_word
      puts "\nYou won. Congratulations!! (=^･･^)ﾉ".yellow
    else
      puts "\nYou lost. Good luck next time!"
    end
    puts "The secret word was '#{secret_word.join}'"
    print_ui
  end
end
