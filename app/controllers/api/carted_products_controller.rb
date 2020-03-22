class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def create
    @cart = CartedProduct.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
    )
    if @cart.save
      render json: { message: "Product Created" }
    else
      render json: { errors: @cart.errors.full_messages }
    end
  end
end
