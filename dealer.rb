require_relative 'player'

class Dealer < Player

  def initialize
    super
    @name = "Dealer"
  end

  def display_first_card
    "#{@name} top card: #{first_card}"
  end

  def first_card
    @hand.first
  end
end
