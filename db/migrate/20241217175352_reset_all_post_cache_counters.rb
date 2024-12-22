class ResetAllPostCacheCounters < ActiveRecord::Migration[7.1]
    def up

    Post.all.each do |post|

      Post.reset_counters(post.id, :likes, :comments)

    end

  end
end