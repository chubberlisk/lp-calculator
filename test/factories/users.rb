FactoryBot.define do
  factory :user do
    email { "chandler@friends.com" }
    username { "chandler" }
    password { "password" }
    password_confirmation { "password" }
  end
end