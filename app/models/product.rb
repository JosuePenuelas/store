class Product < ApplicationRecord
  has_one_attached :image
  has_many :sale_items
  has_many :sales, through: :sale_items
  validates :name, presence: true
end
