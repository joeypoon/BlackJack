require_relative 'player'

class Dealer < Player

  def first_card
    @hand.first
  end
end
