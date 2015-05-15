class Player
  attr_accessor :hand
  attr_reader :bust

  def initialize
    @hand = []
    @bust = false
  end

  def show_hand
    @hand.map { |card| card.to_s }
  end

  def hand_value
    total = @hand.map { |card| card.value }.reduce(:+)
    if total.nil?
      0
    elsif total > 21
      @bust = true
      total
    else
      total
    end
  end
end
