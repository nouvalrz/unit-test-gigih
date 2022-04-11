require 'game'

describe 'Game' do
  describe '#match_word' do
    it 'should handle all incorrect letters well' do
      game = Game.new('DRINK')
      guess_word = 'HELLO'

      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}")
    end

    it 'should handle a wrongly positioned letter well' do
      game = Game.new('DRINK')
      guess_word = 'CLEAN'

      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E8}")
    end

    it 'should handle a correctly positioned letter well' do
      game = Game.new('DRINK')
      guess_word = 'ALIVE'
    
      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E9}\u{1F7E6}\u{1F7E6}")
    end

    it 'should receive actual word' do
      game = Game.new('DRINK')
      guess_word = 'ABCDE'
    
      result = game.match_word(guess_word)

      expect(result).to eq("Not a word")
    end
  end
end