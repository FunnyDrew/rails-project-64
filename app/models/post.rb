# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :category
  belongs_to :creator, class_name: 'User'
end
