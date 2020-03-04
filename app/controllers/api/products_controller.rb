class Api::ProductsController < ApplicationController
  def all_products
    all_products = Product.all
    @products = []
    all_products.each do |item|
      @products << {
        name: item.name,
        description: item.description,
        price: item.price,
      }
    end
    render "my_product.json.jb"
  end
end
