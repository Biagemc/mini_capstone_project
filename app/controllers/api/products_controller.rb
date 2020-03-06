class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name_input],
      description: params[:description_input],
      price: params[:price_input],
      image_url: params[:image_url_input],
    )
    @product.save
    render "show.json.jb"
  end

  def update
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    @product.name = params[:name_input] || @product.name
    @product.description = params[:description_input] || @product.description
    @product.price = params[:price_input] || @product.price
    @product.image_url = params[:image_url_input] || @product.image_url
    @product.save
    render "show.json.jb"
  end

  def destroy
    the_id = params[:id]
    product = Product.find_by(id: the_id)
    product.destroy
    render json: { message: "Product with id# #{the_id} was successfuly destroyed." }
  end
end
