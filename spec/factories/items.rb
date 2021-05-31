FactoryBot.define do
  factory :item do
    name { 'ピアノ' }
    category_id { 3 }
    description                { 'ああああああ' }
    price                      { 500 }
    status_id                     { 3 }
    prefecture_id                 { 3 }
    shipping_cost_id              { 3 }
    shipping_day_id               { 3 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end

    association :user
  end
end
