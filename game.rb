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
      print_instructions
      return if ask_new_or_continue_game
    end
    until guess_word == secret_word || try_left_count == 0
      return if guess_letter(secret_word, guess_word)
    end
    game_results
  end

  attr_accessor :loaded

  private
  attr_reader :secret_word, :guess_word
  attr_accessor :try_left_count, :incorrect_letters, :incorrect_words

  def initialize
    @try_left_count = 10
    @secret_word = set_secret_word
    @guess_word = Array.new(secret_word.length)
    @incorrect_letters = []
    @incorrect_words = []
    @loaded = false
  end

  def game_results
    if guess_word == secret_word
      puts "\nYou won. Congratulations!! (=^･･^)ﾉ".yellow
    else
      puts "\nYou lost. Good luck next time!".blue
      puts "The secret word was '#{secret_word.join}'"
    end
    print_ui
  end
end
