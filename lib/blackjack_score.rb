# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']


def blackjack_score(hand)
  count_hand(hand)
  validate_cards_in_hand(hand)

  score = calculate_points(hand)

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
  points = 0
  hand.each do |card_value|
    if card_value == 'King' || card_value == 'Queen' || card_value == 'Jack'
      points += 10
    end
  end

  return points

end

def calculate_numerical_card_score(hand)
  points = 0

  hand.each do |card_value|
    points += card_value if card_value.class == Integer
  end

  return points

end

def calculate_points(hand)
  points = calculate_face_card_score(hand) + calculate_numerical_card_score(hand)

  hand.each do |card|
    ace_value = 0
    if (card == 'Ace') && (points <= 10)
      ace_value = 11
    elsif (card == 'Ace') && (points > 10)
      ace_value = 1
    end
    points += ace_value
  end

  return points

end

