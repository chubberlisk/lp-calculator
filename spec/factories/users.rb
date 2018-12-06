FactoryBot.define do
  factory :user, aliases: [:user_one] do
    email { "chandler@friends.com" }
    username { "chandler" }
    password { "password" }
    password_confirmation { "password" }

    factory :user_two do
      email { "monica@friends.com" }
      username { "monica" }
    end

    factory :user_three do
      email { "joey@friends.com" }
      username { "joey" }
    end
  end
end