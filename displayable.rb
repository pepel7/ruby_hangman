module Displayable
  def print_instructions
    puts "This is the game 'Hangman'. The computer sets a secret word,"
    puts "and you guess it by entering 1 letter in 1 turn."
    puts "If you have already guessed what the word is, you can enter it in full."
    puts "Let's begin. Good luck to you!\n"
  end

  def print_ui
    decorated_guess_word = guess_word.map do |char|
      char = char.nil? ? '_' : char
    end
    try_left_count_display = try_left_count == 1 ? try_left_count.to_s.red : try_left_count

    letters_padding = 10 - incorrect_letters.length
    word_padding = 12 - secret_word.length + 5
    # #{' ' unless try_left_count == 0} is for the space that appears when
    # tries_left falls below 10.
    puts <<-ui
┌───────────────────────────────────┐
│ #{"Type 'save' to save the game.".gray}     │
│ Tries left: #{try_left_count_display} #{' ' * 18} #{' ' unless try_left_count == 10}│
│ Incorrect letters: #{incorrect_letters.join}     #{' ' * letters_padding}│
├───────────────────────────────────┤
│#{' ' * word_padding} #{decorated_guess_word.join(' ')} #{' ' * word_padding}│
└───────────────────────────────────┘
ui
  end
end
