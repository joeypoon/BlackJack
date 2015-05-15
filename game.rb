#!/usr/bin/env ruby

require './blackjack'

if File.identical?("./game.rb", $0)
  game = BlackJack.new
  game.play
end
