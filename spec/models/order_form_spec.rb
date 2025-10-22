require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '購入できるとき' do
      it 'すべての項目が正しく入力されていれば購入できる' do
        expect(@order_form).to be_valid
      end

      it '建物名が空でも購入できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '購入できないとき' do
      it '郵便番号が空では購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「3桁-4桁」の形式でないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が未選択（id:1）では購入できない' do
        @order_form.prefecture_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村が空では購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では購入できない' do
        @order_form.addresses = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Addresses can't be blank")
      end

      it '電話番号が空では購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が9桁以下では購入できない' do
        @order_form.phone_number = '123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上では購入できない' do
        @order_form.phone_number = '123456789012'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号にハイフンがあると購入できない' do
        @order_form.phone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'トークンが空では購入できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
