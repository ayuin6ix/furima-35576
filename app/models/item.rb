class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_day

  validates :name, :description, :price, :image,  presence: true
  
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

  with_options presence: true, numericality: { other_than: 1 } do
  
  validates :category_id
  validates :status_id
  validates :shipping_cost_id
  validates :shipping_day_id
  validates :prefecture_id
  
  end

end
