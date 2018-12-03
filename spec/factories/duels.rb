FactoryBot.define do
  factory :duel do
    status { 0 }
    starting_lp { 8000 }
    player_one_lp { nil }
    player_two_lp { nil }
    ended_at { nil }
    association :player_one, factory: :chandler, strategy: :build
    association :player_two, factory: :monica, strategy: :build

    trait :completed do
      ended_at { Time.now.advance(minutes: 30) }
      status { 1 }
    end

    factory :started_duel do
      status { 0 }
    end

    factory :completed_duel, aliases: [:p1_winner_duel], traits: [:completed] do
      player_one_lp { 8000 }
      player_two_lp { 0 }
      status { 1 }
    end

    factory :p2_winner_duel, traits: [:completed] do
      player_one_lp { 0 }
      player_two_lp { 8000 }
    end

    factory :cancelled_duel do
      status { 2 }
    end
  end
end
