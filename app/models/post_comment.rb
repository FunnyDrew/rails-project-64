class PostComment < ApplicationRecord
  belongs_to :post
  has_ancestry
end
