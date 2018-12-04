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
  end
end