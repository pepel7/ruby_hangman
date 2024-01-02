require './computer_actions'
require './human_actions'

class Game
  include ComputerActions
  include HumanActions

  def play
    until guess_word == secret_word || try_count == 10
      guess_letter(secret_word, guess_word)
    end
    game_results
  end

  private
  attr_reader :secret_word, :guess_word
  attr_accessor :try_count, :incorrect_letters

  def initialize
    @try_count = 0
    @secret_word = set_secret_word
    @guess_word = Array.new(secret_word.length)
    @incorrect_letters = Array.new(10)
  end

  def print_ui
    decorated_guess_word = guess_word.map do |char|
      if char.nil?
        char = '_'
      else
        char
      end
    end
    tries_left = 10 - try_count
    # these are for padding
    nil_count = incorrect_letters.count(nil)
    padding = 12 - secret_word.length
    puts <<-ui
┌───────────────────────────────────┐
│ Tries left: #{tries_left}                    #{' ' unless try_count == 0}│
│ Incorrect letters: #{incorrect_letters.join}     #{' ' * nil_count}│
├───────────────────────────────────┤
│#{' ' * padding}      #{decorated_guess_word.join(' ')}      #{' ' * padding}│
└───────────────────────────────────┘
ui
  end

  def game_results
    if guess_word == secret_word
      puts 'You won. Congratulations!! (=^･･^)ﾉ'.yellow
    else
      puts "You lost. Good luck next time!"
    end
  end
end
