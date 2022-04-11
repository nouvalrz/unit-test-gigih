require 'net/http'

class Game
  def initialize(secret_word)
    @secret_word = secret_word
  end

  def match_word(guess_word)
    result = "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}"

    if guess_word.length != @secret_word.length
      'Not same length'
    elsif is_not_word?(guess_word)
      'Not a word'
    else
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

  private
  def is_not_word?(guess_word)
    uri = URI("https://api.dictionaryapi.dev/api/v2/entries/en/#{guess_word}")
    return true if Net::HTTP.get_response(uri).code == '404'
  end
end