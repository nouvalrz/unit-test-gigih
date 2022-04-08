require 'httparty'
require 'json'

class Game
  def initialize(secret_word)
    @secret_word = secret_word
  end

  def match_word(guess_word)
    result = "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}"

    response = HTTParty.get("https://api.dictionaryapi.dev/api/v2/entries/en/#{guess_word}")
    response = JSON.parse(response.to_s)
    
    if response.is_a? Hash
      return 'Not a word'
    end

    guess_word.split('').each_with_index do |letter, index|
      if @secret_word[index] == letter
        result[index] = "\u{1F7E9}"
      elsif @secret_word.include?(letter)
        result[index] = "\u{1F7E8}"
      end 
    end
    result
  end

end