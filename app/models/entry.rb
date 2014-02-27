class Entry < ActiveRecord::Base
  validates_uniqueness_of :date, scope: :user_id
  validates_presence_of :date, :body, :user

  belongs_to :user

  has_many :comments, dependent: :destroy
end
