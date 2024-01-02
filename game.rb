require './computer_actions'
require './human_actions'

class Game
  include ComputerActions
  include HumanActions

  def play
    loop do
      guess_letter(secret_word, guess_word)
    end
  end

  private
  attr_reader :try_count, :secret_word, :guess_word
  attr_accessor :incorrect_letters

  def initialize
    @try_count = 0
    @secret_word = set_secret_word
    @guess_word = Array.new(secret_word.length)
    @incorrect_letters = []
  end
end