# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
  end
  # test "the truth" do
  #   assert true
  # end
  test 'create Like by registred user' do
    @user = users(:one)
    @post = posts(:unliked_post)
    sign_in @user
    assert_difference("@post.likes.count", 1) do
      post post_likes_url @post
    end
  end
end
