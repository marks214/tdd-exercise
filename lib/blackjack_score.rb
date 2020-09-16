# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']


def blackjack_score(hand)
  count_hand(hand)
  validate_cards_in_hand(hand)
  score = 0
  score += calculate_face_card_score(hand)
  score += calculate_numerical_card_score(hand)
  score += determine_ace_card_value(hand)

  if score > 21
    raise ArgumentError, 'score exceeds 21, your hand is a bust!'
  else
    return score
  end

end

def count_hand(hand)
  number_of_cards = hand.length
  if number_of_cards < 2
    raise ArgumentError, 'not enough cards, need at least two'
  elsif number_of_cards > 5
    raise ArgumentError, 'number of cards cannot exceed 5'
  end
end

def validate_cards_in_hand(hand)
  hand.each do |card|
    unless VALID_CARDS.include?(card)
      raise ArgumentError, 'you have one or more invalid cards'
    end
  end
end

def calculate_face_card_score(hand)

  k = 0
  q = 0
  j = 0

  k = 10 if hand.include?('King')
  q = 10 if hand.include?('Queen')
  j = 10 if hand.include?('Jack')

  points = k + q + j

  return points

end

def calculate_numerical_card_score(hand)
  points = 0

  hand.each do |card_value|
    points += card_value if card_value.class == Integer
  end

  return points

end

def determine_ace_card_value(hand)
  points = calculate_face_card_score(hand) + calculate_numerical_card_score(hand)
  ace_value = 0

  hand.each do |card|
    if (card == 'Ace') && (points <= 10)
      ace_value = 11
    elsif (card == 'Ace') && (points > 10)
      ace_value = 1
    end
    points += ace_value
  end

  return ace_value

end

