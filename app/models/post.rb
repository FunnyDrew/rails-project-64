# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  belongs_to :category
  belongs_to :creator, class_name: 'User'
end
