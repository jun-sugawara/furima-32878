FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'a00000' }
    password_confirmation { password }
    first_name            { '太郎' }
    last_name             { '田中' }
    first_name_kana       { 'タロウ' }
    last_name_kana        { 'タナカ' }
    birthday              { '1959-01-01' }
  end
end
