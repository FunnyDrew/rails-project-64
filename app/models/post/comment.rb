# frozen_string_literal: true
class Post
  class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_ancestry
  end
end
