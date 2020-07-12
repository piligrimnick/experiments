FactoryBot.define do
  factory :post do
    title { 'post_title' }
    description { 'post description' }
    user
  end
end
