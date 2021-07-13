FactoryBot.define do
  factory :article do |f|
    f.title { Faker::Name.title }
    f.body { Faker::Name.body }
    f.user_id { Faker::Number.number}
   
    
  end
end
