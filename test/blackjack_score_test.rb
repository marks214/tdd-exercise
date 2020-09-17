require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert - the answer must be equal to 7
    expect(score).must_equal 7

  end

  it 'facecards have values calculated correctly' do

    hand = ['Jack', 3]
    score = blackjack_score(hand)
    expect(score).must_equal 13

    hand = ['Queen', 6]
    score = blackjack_score(hand)
    expect(score).must_equal 16

    hand = ['King', 7]
    score = blackjack_score(hand)
    expect(score).must_equal 17

    #test multiple face cards/duplicates:

    hand = ['King', 'King']
    score = blackjack_score(hand)
    expect(score).must_equal 20

  end

  it 'calculates aces as 11 where it does not go over 21' do

    # test for ace = 11 points
    hand = ['Ace', 3, 4]
    score = blackjack_score(hand)
    expect(score).must_equal 18

  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    hand = ['Ace', 5, 6]
    score = blackjack_score(hand)
    expect(score).must_equal 12

  end

  it 'returns 21 for two face cards and an Ace' do

    hand = ['King', 'Jack', 'Ace']
    score = blackjack_score(hand)
    expect(score).must_equal 21
  end

  it 'returns 21 for multiple ace cards with face and number cards' do
    hand = ['Ace', 'Ace', 'King', 9]
    score = blackjack_score(hand)
    expect(score).must_equal 21
  end


  it 'raises an ArgumentError for invalid cards' do

    hand = [4]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = [2, 3, 4, 5, 6, 7]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = ["go fish", 5, 8]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

  end

  it 'raises an ArgumentError for scores over 21' do

    hand = ["Jack", "King", 9]
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

    hand = ['Queen', 'King', 'Jack']
    expect {
      blackjack_score(hand)
    }.must_raise ArgumentError

  end
end
