class OrdersController < ApplicationController
  before_action :authenticate_user!, expect: [:create, :index]
  before_action :set_product, only: [:index, :create]

  def index
    @order_purchase = OrderPurchase.new
    if @product.order.present?
      redirect_to root_path
    else @current_user == @product.user
      redirect_to root_path
    end

  end

  def create
    @order_purchase = OrderPurchase.new(order_params)
    if @order_purchase.valid? 
      pay_item
      @order_purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_purchase).permit(:post_code, :consignor_area_id, :city_town, :building_name, :phone_number, :number).merge(
      user_id: current_user.id, product_id: params[:product_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
