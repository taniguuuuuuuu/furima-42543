FactoryBot.define do
  factory :user do
    nickname              { 'テスト太郎' }
    email                 { Faker::Internet.email }
    password              { 'abc123' }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birthday              { '1990-01-01' }
  end
end
