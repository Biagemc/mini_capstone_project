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

  def single_item
    all_products = Product.all
    item_select = params[:item]
    is_avaiable = false
    all_products.each do |item|
      if item.name.downcase == item_select
        @product = {
          name: item.name,
          description: item.description,
          price: item.price,
        }
        is_avaiable = true
      end
    end
    if is_avaiable == false
      @product = { message: "Sorry, we don't have this item." }
    end

    render "single_product.json.jb"
  end
end
