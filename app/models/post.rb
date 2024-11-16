# frozen_string_literal: true

class Post < ApplicationRecord
  MAX_LENGTH_ON_INDEX_PAGE = 255

  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  validates :title, length: { in: 5..255 }
  validates :body, length: { in: 100..1000 }

  def cut
    "#{body.slice(0..MAX_LENGTH_ON_INDEX_PAGE)}..."
  end
end
