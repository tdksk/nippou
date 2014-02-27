class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :partnership
  has_one :partner, through: :partnership
  has_many :entries
end
