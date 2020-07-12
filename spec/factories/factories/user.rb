FactoryBot.define do
  factory :user do
    email { "test@test.te" }
    password { '12121212' }
    password_confirmation { '12121212' }
  end
end
