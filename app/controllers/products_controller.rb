class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "show.html.erb"
  end
end
