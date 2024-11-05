# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  test 'create comment by registred user' do
    skip
    @user = users(:one)
    @post = posts(:unliked_post)
    sign_in @user
    assert_difference("@post.likes.count", 1) do
      post post_likes_url @post
    end
  end
end
