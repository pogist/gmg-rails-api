class User < ActiveRecord::Base
  has_many :products

  validates_presence_of :name, :email, :password, :location

  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  validates_uniqueness_of :email

  has_secure_password
end
