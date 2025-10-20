class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building,
                :phone_number, :user_id, :item_id, :token

  # バリデーション
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :token
    validates :user_id
    validates :item_id
  end

  # 保存処理（購入情報＋配送先情報）
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number,
      purchase_id: purchase.id
    )
  end
end
