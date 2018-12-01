FactoryBot.define do
  factory :admin_user do
    email { "joey@friends.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
