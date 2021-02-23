class ProductsController < ApplicationController
  def index
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(product_params)
    if @products.save
      redirect to root_path
    end

  end

  private
  def product_params
   # params.require(:product).permit(:product_name, :product_explain, :price, :category_id, :condition_id, :consignor_area_id, :deliver_fee_id, :prepare_date_id).merge(:user_id: current_user.id)
  end

end
