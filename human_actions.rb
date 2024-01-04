require 'colorize'
require './game'

module HumanActions
  def guess_letter(secret_word, guess_word)
    print_ui
    print "Enter a letter: "
    letter = gets.chomp.downcase

    if correct_letter? letter
      secret_word.each_with_index do |char, i|
        guess_word[i] = letter if char == letter
      end
    elsif incorrect_letter? letter
      incorrect_letters[@try_count] = letter
    elsif letter == secret_word.join
      @guess_word = secret_word
    elsif letter == 'save'
      save_game
      return
    elsif letter == 'quit'
      return true
    else
      puts "You should enter 1 letter that you haven't already entered.".red
      guess_letter(secret_word, guess_word)
      return
    end
    @try_count += 1
    return false
  end

  def correct_letter?(letter)
    secret_word.include?(letter) && !guess_word.include?(letter)
  end

  def incorrect_letter?(letter)
    !secret_word.include?(letter) &&
    !incorrect_letters.include?(letter) &&
    letter =~ /^[a-z]$/
  end
end
