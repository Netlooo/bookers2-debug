class Book < ApplicationRecord
  has_many :users
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
