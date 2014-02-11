class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  attr_accessible :email, :password, :password_confirmation
  has_many :point_line_items
end
