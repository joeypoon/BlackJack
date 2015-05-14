require './card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
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
