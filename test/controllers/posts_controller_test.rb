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
      creator: @user.id,
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

  test 'should get edit' do
    sign_in @user
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    sign_in @user
    patch post_url(@post), params: { post: @attrs }
    old_post = Post.find_by title: @post.title
    assert_nil old_post
    updated_post = Post.find_by @attrs
    assert { updated_post }
    assert_redirected_to post_url(@post)
  end

  test 'delete post by user' do
    sign_in @user
    assert_difference('Post.count', -1) do
      delete post_url @post
    end
    assert_nil Post.find_by(id: @post.id)
  end

  test 'delete post by other user' do
    sign_in @user
    @second_user_post = posts(:two)
    assert_no_difference('Post.count') do
      delete post_url @second_user_post
    end
    assert_response :redirect
    assert { flash[:notice] == I18n.t('.posts.destroy.access_error') }
  end
end
