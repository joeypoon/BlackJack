class Player
  attr_accessor :hand
  attr_reader :bust, :name

  def initialize
    @hand = []
    @bust = false
    @name = "Player"
  end

  def display_hand
    "#{@name} hand: #{show_hand}"
  end

  def hand_value
    if calculate_hand_value > 21
      if soft_hand
        calculate_hand_value
      else
        @bust = true
        calculate_hand_value
      end
    else
      calculate_hand_value
    end
  end

  def calculate_hand_value
    if @hand.empty?
      0
    else
      @hand.map { |card| card.value }.reduce(:+)
    end
  end

  private

    def show_hand
      @hand.map { |card| card.to_s }.join(', ') + " Total: #{hand_value}"
    end

    def soft_hand
      ace = false
      @hand.each do |card|
        if card.value == 11
          card.soft_ace
          return true
        end
      end
      ace
    end
end
