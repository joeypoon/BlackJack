require '~/dropbox/workspace/iron_yard/week-2-lab/card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    create_deck
  end

  def shuffle_deck
    @cards.shuffle!
  end

  def draw
    @cards.shift
  end

  private

    def create_deck
      suits = %w(Spade Heart Club Diamond)
      cards = %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King)
      suits.each do |suit|
        cards.each do |card|
          @cards << Card.new("#{card}", "#{suit}")
        end
      end
    end
end
