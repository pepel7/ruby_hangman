module Displayable
  def print_instructions
    puts <<-instructions
This is the game "Hangman". The computer sets a secret word,
and you guess it by entering 1 letter in 1 turn.
If you have already guessed what the word is, you can enter it in full.
Let's begin. Good luck to you!\n
    instructions
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
    # #{' ' unless try_count == 0} is for the space that appears when
    # tries_left falls below 10.
    puts <<-ui
┌───────────────────────────────────┐
│ #{"Type 'save' to save the game.".gray}     │
│ Tries left: #{tries_left}                    #{' ' unless try_count == 0}│
│ Incorrect letters: #{incorrect_letters.join}     #{' ' * nil_count}│
├───────────────────────────────────┤
│#{' ' * padding}      #{decorated_guess_word.join(' ')}      #{' ' * padding}│
└───────────────────────────────────┘
ui
  end
end
