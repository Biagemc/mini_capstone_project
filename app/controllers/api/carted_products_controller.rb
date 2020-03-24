class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted",
    )
    if @carted_product.save
      render "show.json.jb"
    else
      render json: { errors: @carted_product.errors.full_messages }
    end
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    if @carted_product.save
      render json: { message: "successfully removed from shopping cart" }
    else
      render json: { errors: @carted_product.errors.full_messages }
    end
  end
end
