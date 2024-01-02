module ComputerActions
  def set_secret_word
    dictionary = File.readlines('google-10000-english-no-swears.txt', 
                                chomp: true)
    dictionary.filter {|word| word.length >= 5 && word.length <= 12}
              .sample
              .split('')
  end
end
