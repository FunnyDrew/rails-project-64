# frozen_string_literal: true
class Post
  class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post
  end
end
