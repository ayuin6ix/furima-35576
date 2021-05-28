FactoryBot.define do
  factory :item do
    
      name                       {"ピアノ"}
      category_id                   {3}
      description                {"ああああああ"}
      price                      {500}
      status_id                     {3}
      prefecture_id                 {3}
      shipping_cost_id              {3}
      shipping_day_id               {3}
      
      association :user 
    
  end
end
