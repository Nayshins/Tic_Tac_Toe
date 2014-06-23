FactoryGirl.define do
  factory :board do
    grid []
    trait :empty do
      grid [' '] * 9
    end

    trait :horizontal_win do
      grid ['X','X','X',' ',' ',' ',' ',' ',' ']
    end

    trait :vertical_win do
      grid ['X',' ',' ','X',' ',' ','X',' ',' ']
    end

    trait :diagonal_win do
      grid ['X',' ',' ',' ','X',' ',' ',' ','X']
    end

    trait :draw do
      grid ['X','O','X','O','X','O','O','X','O']
    end
  end
end