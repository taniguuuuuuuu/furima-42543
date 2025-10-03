class AddNotNullConstraintsToItems < ActiveRecord::Migration[7.1]
  def change

    Item.where(name: nil).update_all(name: "")
    Item.where(description: nil).update_all(description: "")
    Item.where(status_id: nil).update_all(status_id: 1)
    Item.where(detail_id: nil).update_all(detail_id: 1)
    Item.where(delivery_fee_id: nil).update_all(delivery_fee_id: 1)
    Item.where(prefecture_id: nil).update_all(prefecture_id: 1)
    Item.where(shipping_days_id: nil).update_all(shipping_days_id: 1)
    Item.where(price: nil).update_all(price: 300)

    change_column_null :items, :name, false
    change_column_null :items, :description, false
    change_column_null :items, :status_id, false
    change_column_null :items, :detail_id, false
    change_column_null :items, :delivery_fee_id, false
    change_column_null :items, :prefecture_id, false
    change_column_null :items, :shipping_days_id, false
    change_column_null :items, :price, false
  end
end