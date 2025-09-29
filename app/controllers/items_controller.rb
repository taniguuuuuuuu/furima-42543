class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :description,
      :detail_id,        # カテゴリー
      :status_id,        # 商品の状態
      :delivery_fee_id,  # 配送料負担
      :prefecture_id,    # 発送元の地域
      :shipping_days_id, # 発送までの日数
      :price
    )
  end
end
