module ComputerActions
  def set_secret_word
    dictionary = File.readlines('10k_dictionary.txt', chomp: true)
    dictionary.filter {|word| (5..12).include?(word.length)}
              .sample
              .split('')
  end
end
