require 'deck'

class BlackJack < Deck
  attr_accessor :deck, :dealer_hand, :player_hand

  def play
    deck = Deck.new
  end

  def check_total
  end

  def hit
  end

  def stay
  end
end

game = BlackJack.new
game.play
