FactoryBot.define do
  factory :duel do
    starting_lp { 8000 }
    player_one_lp { nil }
    player_two_lp { nil }
    created_at { Time.now }
    updated_at { Time.now }
    ended_at { nil }
    association :player_one, factory: :user_one, strategy: :build
    association :player_two, factory: :user_two, strategy: :build

    trait :completed do
      ended_at { Time.now.advance(minutes: 30) }
      status { 1 }
    end

    factory :started_duel do
      status { 0 }
    end

    factory :completed_duel, aliases: [:p1_winner_duel, :thirty_mins_duel], traits: [:completed] do
      player_one_lp { 8000 }
      player_two_lp { 0 }
      status { 1 }
    end

    factory :fifteen_mins_duel, traits: [:completed] do
      ended_at { Time.now.advance(minutes: 15) }
    end

    factory :sixty_mins_duel, traits: [:completed] do
      ended_at { Time.now.advance(minutes: 60) }
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
