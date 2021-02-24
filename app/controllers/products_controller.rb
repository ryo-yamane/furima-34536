class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.includes(:user).find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explain, :price, :category_id, :condition_id, :consignor_area_id,
                                    :deliver_fee_id, :prepare_date_id, :image).merge(user_id: current_user.id)
  end
end
