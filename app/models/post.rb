# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  validates :title, length: {in: 5..255}
  validates :body, length: {in: 100..1000}

end
#title 5-255
#body 200-40
