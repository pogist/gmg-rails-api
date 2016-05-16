class Product < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :price, :platform
end