class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, presence: true
  validates :description, length: { in: 10..500 }

  def is_discounted?
    price < 10
  end

  def tax
    tax_rate = 0.09
    return price * tax_rate
  end

  def total
    return price + tax
  end
end
