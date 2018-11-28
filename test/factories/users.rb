FactoryBot.define do
  factory :user, aliases: [:chandler] do
    email { "chandler@friends.com" }
    username { "chandler" }
    password { "password" }
    password_confirmation { "password" }

    factory :monica do
      email { "monica@friends.com" }
      username { "monica" }
    end
  end
end