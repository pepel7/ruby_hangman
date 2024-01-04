require 'colorize'
require './game'

module HumanActions
  def guess_letter(secret_word, guess_word)
    print_ui
    print "Enter a letter: "
    input = gets.chomp.downcase

    if correct_letter?(input)
      secret_word.each_with_index do |char, i|
        guess_word[i] = input if char == input
      end
    elsif incorrect_letter?(input)
      incorrect_letters << input
      @try_left_count -= 1
    elsif correct_word?(input)
      @guess_word = secret_word
    elsif incorrect_word?(input)
      incorrect_words << input
      @try_left_count -= 1
    elsif input == 'save'
      save_game
    elsif input == 'quit'
      return true
    else
      puts "You should enter 1 letter that you haven't already entered, or".red
      puts "a word with the exact number of letters as in the secret word.".red
      guess_letter(secret_word, guess_word)
    end

    return false
  end

  def correct_letter?(input)
    secret_word.include?(input) && !guess_word.include?(input)
  end

  def incorrect_letter?(input)
    !secret_word.include?(input) &&
    !incorrect_letters.include?(input) &&
    input =~ /^[a-z]$/
  end

  def correct_word?(input)
    input == secret_word.join
  end

  def incorrect_word?(input)
    input =~ /^[a-z]{#{secret_word.length}}$/ &&
    input != secret_word.join &&
    !incorrect_words.include?(input)
  end
end
