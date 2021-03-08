FactoryBot.define do
  factory :item_buy do
    user_id      { 1 }
    item_id      { 1 }
    postal_code  { '123-4567' }
    from_id      { 2 }
    municipality { '相模原市' }
    house_number { '大山1-1-1' }
    tell         { '09012345678' }
    token        { 'tok_abcdefghijk00000000000000000' }
  end
end
