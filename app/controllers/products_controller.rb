class ProductsController < ApplicationController
  def index
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.new(params_product)
    if @product.save
      redirect to root_path
    end

  end

  private
  def params_product
    params.require(:product).permit()

end
