FactoryBot.define do
  factory :item_buy do
    postal_code   { '123-4567' }
    from_id       { 2 }
    municipality  { '相模原市' }
    house_number  { '大山1-1-1' }
    building_name { 'tower'}
    tell          { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
