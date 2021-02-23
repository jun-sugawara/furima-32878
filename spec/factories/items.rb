FactoryBot.define do
  factory :item do
    association :user

    name        { 'いちご' }
    description { 'おいしいです' }
    category_id { '2' }
    state_id    { '2' }
    fee_id      { '2' }
    from_id     { '2' }
    day_id      { '2' }
    price       { '500' }
    user_id     { '' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/Railsimage.png'), filename: 'Railsimage.png')
    end
  end
end
