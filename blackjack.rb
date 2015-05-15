#!/usr/bin/env ruby

require 'csv'
require_relative 'deck'
require_relative 'dealer'

class BlackJack < Deck
  attr_reader :deck, :dealer, :player, :players, :dealer_wins, :player_wins

  def initialize
    @dealer = Dealer.new
    @player = Player.new
    @deck = Deck.new
    @player_wins = 0
    @dealer_wins = 0
    # read_score
    @players = [@dealer, @player]
    @deck.shuffle_deck
  end

  def play
    intro
    play_again
    deal_hands
    menu
  end

  def hit_dealer
    @dealer.hand << @deck.draw until @dealer.hand_value >= 17
    dealer_lose if @dealer.bust
  end

  def deal_hands
    players.each do |player|
      player.hand << @deck.cards.shift until player.hand.count == 2
    end
    check_blackjack
  end

  def hit_player
    @player.hand << @deck.draw
    @player.hand_value
    if @player.bust
      player_lose
    elsif @player.hand.count >= 6
      player_over_5
    else
      menu
    end
  end

  private

    def play_again
      @dealer = Dealer.new
      @player = Player.new
      @deck = Deck.new
      @players = [@dealer, @player]
      @deck.shuffle_deck
    end

    def intro
      puts
      puts "*******************"
      puts "*****BlackJack*****"
      puts "*******************"
      puts "Play a game?  (y/n)"
      puts
      get_play
    end

    def get_play
      @play = gets.chomp.downcase
      intro unless ((@play == 'y') || (@play == 'n'))
      exit if @play == 'n'
    end

    def menu
      puts
      puts "*******************"
      puts "Your hand: #{@player.show_hand}"
      puts "Dealer top card: #{@dealer.first_card}"
      puts "*******************"
      puts "(H)it or (S)tay"
      puts "*******************"
      puts
      get_action
    end

    def get_action
      @action = gets.chomp.downcase
      if @action == 'h'
        hit_player
      elsif @action == 's'
        stay
      else
        menu
      end
    end

    def check_blackjack
      if @dealer.hand_value == 21
        player_lose
      elsif @player.hand_value == 21
        dealer_lose
      end
    end

    def stay
      hit_dealer
      compare_hands
    end

    def compare_hands
      if @player.hand_value > @dealer.hand_value
        dealer_lose
        play
      else
        player_lose
        play
      end
    end

    def player_lose
      @dealer_wins += 1
      puts score_line
      puts "***You have failed to achieve victory***"
      puts display_wins_count
      play
    end

    def dealer_lose
      @player_wins += 1
      puts score_line
      puts "***Winner Winner***"
      puts display_wins_count
      play
    end

    def player_over_5
      @player_wins += 1
      puts score_line
      puts "Victory! You have #{@player.hand.count} cards."
      puts display_wins_count
      play
    end

    def score_line
      # write_score
      "Player: #{@player.hand_value} - Dealer: #{@dealer.hand_value}"
    end

    def display_wins_count
      "Player: #{@player_wins} wins - Dealer: #{@dealer_wins} wins --- #{((@player_wins.to_f / (@player_wins + @dealer_wins)) * 100).to_i}%"
    end

    # def read_score
    #   CSV.foreach('./score.csv', headers: true) do |line|
    #     @dealer_wins = line.to_hash["Dealer"].to_i
    #     @player_wins = line.to_hash[" Player"].to_i
    #   end
    # end
    #
    # def write_score
    #   CSV.open('./score.csv', 'w') do |line|
    #     line.to_hash['Dealer'] = @dealer_wins
    #     line.to_hash[' Player'] = @player_wins
    #   end
    # end
    # 
    # def reset_score
    # end
end

if File.identical?("./blackjack.rb", $0)
  game = BlackJack.new
  game.play
end
