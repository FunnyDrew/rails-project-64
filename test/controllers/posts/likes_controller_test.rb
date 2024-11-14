# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  # test "the truth" do
  #   assert true
  # end
  test 'create Like by registred user' do
    @user = users(:one)
    @post = posts(:unliked_post)
    sign_in @user
    assert_difference('@post.likes.count', 1) do
      post post_likes_url @post
    end
  end

  test 'delete Like by Liker' do
    @user = users(:one)
    @post = posts(:post_liked_by_user_one)
    sign_in @user
    assert_difference('@post.likes.count', -1) do
      delete post_like_url @post, @user
    end
  end

  test 'delete Like by other user' do
    @user = users(:two)
    @post = posts(:post_liked_by_user_one)
    sign_in @user
    assert_difference('@post.likes.count', 0) do
      delete post_like_url @post, @user
    end
  end
end
