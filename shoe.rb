require_relative 'deck'

class Shoe < Deck
  def initialize
    @cards = []
    7.times { create_deck }
  end
end
