FactoryBot.define do
  factory :duel do
    status { 0 }
    starting_lp { 8000 }
    player_one_lp { nil }
    player_two_lp { nil }
    ended_at { nil }
    association :player_one, factory: :chandler, strategy: :build
    association :player_two, factory: :monica, strategy: :build

    trait :started do
      status { 0 }
    end

    trait :completed do
      player_one_lp { 8000 }
      player_two_lp { 0 }
      status { 1 }
    end

    trait :cancelled do
      status { 2 }
    end

    factory :started_duel, traits: [:started]
    factory :completed_duel, traits: [:completed]
    factory :cancelled_duel, traits: [:cancelled]
  end
end
