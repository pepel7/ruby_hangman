require './computer_actions'
require './human_actions'

class Game
  include ComputerActions
  include HumanActions

  def play

  end

  private
  attr_reader :try_count, :secret_word, :guess_word, :incorrect_letters

  def initialize
    try_count = 0
    secret_word = set_secret_word
    p secret_word
  end
end