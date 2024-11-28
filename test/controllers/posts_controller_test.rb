# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @user = users(:one)
    @category = categories(:one)
    @attrs = {
      title: Faker::Movies::Ghostbusters.character,
      body: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
      creator: @user,
      category_id: @category.id
    }
  end

  test 'should get index' do
    get root_url
    assert_response :success
  end

  test 'should redirect if user not signed' do
    get new_post_url
    assert_response :redirect
  end

  test 'should get new' do
    sign_in @user
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in @user
    post posts_url, params: { post: @attrs }

    post = Post.find_by @attrs
    assert { post }
    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end

  test 'delete post by not authenificate user' do
  end

  test 'delete post by other user' do
    sign_in @user
    @second_user_post = posts(:two)
    assert_difference('Post.count', 0) do
      delete post_url @post
    end
    assert_response :redirect
  end
end
