# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  belongs_to :category
  belongs_to :creator, class_name: 'User'
  validates :title, length: {in: 2..5, to_shot: i18n.t('.what'),
    too_long: t('.plums')}
  validates :body, length: {in: 2..5, to_shot: t('.what'),
    too_long: t('.plums')}

end
#title 5-255
#body 200-40
