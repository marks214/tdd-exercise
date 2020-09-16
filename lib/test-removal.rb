array = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

hand = ['Jack', 'Queen', 2, 4, 3, nil]


=begin
number_cards_in_hand = hand.reject do |item|
  item == 'Jack' || item == 'Queen' || item == 'King'
end

puts number_cards_in_hand
points = 0
number_cards_in_hand.map { |card_value| points += card_value }

puts "points: #{points}"
=end
points = 0
hand.each do |card_value|
  points += card_value if card_value.class == Integer
end

puts points

def length(hand)
  index = 0
  until hand[index].nil?
    index += 1
  end
  return index
end

puts length(hand)
