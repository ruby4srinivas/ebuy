class ProductType < ActiveRecord::Base
  has_one :products, dependent: :destroy
  validates_uniqueness_of :name
  validates_presence_of :name
end
