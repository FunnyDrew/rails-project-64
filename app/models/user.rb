# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, foreign_key: 'creator_id'
  has_many :post_commetns
  has_many :post_likes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
