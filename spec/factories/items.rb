FactoryBot.define do
  factory :item do
    name              { 'テスト商品' }
    description       { 'これはテスト用の商品説明です。' }
    detail_id         { 2 }
    status_id         { 2 }
    delivery_fee_id   { 2 }
    prefecture_id     { 2 }
    shipping_days_id  { 2 }
    price             { 1000 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/2025-09-29 16.03.02.png')),
        filename: 'spec/factories/items.rb',
        content_type: 'image/png'
      )
    end
  end
end
