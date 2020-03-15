class DeleteProductsImageUrl < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :image_url, :string
  end
end
