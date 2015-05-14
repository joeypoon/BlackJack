class Card
  attr_reader :value, :suit, :card

  def initialize card, suit
    @value = value_tree[card.capitalize.to_sym]
    set_suit(suit.capitalize)
    set_card(card.capitalize)
  end

  def show_card
    "#{@card} of #{@suit}s"
  end

  def soft_ace
    @value = 1
  end

  def hard_ace
    @value = 11
  end

  private

    def value_tree
      {
        Ace: 11,
        Two: 2,
        Three: 3,
        Four: 4,
        Five: 5,
        Six: 6,
        Seven: 7,
        Eight: 8,
        Nine: 9,
        Ten: 10,
        Jack: 10,
        Queen: 10,
        King: 10
      }
    end

    def set_card card
      @card = card if %w(Ace Two Three Four Five Six Seven Eight Nine Ten Jack Queen King).include?(card)
    end

    def set_suit suit
      @suit = suit.capitalize.to_sym if %w(Spade Heart Club Diamond).include?(suit)
    end
end