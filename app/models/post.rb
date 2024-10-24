class Post < ApplicationRecord
  has_many :comments, class_name: 'PostComment'
  belongs_to :category
  belongs_to :creator, class_name: 'User'
end
