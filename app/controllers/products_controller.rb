class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "show.html.erb"
  end

  def show
    @product = Product.find(params[:id])
    render "show.html.erb"
  end
end
