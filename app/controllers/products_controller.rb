class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :user_conditions, only: [:edit, :update]

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

  end

  def edit
    if @product.order.present?
      redirect_to root_path
    end
  end

  def update
    unless @product.order.present?
      if @product.update(product_params)
        redirect_to product_path
     else
       render :edit
     end
    else
      redirect_to root_path
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_explain, :price, :category_id, :condition_id, :consignor_area_id,
                                    :deliver_fee_id, :prepare_date_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def user_conditions
    redirect_to root_path unless @product.user == current_user
  end
end
