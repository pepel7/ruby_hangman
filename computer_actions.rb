module ComputerActions
  def set_secret_word
    dictionary = File.readlines('google-10000-english-no-swears.txt', 
                                chomp: true)
    dictionary.filter {|word| (5..12).include?(word.length)}
              .sample
              .split('')
  end
end
